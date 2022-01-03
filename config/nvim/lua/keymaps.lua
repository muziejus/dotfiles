vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    f = {
      -- Telescope
      name = "+file",
      f = { "<CMD>Telescope find_files<CR>", "Find File" },
      g = { '<CMD>Telescope live_grep<CR>', "Grep Files"},
      b = { '<CMD>Telescope buffers<CR>', "Find Buffers"},
      h = { '<CMD>Telescope help_tags<CR>', "Help Tags"},
      r = { '<CMD>Telescope oldfiles<CR>', "Open Recent File"},
      n = { '<CMD>enew<CR>', "New File" },
    },
    g = {
      -- Git
      name = "+git",
      s = { "<CMD>G<CR>", "git status" },
      h = { "<CMD>diffget //3<CR>", "diffget 3" },
      u = { "<CMD>diffget //2<CR>", "diffget 2" },
      c = { "<CMD>Git commit<CR>", "git commit" },
      pom = { "<CMD>Git push origin main<CR>", "git commit origin main" },
    },
    x = {
      -- Trouble
      name = "+trouble",
      x = { "<CMD>TroubleToggle<CR>", "Toggle Trouble" },
      q = { "<CMD>TroubleToggle quickfix<CR>", "Quickfix" },
      l = { "<CMD>TroubleToggle loclist<CR>", "Loclist" },
      d = { "<CMD>TroubleToggle document_diagnostics<CR>", "List Document Diagnostics" },
      w = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "List Workspace Diagnostics" },
      -- {'gR', '<cmd>TroubleToggle lsp_references<cr>'},
    },
    i = {
      name = "+insert",
      d = {"i<C-R>=strftime('%Y-%m-%d %a %I:%M %p ')<CR><Esc>", "Insert Current Time" },
    },
  },
})

--  -- Special keys
--  -- Insert Date and time
--  { options = { expr = true }, 
--    {
--      -- Word wrap
--      {'k', "v:count == 0 ? 'gk' : 'k'"},
--      {'j', "v:count == 0 ? 'gj' : 'j'"},
--    },
--  },
--  { mode = 'n', options = { noremap = true, silent = true},
--    {
--      -- LSPconfig
--      -- {'<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
--      -- {'K', '<cmd>lua vim.lsp.buf.hover()<CR>'},
--      -- {'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'},
--      -- {'<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>'},
--      -- {'gd', '<cmd>lua vim.lsp.buf.definition()<CR>'},
--      -- {'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>'},
--      -- {'<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'},
--      -- {'<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'},
--      -- {'<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'},
--      -- {'<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>'},
--      -- {'<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>'},
--      -- {'gr', '<cmd>lua vim.lsp.buf.references()<CR>'},
--      -- {'<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>'},
--      -- {'[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>'},
--      -- {']d', '<cmd>lua vim.diagnostic.goto_next()<CR>'},
--      -- {'<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>'},
--      -- {'<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>'}, 
--    }
--  },
--  -- Split mappings
--  {'<C-k>', ':TmuxNavigateUp<CR>'},
--  {'<C-j>', ':TmuxNavigateDown<CR>'},
--  {'<C-h>', ':TmuxNavigateLeft<CR>'},
--  {'<C-l>', ':TmuxNavigateRight<CR>'},
--  -- Center search results
--  {'n', 'nzz'},
--  {'N', 'Nzz'},
--  {'*', '*zz'},
--  {'#', '#zz'},
--  {'g*', 'g*zz'},
--  {'g#', 'g#zz'},
--  {'G', 'Gzz'},

--  { '<C-n>', ':NvimTreeToggle<CR>', mode = 'n' },
--  { 'H', '^', mode = 'nv' },

--  { '<leader>', 
--    {
--      -- Telescope
--    },
--  },
--}

----After searching, pressing escape stops the highlight
----{("n", "<esc>", ":noh<cr><esc>", silent)

---- function M.get_cmp_mappings()
----   local cmp = require('cmp')
----   local luasnip = require('luasnip')

----   return {
----     ['<S-Tab>'] = require('cmp').mapping.select_prev_item(),
----     ['<Tab>'] = require('cmp').mapping.select_next_item(),
----     ['<C-p>'] = require('cmp').mapping.select_prev_item(),
----     ['<C-n>'] = require('cmp').mapping.select_next_item(),
----     ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
----     ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
----     ['<C-Space>'] = require('cmp').mapping.complete(),
----     ['<C-e>'] = require('cmp').mapping.close(),
----     ['<CR>'] = require('cmp').mapping.confirm {
----       behavior = require('cmp').ConfirmBehavior.Replace,
----       select = true,
----     },
----     ['<Tab>'] = function(fallback)
----       if cmp.visible() then
----         cmp.select_next_item()
----       elseif luasnip.expand_or_jumpable() then
----         luasnip.expand_or_jump()
----       else
----         fallback()
----       end
----     end,
----     ['<S-Tab>'] = function(fallback)
----       if cmp.visible() then
----         cmp.select_prev_item()
----       elseif luasnip.jumpable(-1) then
----         luasnip.jump(-1)
----       else
----         fallback()
----       end
----     end,
----   }
---- end
