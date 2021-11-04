local g = vim.g
local Plug = vim.fn['plug#']

vim.call("plug#begin", "~/.config/nvim/plugged")
-- Editing
   Plug 'thinca/vim-visualstar'
   Plug 'tpope/vim-surround'
   Plug 'windwp/nvim-autopairs'
-- Look and Feel
   Plug('arcticicestudio/nord-vim', {
     ['do'] = function()
       vim.cmd("colorscheme nord")
     end
   })
   Plug 'nvim-lualine/lualine.nvim'
-- Org
   Plug 'vimwiki/vimwiki'
-- Syntax
   Plug 'tpope/vim-commentary' -- creates gcc for commenting things
   Plug 'p00f/nvim-ts-rainbow' -- creates rainbow parens for Treesitter
   Plug('nvim-treesitter/nvim-treesitter', {
     ['do'] = function()
       vim.cmd(':TSUpdate')
     end
   })
-- Git
   Plug('lewis6991/gitsigns.nvim', {branch = 'main'})
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

-- rcup has to be run when adding new files here!
require("plugin-config.nord-vim")
require("plugin-config.vimwiki")
require("plugin-config.nvim-tree")
require("plugin-config.nvim-web-devicons")
require("plugin-config.gitsigns")
require("plugin-config.nvim-autopairs")
require("plugin-config.nvim-treesitter")
