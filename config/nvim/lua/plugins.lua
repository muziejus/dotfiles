local Plug = vim.fn['plug#']

vim.call("plug#begin", "~/.config/nvim/plugged")
-- Editing
   Plug 'thinca/vim-visualstar'
   Plug 'tpope/vim-surround'
   Plug 'tpope/vim-unimpaired' -- [ and ] macros for moving around
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
   Plug('lewis6991/gitsigns.nvim', { branch = 'main' })
   Plug 'tpope/vim-fugitive' -- Git wrapper.
   Plug 'tpope/vim-rhubarb' -- GitHub
-- Autocomplete + LSP
   Plug 'neovim/nvim-lspconfig'
   Plug 'glepnir/lspsaga.nvim'
   Plug 'hrsh7th/nvim-cmp' -- autocompletion plugin
   Plug 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
   Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
   Plug 'L3MON4D3/LuaSnip' -- Snippets plugin
-- Filesystem
   Plug 'tpope/vim-eunuch' -- Work on filesystem via buffers
   Plug 'tpope/vim-projectionist'
   Plug 'kyazdani42/nvim-web-devicons'
   Plug 'kyazdani42/nvim-tree.lua'
-- Utilities / Dependencies
   Plug 'akinsho/toggleterm.nvim'
   Plug('folke/trouble.nvim', { branch = 'main' })
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
require("plugin-config.nvim-lspconfig")
require("plugin-config.nvim-cmp")
require("plugin-config.trouble")
require("plugin-config.lspsaga")
require("plugin-config.toggleterm")