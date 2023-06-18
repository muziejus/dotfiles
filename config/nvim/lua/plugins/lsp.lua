return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
                               -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },   -- Required
    { 'hrsh7th/cmp-buffer' },   -- Required
    { 'hrsh7th/cmp-path' },   -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    -- See snippets.lua for snippets.
    { "aspeddro/cmp-pandoc.nvim" },
    { "kdheepak/cmp-latex-symbols" },
    { "onsails/lspkind-nvim" },
  }
}
