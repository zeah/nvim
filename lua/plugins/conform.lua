return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters = opts.formatters or {}

    opts.formatters_by_ft.php = { "prettier_php" }
    opts.formatters_by_ft.css = { "prettier" }
    opts.formatters_by_ft.astro = { "prettier_astro" }
    opts.formatters_by_ft.typescriptreact = { "prettier" }
    opts.formatters_by_ft.javascript = { "prettier" }
    opts.formatters.prettier_php = {
      command = "prettier",
      args = {
        "--plugin=/usr/local/lib/node_modules/@prettier/plugin-php/src/index.mjs",
        "--parser=php",
        "--single-quote",
        "--braceStyle=1tbs",
      },
      condition = function()
        return vim.fn.executable("prettier") == 1
      end,
    }
    opts.formatters.prettier_astro = {
      command = "prettier",
      args = {
        "--plugin=/usr/local/lib/node_modules/prettier-plugin-astro/dist/index.js",
        "--parser=astro",
      },
      condition = function()
        return vim.fn.executable("prettier") == 1
      end,
    }
  end,
}
