--
--
-- See keymaps file for lspconfig keymaps.
return {
  'neovim/nvim-lspconfig',
  requires = { 'jose-elias-alvarez/null-ls.nvim' },
  -- config = function()
  --     vim.cmd([[
  --       autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
  --       autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
  --       autocmd BufWritePre *.gjs lua vim.lsp.buf.formatting_sync(nil, 1000)
  --       autocmd BufWritePre *.gts lua vim.lsp.buf.formatting_sync(nil, 1000)
  --       autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
  --       autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
  --     ]])
  --   end
}
