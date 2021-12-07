return {
  'plasticboy/vim-markdown',
  config = function()
    -- vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_folding_level = 3
    -- vim.g.vim_markdown_conceal = 0 -- To stop making *bold* look bold
    vim.g.vim_markdown_frontmatter = 1 -- for yaml highlighting
    vim.g.vim_markdown_new_list_item_indent = 2
    vim.g.vim_markdown_no_extensions_in_markdown = 1 -- for ge hopping
  end
} 
