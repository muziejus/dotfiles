return {
  "f-person/auto-dark-mode.nvim",
  config = function()
    local auto_dark_mode = require("auto-dark-mode")
    auto_dark_mode.setup({
      update_interval = 1000,
      set_dark_mode = function()
        vim.cmd([[
          set termguicolors
          let g:everforest_background = 'hard'
          let g:everforest_italic = 1
          let g:everforest_diagnostic_text_highlight = 1
        ]])
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme everforest")
      end,
      set_light_mode = function()
        vim.cmd([[
          set termguicolors
          let g:everforest_background = 'soft'
          let g:everforest_italic = 1
          let g:everforest_diagnostic_text_highlight = 1
        ]])
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme everforest")
      end,
    })
    auto_dark_mode.init()
  end,
}
