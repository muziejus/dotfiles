return {
  'LionC/nest.nvim',
  config = function()
    local nest = require('nest')
    local keymaps = require('keymaps')
    nest.applyKeymaps(keymaps.default)
    -- nest.applyKeymaps {
    --   { '<F4>', ':NvimTreeToggle<CR>', mode = 'n' },
    -- }
  end,
}
