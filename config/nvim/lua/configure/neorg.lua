return {
  'nvim-neorg/neorg',
  after = "nvim-treesitter",
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.keybinds'] = {
          config = {
            default_keybinds = true,
            neorg_leader = '<Leader>o',
          },
        },
        ['core.norg.dirman'] = {
          config = {
            workspaces = {
              my_workspace = '/Users/moacir/Library/Mobile Documents/com~apple~CloudDocs/notes',
            },
          },
        },
        ['core.norg.concealer'] = {},
        ['core.norg.completion'] = {
          config = {
            engine = 'nvim-cmp'
          }
        },
      }
    }
  end,
  requires = 'nvim-lua/plenary.nvim'
}
