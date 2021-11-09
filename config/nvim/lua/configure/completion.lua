return {
  'hrsh7th/nvim-cmp',
  requires = {
    'onsails/lspkind-nvim',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
  },
  after = { 'nvim-autopairs' },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
     snippet = {
       expand = function(args)
         require('luasnip').lsp_expand(args.body)
       end,
     },
      mapping = require('keymaps').get_cmp_mappings(),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        -- { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer' },
      },
      formatting = {
        format = require('lspkind').cmp_format({ with_text = true }),
      },
    })
  end,
}
