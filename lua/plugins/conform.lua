-- local M = {}

-- Utility functions to check if a parser or config exists for Prettier
-- M.has_parser = function(ctx)
--   -- Logic to check if the filetype has a parser (e.g., check based on context)
--   return vim.fn.executable("prettier") == 1
-- end

-- M.has_config = function(ctx)
--   -- Check if a Prettier config file exists in the current project
--   local config_files = { ".prettierrc", "prettier.config.js", ".prettierrc.json" }
--   for _, file in ipairs(config_files) do
--     if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. file) == 1 then
--       M.config_file = file
--       return true
--     end
--   end
--   return false
-- end
-- M.config_file = ""
return {
  "stevearc/conform.nvim",
  optional = true,
  --@param opts ConformOpts
  opts = function(_, opts)
    -- local supported = { "php" }
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.php = { "prettier" }
    -- for _, ft in ipairs(supported) do
    --   opts.formatters_by_ft[ft] = { "prettier" }
    -- end
    -- Set default options
    -- opts.default_format_opts = {
    --   lsp_format = "fallback",
    -- }
    opts.formatters = opts.formatters or {}

    -- local args = { "--plugin=/usr/local/lib/node_modules/@prettier/plugin-php/src/index.mjs", "--parser=php" }
    -- if M.has_config() then
    --   table.insert(args, "--config")
    --   table.insert(args, vim.fn.getcwd() .. "/." .. M.config_file)
    --   -- table.insert(args, vim.fn.getcwd() .. "/.prettierrc")
    -- end
    -- print(vim.inspect(args))
    opts.formatters.prettier = {
      args = { "--plugin=/usr/local/lib/node_modules/@prettier/plugin-php/src/index.mjs", "--parser=php" },
      condition = function()
        return vim.fn.executable("prettier") == 1
        -- return M.has_parser(ctx)
        -- return M.has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
      end,
    }
  end,
}
