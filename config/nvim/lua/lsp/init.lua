-- from https://github.com/mrjones2014/dotfiles/blob/master/.config/nvim/lua/lsp/init.lua

-- set diagnostics to update in insert mode
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
})

require('lsp.typescript')
require('lsp.html')

