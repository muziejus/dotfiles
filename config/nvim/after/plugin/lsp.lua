local lsp = require('lsp-zero').preset("recommended")

lsp.set_server_config({
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
    }
  }
})

lsp.configure("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  -- local opts = { buffer = bufnr, remap = false }
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()

-- cmp is already configured using lsp-zero's defaults.
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select=true}),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
  sources = {
    {name = 'cmp_pandoc' },
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  formatting = {
    fileds = {'abbr', 'kind', 'menu'},
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '…',
    })
  },
})
