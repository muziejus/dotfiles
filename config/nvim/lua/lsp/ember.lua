-- local util = require'lspconfig.util'

require('lspconfig').ember.setup({
  on_attach = require('lsp.utils').on_attach,
  -- These are the defaults.
  -- cmd = { "ember-language-server", "--stdio" },
  -- filetypes = { "handlebars", "typescript", "javascript" },
  -- root_dir = util.root_pattern("ember-cli-build.js", ".git"),
})
