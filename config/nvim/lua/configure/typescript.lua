return {
  "jose-elias-alvarez/typescript.nvim",
  config = function()
    require("typescript").setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      disable_formatting = false, -- disable tsserver's formatting capabilities
      go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure.
      },
      debug = false, -- enable debug logging for commands
      server = { -- pass options to lspconfig's setup method
        --     on_attach = ...,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = require("lsp.utils").on_attach,
      },
    })
  end,
}
