-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.guifont = { "Fira Code", "h18" }
opt.scrolloff = 14
opt.tabstop = 2
opt.iskeyword:append("-")
opt.hlsearch = false
opt.incsearch = true
opt.autowrite = false
opt.signcolumn = "yes"
opt.spell = true
opt.spelllang = { "en_us", "nb" }
