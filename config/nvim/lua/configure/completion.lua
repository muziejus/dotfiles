return {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'onsails/lspkind-nvim',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    -- compare: https://github.com/aspeddro/cmp-pandoc.nvim
    'jc-doyle/cmp-pandoc-references',
--    'hrsh7th/cmp-nvim-lua',
  },
 -- after = { 'nvim-autopairs' },
  config = function()
    local cmp = require'cmp'

    cmp.setup({
     snippet = {
       -- A snippet engine MUST be defined
       expand = function(args)
         require('luasnip').lsp_expand(args.body)
       end,
     },
      mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
     },
    sources = cmp.config.sources({
         { name = 'nvim_lsp' },
         { name = 'treesitter' },
         { name = 'luasnip' },
         -- { name = 'neorg' },
         { name = 'pandoc_references' },
       }, {
         -- { name = 'nvim_lua' },
         { name = 'path' },
         { name = 'buffer' },
         { name = 'spell' },
       }),
       formatting = {
         format = require('lspkind').cmp_format({ with_text = true }),
      },
    })

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    require('lspconfig')['sumneko_lua'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['tsserver'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['ember'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['html'].setup {
      capabilities = capabilities
    }
    -- require('lspconfig')['null_ls'].setup {
    --   capabilities = capabilities
    -- }
    require('lspconfig')['tailwindcss'].setup {
      capabilities = capabilities
    }
  end,
}
