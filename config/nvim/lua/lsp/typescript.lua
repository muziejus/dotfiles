require("lspconfig").tsserver.setup({
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = require("lsp.utils").on_attach,
  --[[
    cmd = { "typescript-language-server", "--stdio" }
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    init_options = {
      hostInfo = "neovim"
    }
    root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
  --]]
})
