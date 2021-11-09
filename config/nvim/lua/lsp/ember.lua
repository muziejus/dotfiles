require('lspconfig').ember.setup({
  -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = require('lsp.utils').on_attach,
  --[[
    cmd = { "ember-language-server", "--stdio" }
    filetypes = { "handlebars", "typescript", "javascript" }
    root_dir = root_pattern("ember-cli-build.js", ".git")
  --]]
})
