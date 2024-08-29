-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set
--[[
 TODO:
  keymaps for surround
    use tpope/surround and create keymap for adding divs and formatting line in same keybinding

  add keymaps for marks
  set longer time on whichkey??
--]]

-- common keymaps
set({ "i", "n", "v" }, "<c-s>", vim.cmd.wall)
set({ "i", "n", "v" }, "<c-e>", "<end>")
set({ "i", "n", "v" }, "<c-a>", "<home>")

-- splits brackets to different lines with cursor in between
set("i", "<c-d>", '<cr><cr><up><esc>"_cc')

-- remapping f and F to hop
set({ "n" }, "f", ":HopWord<CR>", { silent = true })
set("n", "F", ":HopPatternCurrentLine<CR>", { silent = true })

-- remapping paste to be default no-copy
set("v", "P", "p", { noremap = true })
set("v", "p", "P", { noremap = true })

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

-- remapping marks
set("n", "M", "`")
set("n", "’", "mM", { noremap = true })
set("n", "‘", "mN", { noremap = true })
set("n", "›", "mB", { noremap = true })
set("n", "-", "`.", { noremap = true })

-- ENTER KEY
set("i", "<CR>", vim.cmd.stopinsert)
set("n", "<CR>", "a")

set("i", "√", function()
  vim.cmd("normal! o")
end, { silent = true })

set("i", "ª", function()
  vim.cmd("normal! O")
end, { silent = true })

-- go to nearest close bracket or quote
set({ "n" }, "<F18>", function()
  vim.fn.search([[\(["'`]\)]], "")
end, { silent = true })
set({ "i" }, "<F18>", function()
  vim.fn.search([[\(["'`]\)]], "e")
  vim.cmd("normal! l")
end, { silent = true })

set("i", "<F20>", function()
  vim.fn.search([[\([`'">\]})]\)]], "")
end, { silent = true })

set({ "n", "v" }, "<F20>", function()
  vim.fn.search([[\([`'">\]})]\)]])
end, { silent = true })

set("i", "<F19>", function()
  vim.fn.search([[\([`'"<\[{(]\)]], "b")
  -- vim.cmd("normal! h")
end, { silent = true })

set({ "n", "v" }, "<F19>", function()
  vim.fn.search([[\([`'"<\[{(]\)]], "b")
end, { silent = true })
set("n", "<leader>n", function()
  -- PHP
  if vim.bo.filetype == "php" then
    local text = "wp_die('<xmp>' . print_r(, true) . '</xmp>');"
    vim.api.nvim_put({ text }, "c", true, true)
    local cursor_position = vim.api.nvim_win_get_cursor(0)
    vim.api.nvim_win_set_cursor(0, { cursor_position[1], 25 })
    vim.cmd("startinsert") -- Enter insert mode if needed
  end
  -- JavaScript
  if vim.bo.filetype == "javascript" then
    local text = "console.log();"
    vim.api.nvim_put({ text }, "c", true, true)
    local cursor_position = vim.api.nvim_win_get_cursor(0)
    vim.api.nvim_win_set_cursor(0, { cursor_position[1], 12 })
    vim.cmd("startinsert") -- Enter insert mode if needed
  end
end, { desc = "Insert wp_die with print_r and move cursor to 'hi'" })
