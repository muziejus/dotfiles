return {
  'kyazdani42/nvim-web-devicons',
  config = function()
    vim.g.nvim_tree_git_hl = 1
    require'nvim-web-devicons'.setup {
      default = true
    }
  end
}

