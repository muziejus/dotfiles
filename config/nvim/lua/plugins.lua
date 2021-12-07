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
  use(require('configure.telescope'))
  use(require('configure.telescope-fzf-native'))
-- Editing
  use 'thinca/vim-visualstar'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired' -- [ and ] macros for moving around
  use(require('configure.autopairs'))
-- Text
  use 'kana/vim-textobj-user' -- define textobjs easily
  use 'reedes/vim-textobj-quote' -- for curly quotes
  use 'reedes/vim-textobj-sentence' -- for sentences
  use(require('configure.markdown'))

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- require("configure.lspsaga")
-- require("configure.toggleterm")
  
