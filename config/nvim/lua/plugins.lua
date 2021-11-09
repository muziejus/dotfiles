-- rcup has to be run when adding new files to configure!

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use(require('configure.nest'))
  -- Look and Feel
  use(require('configure.tmux'))
  use(require("configure.nord-vim"))
  use(require('configure.web-devicons'))
  use(require('configure.lualine'))
-- Org
  use(require('configure.vimwiki'))
-- Git
  use(require('configure.gitsigns')) 
  use 'tpope/vim-fugitive' -- Git wrapper.
  use 'tpope/vim-rhubarb' -- GitHub
-- Autocomplete, syntax, and LSP
  use 'tpope/vim-commentary' -- creates gcc for commenting things
  use(require('configure.lspconfig'))
  use(require('configure.completion'))
  use(require('configure.trouble'))
  use(require('configure.treesitter'))
  -- use 'glepnir/lspsaga.nvim'
-- Filesystem
  use 'tpope/vim-eunuch' -- Work on filesystem via buffers
  use 'tpope/vim-projectionist'
  use(require('configure.nvim-tree'))
-- Utilities / Dependencies
  -- use 'akinsho/toggleterm.nvim'
  use 'nvim-lua/plenary.nvim'
-- Editing
  use 'thinca/vim-visualstar'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired' -- [ and ] macros for moving around
  use(require('configure.autopairs'))

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- require("configure.lspsaga")
-- require("configure.toggleterm")
  
