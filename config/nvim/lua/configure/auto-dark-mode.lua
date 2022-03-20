return {
  'f-person/auto-dark-mode.nvim',
  config = function()
    local auto_dark_mode = require'auto-dark-mode'
    auto_dark_mode.setup({
      update_interval = 1000,
      set_dark_mode = function()
        vim.cmd([[
          let g:nord_cursor_line_number_background = 1
          let g:nord_bold_vertical_split_line = 1
          let g:nord_italic = 1
          let g:nord_italic_comments = 1
        ]])
        vim.api.nvim_set_option('background', 'dark')
        vim.cmd('colorscheme nord')
      end,
      set_light_mode = function()
        vim.api.nvim_set_option('background', 'light')
        vim.cmd('colorscheme snow')
      end,
    })
    auto_dark_mode.init()
  end
}
