return {
  'vim-pandoc/vim-pandoc',
  config = function()
    vim.g['pandoc#biblio#use_bibtool'] = 1
    vim.g['pandoc#biblio#sources'] = 'ycbGg'
  end,
}
