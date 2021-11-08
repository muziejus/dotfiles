return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require'gitsigns'.setup {
      numhl = true,
      signcolumn = false,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 100,
      }
    }
  end
}

