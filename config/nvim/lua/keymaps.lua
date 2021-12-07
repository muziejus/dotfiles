-- Called from configure.nest
local M = {}

M.default = {
  -- Special keys
  -- Insert Date and time
  { mode = 'n', {
    { "<F3>", "i<C-R>=strftime('%Y-%m-%d %a %I:%M %p ')<CR><Esc>", options },
  }},
  { mode = 'i', {
    { "<F3>", "<C-R>=strftime('%Y-%m-%d %a %I:%M %p ')<CR><Esc>", options },
  }},
  { options = { expr = true }, 
    {
      -- Word wrap
      {'k', "v:count == 0 ? 'gk' : 'k'"},
      {'j', "v:count == 0 ? 'gj' : 'j'"},
    },
  },
  -- Split mappings
  {'<C-k>', ':TmuxNavigateUp<CR>'},
  {'<C-j>', ':TmuxNavigateDown<CR>'},
  {'<C-h>', ':TmuxNavigateLeft<CR>'},
  {'<C-l>', ':TmuxNavigateRight<CR>'},
  -- Center search results
  {'n', 'nzz'},
  {'N', 'Nzz'},
  {'*', '*zz'},
  {'#', '#zz'},
  {'g*', 'g*zz'},
  {'g#', 'g#zz'},
  {'G', 'Gzz'},

  { '<C-n>', ':NvimTreeToggle<CR>', mode = 'n' },
  { 'H', '^', mode = 'nv' },

  { '<leader>', 
    {
      -- Fugitive (from https://www.youtube.com/watch?v=PO6DxfGPQvw)
      {'gs', ':G<CR>'},
      {'gh', ':diffget //3<CR>'},
      {'gu', ':diffget //2<CR>'},
      {'gc', ':Git commit<CR>'},
      {'gpom', ':Git push origin main<CR>'},
      -- Telescope
      {'f', {
        { 'f', '<CMD>Telescope find_files<CR>'},
        { 'g', '<CMD>Telescope live_grep<CR>'},
        { 'b', '<CMD>Telescope buffers<CR>'},
        { 'h', '<CMD>Telescope help_tags<CR>'},
      }}
    },
  },
}

--After searching, pressing escape stops the highlight
--{("n", "<esc>", ":noh<cr><esc>", silent)

function M.get_cmp_mappings()
  local cmp = require('cmp')
  local luasnip = require('luasnip')

  return {
    ['<S-Tab>'] = require('cmp').mapping.select_prev_item(),
    ['<Tab>'] = require('cmp').mapping.select_next_item(),
    ['<C-p>'] = require('cmp').mapping.select_prev_item(),
    ['<C-n>'] = require('cmp').mapping.select_next_item(),
    ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
    ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
    ['<C-Space>'] = require('cmp').mapping.complete(),
    ['<C-e>'] = require('cmp').mapping.close(),
    ['<CR>'] = require('cmp').mapping.confirm {
      behavior = require('cmp').ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  }
end

return M
