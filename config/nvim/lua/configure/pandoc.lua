-- Eventually replace with:
-- https://github.com/aspeddro/pandoc.nvim

-- return {
--   'vim-pandoc/vim-pandoc',
--   config = function()
--     vim.g['pandoc#biblio#use_bibtool'] = 1
--     vim.g['pandoc#biblio#sources'] = 'ycbGg'
--   end,
-- }
--
return {
  "aspeddro/cmp-pandoc.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
  },
}
