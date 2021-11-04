local g = vim.g
local Plug = vim.fn['plug#']

vim.call("plug#begin", "~/.config/nvim/plugged")
-- Editing
   Plug 'thinca/vim-visualstar'
   Plug 'tpope/vim-surround'
-- Look and Feel
   Plug('arcticicestudio/nord-vim', {
     ['do'] = function()
       vim.cmd("colorscheme nord")
     end
   })
   Plug 'itchyny/lightline.vim'
   Plug('nvim-treesitter/nvim-treesitter', {
     ['do'] = function()
       vim.cmd(':TSUpdate')
     end
   })
   -- Plug 'ryanoasis/vim-devicons' -- works with NERDTree
-- Org
   Plug 'vimwiki/vimwiki'
-- Syntax
   Plug 'tpope/vim-commentary' -- creates gcc for commenting things
-- Git
   Plug('lewis6991/gitsigns.nvim', {branch = 'main'})
   -- Plug 'airblade/vim-gitgutter' -- shows changes in gutter
   Plug 'tpope/vim-fugitive' -- Git wrapper.
-- Autocomplete
   Plug 'neovim/nvim-lspconfig'
-- Filesystem
   Plug 'tpope/vim-projectionist'
   Plug 'kyazdani42/nvim-web-devicons'
   Plug 'kyazdani42/nvim-tree.lua'
-- Utilities / Dependencies
   Plug 'nvim-lua/plenary.nvim'
vim.call("plug#end")

-- Per Plugin
  -- Nord
  vim.cmd("colorscheme nord")

  -- lightline
  g.lightline = { colorscheme = "nord" }

  -- vimwiki
  g.vimwiki_list = {{
    path = '/Users/moacir/Dropbox/notes', 
    syntax = 'markdown', 
    ext = '.md'}}

  -- nvim-tree.lua
  require'nvim-tree'.setup {}
  -- nvim-web-devicons
  g.nvim_tree_git_hl = 1
  require'nvim-web-devicons'.setup {
    default = true
  }
  -- gitsigns
  require'gitsigns'.setup {
    numhl = true
  }
