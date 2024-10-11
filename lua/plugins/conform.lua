local M = {}

-- Utility functions to check if a parser or config exists for Prettier
M.has_parser = function(ctx)
  -- Logic to check if the filetype has a parser (e.g., check based on context)
  return vim.fn.executable("prettier") == 1
end

M.has_config = function(ctx)
  -- Check if a Prettier config file exists in the current project
  local config_files = { ".prettierrc", "prettier.config.js", ".prettierrc.json" }
  for _, file in ipairs(config_files) do
    if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. file) == 1 then
      return true
    end
  end
  return false
end
return {
  "stevearc/conform.nvim",
  optional = true,
  --@param opts ConformOpts
  opts = function(_, opts)
    local supported = { "php" }
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    for _, ft in ipairs(supported) do
      opts.formatters_by_ft[ft] = { "prettier" }
    end

    opts.formatters = opts.formatters or {}
    opts.formatters.prettier = {
      condition = function(_, ctx)
        return M.has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
      end,
    }
  end,
}
