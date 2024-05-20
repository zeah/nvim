return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  opts = {
    mappings = {
      comment_line = "<c-q>",
    },
    options = {
      custom_commentstring = function()
        return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
      end,
    },
  },
}
