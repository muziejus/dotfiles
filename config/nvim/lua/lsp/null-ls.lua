local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
  b.code_actions.gitsigns,
  -- b.diagnostics.eslint.with({
  --   command = 'eslint_d',
  -- }),
  b.formatting.prettierd.with({
    env = {
      PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
    },
    prefer_local = "node_modules/.bin",
    filetypes = {
      "html",
      "json",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "scss",
      "css",
    },
  }),
  b.formatting.stylua,
  -- b.diagnostics.luacheck,
  b.formatting.shfmt.with({
    filetypes = { "sh", "zsh", "bash" },
    args = { "-i", "2" },
  }),
  b.diagnostics.shellcheck.with({
    diagnostics_format = "#{m} [#{s}] [#{c}]",
  }),
  -- b.completion.spell,
}

if vim.fn.filereadable("./node_modules/.bin/stylelint") > 0 then
  table.insert(
    sources,
    b.formatting.stylelint.with({
      command = "./node_modules/.bin/stylelint",
    })
  )
end

null_ls.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    end
  end,
  sources = sources,
})
