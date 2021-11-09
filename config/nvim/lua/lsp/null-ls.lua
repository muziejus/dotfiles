local null_ls = require('null-ls')
local b = null_ls.builtins

local sources = {
  b.code_actions.gitsigns,
  -- b.diagnostics.eslint.with({
  --   command = 'eslint_d',
  -- }),
  -- b.formatting.prettierd.with({
    -- filetypes = {
    --   'html',
    --   'json',
    --   'javascript',
    --   'typescript',
    --   'javascriptreact',
    --   'typescriptreact',
    --   'scss',
    --   'css',
    -- },
  -- }),
  -- b.formatting.stylua,
  -- b.diagnostics.luacheck,
  b.formatting.shfmt.with({
    filetypes = { 'sh', 'zsh', 'bash' },
    args = { '-i', '2' },
  }),
  b.diagnostics.shellcheck.with({
    diagnostics_format = '#{m} [#{s}] [#{c}]',
  }),
}

if vim.fn.filereadable('./node_modules/.bin/stylelint') > 0 then
  table.insert(
    sources,
    b.formatting.stylelint.with({
      command = './node_modules/.bin/stylelint',
    })
  )
end

null_ls.config({
  sources = sources,
})

require('lspconfig')['null-ls'].setup({
  autostart = true,
  on_attach = require('lsp.utils').on_attach,
})

