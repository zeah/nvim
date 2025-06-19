return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-o>",
        dismiss = "<C-p>",
        accept_line = "<C-l>",
        next = "<C-n>",
      },
    },
    panel = {
      enabled = true,
      auto_refresh = true,
      layout = { position = "right", ratio = 0.2 },
      keymap = {
        jump_prev = "<C-k>",
        jump_next = "<C-j>",
        accept = "<C-o>",
        refresh = "<C-r>",
        open = "<c-g>",
      },
    },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
