-- rcup has to be run when adding new files to configure!

local fn = vim.fn
-- Install packer if it's not available
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- Keybindings
  use(require("configure.kitty-navigator"))
  use(require("configure.which-key"))
  -- Autocomplete, syntax, and LSP
  use(require("configure.lspconfig"))
  use(require("configure.completion"))
  use(require("configure.treesitter"))
  use(require("configure.trouble"))
  use(require("configure.typescript"))
  -- -- use(require("configure.lsp-signature")) -- conflicts with nvim-cmp
  -- -- Look and Feel
  use(require("configure/auto-dark-mode"))
  use("sainnhe/everforest")
  use("fladson/vim-kitty")
  use("tpope/vim-commentary") -- creates gcc for commenting things
  use(require("configure.web-devicons"))
  use(require("configure.lualine"))
  use(require("configure.tabline"))
  use(require("configure.indent-blankline"))
  -- -- Utilities / Dependencies
  use(require("configure.telescope"))
  use(require("configure.telescope-fzf-native"))
  use(require("configure.toggleterm"))
  use("nvim-lua/plenary.nvim")
  -- -- Org
  use(require("configure.wiki"))
  -- -- Editing
  use(require("configure.zen-mode"))
  use(require("configure.twilight"))
  use("thinca/vim-visualstar")
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired") -- [ and ] macros for moving around
  use(require("configure.autopairs"))
  -- -- Git
  use(require("configure.gitsigns"))
  use("tpope/vim-fugitive") -- Git wrapper.
  use("tpope/vim-rhubarb") -- GitHub
  -- -- Filesystem
  use("tpope/vim-eunuch") -- Work on filesystem via buffers
  use("tpope/vim-projectionist")
  use(require("configure.nvim-tree"))
  use("chazy/dirsettings") -- for autocommitting wiki.
  -- -- Text
  use("kana/vim-textobj-user") -- define textobjs easily
  use("reedes/vim-textobj-quote") -- for curly quotes
  use("reedes/vim-textobj-sentence") -- for sentences
  -- use(require("configure.pandoc"))
  -- -- use("vim-pandoc/vim-pandoc-syntax")

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
