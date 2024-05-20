-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set

-- common keymaps
set({ "i", "n", "v" }, "<c-s>", vim.cmd.wall)
set({ "i", "n", "v" }, "<c-e>", "<end>")
set({ "i", "n", "v" }, "<c-a>", "<home>")

-- splits brackets to different lines with cursor in between
set("i", "<c-d>", '<cr><cr><up><esc>"_cc')

-- remapping f and F to hop
set({ "n", "v" }, "f", "<esc>:HopWord<CR>", { silent = true })
set("n", "F", "<esc>:HopPatternCurrentLine<CR>", { silent = true })

-- remapping diagnostic
set("n", "<c-l>", "<cmd>lua vim.diagnostic.goto_next({float = {source = true}})<cr>")

-- remapping visual mode keys
set("n", "v", "V")
set("n", "V", "v")
set("v", "v", "3j")
set("v", "V", "3k")
-- mark one word
set("n", "<c-v>", "viw")
-- remapping visual block
set("n", "<leader>vb", "<c-v>")
-- exit visual mode
set("v", "<CR>", "<esc>")

-- rempping screen movement
set("n", "N", "Nzzzv")
set("n", "n", "nzzzv")
set("n", "<c-d>", "<c-d>zz")
set("n", "<c-u>", "<c-u>zz")

-- fixing combine lines
set("n", "J", "mzJ`z")

-- replace all matched words (primeagen)
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>ls", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- moving lines in visual mode
set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- ENTER KEY
set("i", "<CR>", vim.cmd.stopinsert)
set("n", "<CR>", "a")

-- remapping new line in insert mode
set("i", "<C-j>", "<Esc>o")
set("i", "<C-k>", "<Esc>O")
set("i", "<C-w>", "<CR>")
