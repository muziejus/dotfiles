-- local util = require'lspconfig.util'

require("lspconfig").ember.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = require("lsp.utils").on_attach,
  -- These are the defaults.
  -- cmd = { "ember-language-server", "--stdio" },
  -- filetypes = { "handlebars", "typescript", "javascript" },
  -- root_dir = util.root_pattern("ember-cli-build.js", ".git"),
})
