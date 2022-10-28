require("lspconfig").html.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = require("lsp.utils").on_attach,
  --[[
    cmd = { "vscode-html-language-server", "--stdio" }
    filetypes = { "html" }
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      }
    }
    root_dir = function(fname)
          return util.root_pattern('package.json', '.git')(fname) or util.path.dirname(fname)
        end,
    settings = {}
  --]]
})
