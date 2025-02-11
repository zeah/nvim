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
      keymap = {
        ["C-Space"] = { "show" },
        -- ["C-i"] = {
        --   function(cmp)
        --     cmp.show({ providers = { "snippets" } })
        --   end,
        -- },
      },
    },
  },
}
