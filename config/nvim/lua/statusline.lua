require('lualine').setup {
  options = {
    theme = "nord"
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    -- lualine_b = {'branch'},
    -- lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}
