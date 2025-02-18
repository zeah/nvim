return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          auto_show = false,
        },
        ghost_text = {
          enabled = false,
        },
      },
      sources = {
        default = { "lsp", "buffer", "path", "snippets", "wp_actions", "wp_filters" },
        providers = {
          wp_actions = {
            name = "wp_actions",
            module = "wordpress.actions",
          },
          wp_filters = {
            name = "wp_filters",
            module = "wordpress.filters",
          },
        },
      },
      keymap = {
        ["C-Space"] = { "show" },
        ["C-b"] = { "show_documentation" },
        -- ["C-i"] = {
        --   function(cmp)
        --     cmp.show({ providers = { "snippets" } })
        --   end,
        -- },
      },
    },
  },
}
