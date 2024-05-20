return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = " ", right = " " },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 4 } },
        lualine_x = { "progress" },
        -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { "location" },
        lualine_z = { { "datetime", style = "%H:%M" } },
      },
    }
  end,
}
