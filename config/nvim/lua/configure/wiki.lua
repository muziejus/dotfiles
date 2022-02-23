return {
  'lervag/wiki.vim',
  config = function()
    -- vim.g.wiki_root = "/Users/moacir/Documents/notes/"
    -- vim.g.wiki_filetypes = ["md"]
    -- vim.g.wiki_global_load = 0
    -- vim.g.wiki_link_extension = ".md"
    -- vim.g.wiki_write_on_nav = 1
    vim.cmd([[
      let g:wiki_root = "/Users/moacir/Documents/notes/"
      let g:wiki_filetypes = ["md"]
      let g:wiki_link_extension = ".md"
      let g:wiki_write_on_nav = 1
      let g:wiki_global_load = 0
      let g:wiki_cache_persistent = 0
    ]])
  end
}

