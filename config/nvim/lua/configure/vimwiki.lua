return {
  'vimwiki/vimwiki',
  config = function() 
    -- vim.cmd([[
    --   let g:vimwiki_list=[{'path': '/Users/moacir/Dropbox/notes',
    --   \ 'syntax': 'markdown', 'ext': '.wikimd'}]
    -- ]])
    vim.g.vimwiki_list = {{
      path = '/Users/moacir/Dropbox/notes', 
      syntax = 'markdown', 
      ext = '.wikimd'}} -- This will hopefully stop treating every md file as a vimwiki file.
    vim.g.vimwiki_global_ext = 0
    vim.cmd([[
    let g:vimwiki_ext2syntax = {}
    ]])
    -- vim.cmd([[
    -- let g:vimwiki_ext2syntax = {'.wikimd': 'markdown'}
    -- ]])
    -- vim.cmd([[
    --   let g:vimwiki_global_ext = 0
    -- ]])
  end
}

