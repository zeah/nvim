-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd.colorscheme("catppuccin")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "o" })
  end,
  desc = "Deaktiver automatisk kommentarinnsetting på nye linjer",
})
-- local function setup_lsp_diags()
--   vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
--     signs = true,
--     update_in_insert = false,
--     underline = true,
--   })
-- end
-- setup_lsp_diags()
-- local function log_yanked_text(yanked_text)
--   -- local log_file = "~/nvim/yanked_text.log" -- Change this to your desired file path
--   local log_file = os.getenv("HOME") .. "/nvim/yanked_text.log" -- Use full path for the log file
--   -- Escape the text to handle any special characters in shell commands
--   yanked_text = vim.fn.escape(yanked_text, '"')
--   -- Append the yanked text to the log file
--   os.execute('echo "' .. yanked_text .. '" >> ' .. log_file)
-- end
--
-- -- Autocommand for TextYankPost event
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     -- Get the text that was yanked
--     local yanked_text = table.concat(vim.fn.getreg('"', 1, true), "\n")
--     log_yanked_text(yanked_text)
--   end,
-- })
