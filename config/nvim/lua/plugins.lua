-- rcup has to be run when adding new files to configure!

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use(require('configure.nest'))
  -- Look and Feel
  use(require("configure.nord-vim"))
  -- Org
  use(require('configure.vimwiki'))
  -- Syntax
  use 'tpope/vim-commentary' -- creates gcc for commenting things
  -- use 'p00f/nvim-ts-rainbow' -- creates rainbow parens for Treesitter
--    Plug('nvim-treesitter/nvim-treesitter', {
--      ['do'] = function()
--        vim.cmd(':TSUpdate')
--      end
--    })
  -- Git
  use(require('configure.gitsigns')) 
  use 'tpope/vim-fugitive' -- Git wrapper.
  use 'tpope/vim-rhubarb' -- GitHub
-- -- Autocomplete + LSP
  use(require('configure.lspconfig'))
  use(require('configure.completion'))
--    use 'glepnir/lspsaga.nvim'
  -- Filesystem
  use 'tpope/vim-eunuch' -- Work on filesystem via buffers
  use 'tpope/vim-projectionist'
  use(require('configure.nvim-web-devicons'))
  use(require('configure.nvim-tree'))
  -- Utilities / Dependencies
  -- use 'akinsho/toggleterm.nvim'
  --    Plug('folke/trouble.nvim', { branch = 'main' })
  use 'nvim-lua/plenary.nvim'
  -- Editing
  use 'thinca/vim-visualstar'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired' -- [ and ] macros for moving around
  -- use 'windwp/nvim-autopairs'
  -- use 'nvim-lualine/lualine.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- require("configure.nvim-autopairs")
-- require("configure.nvim-treesitter")
-- require("configure.trouble")
-- require("configure.lspsaga")
-- require("configure.toggleterm")
  
