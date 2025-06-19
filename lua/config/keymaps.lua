-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set

set(
  "n",
  "<leader>rk",
  ":source ~/.config/nvim/lua/config/keymaps.lua<CR>",
  { silent = true, noremap = true, desc = "Reload keymaps" }
)

-- keys = {
--     {
--       "<leader>cp",
--       function()
--         require("copilot.panel").open()
--       end,
--       desc = "Open Copilot Panel"
--     },
--   },
set("n", "<leader>cp", function()
  require("copilot.panel").open({})
end, { desc = "Open Copilot Panel" })

set("n", "<leader>c,", "A,<esc>", { noremap = true, silent = true, desc = "Add comma at end of line" })
set("n", "<leader>c;", "A;<esc>", { noremap = true, silent = true, desc = "Add semi-colon at end of line" })

-- common key maps with other programs
set({ "i", "n", "v" }, "<c-s>", vim.cmd.wall)
set({ "i", "n", "v" }, "<c-e>", "<end>")
set({ "i", "n", "v" }, "<c-a>", "<home>")

-- remapping diagnostic
set("n", "<C-l>", "<CMD>lua vim.diagnostic.goto_next({float = {source = true}})<cr>")

-- set("i", "<c-7>", "{<CR>}<esc>O")
-- set("i", "<c-8>", "[<CR>]<esc>O")
-- set("n", "<c-0>", "A,<esc>")
-- set("i", "<c-0>", "<end>,")
-- set("n", "<c-9>", "A;<esc>")
-- set("i", "<c-9>", "<end>;")

-----------------
-- visual mode --
-----------------
-- remapping visual mode keys
set("n", "v", "V")
set("n", "V", "v")
set("v", "v", "3j")
set("v", "V", "3k")
-- remapping visual block
-- set("n", "<leader>vb", "<c-v>")
-- remapping paste to be default no-copy
set("v", "P", "p", { noremap = true })
set("v", "p", "P", { noremap = true })
-- exit visual mode
set("v", "<CR>", "<ESC>")

-- -- go to nearest close bracket or quote
-- set({ "n" }, "<F18>", function()
--   vim.fn.search([[\(["'`]\)]], "")
-- end, { silent = true })
-- set({ "i" }, "<F18>", function()
--   vim.fn.search([[\(["'`]\)]], "e")
--   vim.cmd("normal! l")
-- end, { silent = true })
--
-- set("i", "<F20>", function()
--   vim.fn.search([[\([`'">\]})]\)]], "")
-- end, { silent = true })
--
-- set({ "n", "v" }, "<F20>", function()
--   vim.fn.search([[\([`'">\]})]\)]])
-- end, { silent = true })

-- set("i", "<F19>", function()
--   vim.fn.search([[\([`'"<\[{(]\)]], "b")
--   -- vim.cmd("normal! h")
-- end, { silent = true })
--
-- set({ "n", "v" }, "<F19>", function()
--   vim.fn.search([[\([`'"<\[{(]\)]], "b")
-- end, { silent = true })
--
-- set({ "n" }, "<S-F8>", function()
--   vim.fn.search([[\(["'`]\)]], "")
-- end, { silent = true })
-- set({ "i" }, "<S-F8>", function()
--   vim.fn.search([[\(["'`]\)]], "e")
--   vim.cmd("normal! l")
-- end, { silent = true })
--
-- set("i", "<S-F10>", function()
--   vim.fn.search([[\([`'">\]})]\)]], "")
-- end, { silent = true })
--
-- set({ "n", "v" }, "<S-F10>", function()
--   vim.fn.search([[\([`'">\]})]\)]])
-- end, { silent = true })
--
-- set("i", "<S-F9>", function()
--   vim.fn.search([[\([`'"<\[{(]\)]], "b")
--   -- vim.cmd("normal! h")
-- end, { silent = true })
--
-- set({ "n", "v" }, "<S-F9>", function()
--   vim.fn.search([[\([`'"<\[{(]\)]], "b")
-- end, { silent = true })
-- set("n", "<leader>m", function()
--   -- PHP
--   if vim.bo.filetype == "php" then
--     local text = "wp_die('<xmp>' . print_r(, true) . '</xmp>');"
--     vim.api.nvim_put({ text }, "c", true, true)
--     local cursor_position = vim.api.nvim_win_get_cursor(0)
--     vim.api.nvim_win_set_cursor(0, { cursor_position[1], 25 })
--     vim.cmd("startinsert") -- Enter insert mode if needed
--   end
--   -- JavaScript
--   if vim.bo.filetype == "javascript" then
--     local text = "console.log();"
--     vim.api.nvim_put({ text }, "c", true, true)
--     local cursor_position = vim.api.nvim_win_get_cursor(0)
--     vim.api.nvim_win_set_cursor(0, { cursor_position[1], 12 })
--     vim.cmd("startinsert") -- Enter insert mode if needed
--   end
-- end, { desc = "Insert wp_die with print_r and move cursor to 'hi'" })
--
-- set("n", "", ":cnext<CR>")
-- set("n", "<M-k>", ":cprev<CR>")
-- set("n", "√", "<cmd>cnext<CR>")
-- set("n", "ª", "<cmd>cprev<CR>")

-----------
-- marks --
-----------
-- remapping marks
set("n", "M", "`")
set("n", "’", "mM", { noremap = true })
set("n", "‘", "mN", { noremap = true })
set("n", "›", "mB", { noremap = true })
set("n", "-", "g;", { noremap = true })

-------------------
-- editing flows --
-------------------
-- clones line, adds it above and comments out the original
-- often when I change one line I like to see the old line while editing.
set("n", "gcl", "yygccP", { remap = true, desc = "Clone line and comment out original" })

-- splits brackets to different lines with cursor in between
-- this is a need all the time
set("i", "<C-d>", '<CR><CR><UP><ESC>"_cc')

-- enter key
-- yea
set("i", "<CR>", vim.cmd.stopinsert)
set("n", "<CR>", "a")
set("n", "<M-CR>", "i")

-- new line below: option + j
set("i", "√", function()
  vim.cmd("normal! o")
end, { silent = true })

-- new line above: option + k
set("i", "ª", "<esc><up>o", { silent = true })

-- search for word under cursor in buffer
vim.keymap.set("n", "<C-f>", function()
  local current_word = vim.fn.expand("<cword>")
  vim.fn.setreg("/", "\\<" .. current_word .. "\\>")
  vim.cmd("normal! n")
end, { noremap = true, silent = true, desc = "Søk etter ord under markøren og gå til neste forekomst" })

-- remapping f and F to hop
set("n", "f", ":HopWord<CR>", { silent = true })
set("n", "F", ":HopPatternCurrentLine<CR>", { silent = true })

------------------
-- theprimeagen --
------------------
-- rempping screen movement
set("n", "N", "Nzzzv")
set("n", "n", "nzzzv")
set("n", "<C-d>", "<c-d>zz")
set("n", "<C-u>", "<c-u>zz")

-- fixing combine lines
set("n", "J", "mzJ`z")

-- replace all matched words
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>ls", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- moving lines in visual mode
set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-------------
-- plugins --
-------------
-- undo tree plugin
set("n", "<LEADER>xu", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
