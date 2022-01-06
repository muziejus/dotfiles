-- See nvim-cmp setup for more mapping.


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
    w = {
      name = "+workspace",
      a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add Workspace Folder'},
      r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Workspace Folder'},
      l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List Workspace Folders'},
    },
    l = {
      name = "+lsp",
      gi = { '<cmd>lua vim.lsp.buf.implementation()<CR>', "Go to Implementation"},
      gd = { '<cmd>lua vim.lsp.buf.definition()<CR>', "Go to Definition"},
      gD = { '<cmd>lua vim.lsp.buf.declaration()<CR>', "Go to Declaration"},
      gr = { '<cmd>lua vim.lsp.buf.references()<CR>', "Go to References"},
      ca = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action'},
      D = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', "Go to Type Definition"},
      rn = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Buffer Rename'},
      e = { '<cmd>lua vim.diagnostic.open_float()<CR>', "Open Float"},
      q = { '<cmd>lua vim.diagnostic.setloclist()<CR>', "Set Loclist"},
      F = { '<cmd>lua vim.lsp.buf.formatting()<CR>', "Format"},
      K = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature Help"},
    },
    ca = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action'},
    D = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', "Go to Type Definition"},
    rn = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Buffer Rename'},
    e = { '<cmd>lua vim.diagnostic.open_float()<CR>', "Open Float"},
    q = { '<cmd>lua vim.diagnostic.setloclist()<CR>', "Set Loclist"},
    F = { '<cmd>lua vim.lsp.buf.formatting()<CR>', "Format"},
    K = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature Help"},
  },
  -- Generic LSP
  gi = { '<cmd>lua vim.lsp.buf.implementation()<CR>', "Go to Implementation"},
  gd = { '<cmd>lua vim.lsp.buf.definition()<CR>', "Go to Definition"},
  gD = { '<cmd>lua vim.lsp.buf.declaration()<CR>', "Go to Declaration"},
  gr = { '<cmd>lua vim.lsp.buf.references()<CR>', "Go to References"},
  K = { '<cmd>lua vim.lsp.buf.hover()<CR>', "Hover"},
  -- Split mappings
  ['<C-k>'] = {':TmuxNavigateUp<CR>'},
  ['<C-j>'] = {':TmuxNavigateDown<CR>'},
  ['<C-h>'] = {':TmuxNavigateLeft<CR>'},
  ['<C-l>'] = {':TmuxNavigateRight<CR>'},
----{("n", "<esc>", ":noh<cr><esc>", silent)
  ['<esc>'] = {":noh<CR><ESC>"},
  ['<C-n>'] = {':NvimTreeToggle<CR>', "NvimTree Toggle"},
  H = {'^', "Jump to start of line"}
})

-- LSPconfig
 -- ['[d'] = { '<cmd>lua vim.diagnostic.goto_prev()<CR>'},
 -- [']d'] = { '<cmd>lua vim.diagnostic.goto_next()<CR>'},

--  -- Center search results
--  {'n', 'nzz'},
--  {'N', 'Nzz'},
--  {'*', '*zz'},
--  {'#', '#zz'},
--  {'g*', 'g*zz'},
--  {'g#', 'g#zz'},
--  {'G', 'Gzz'},

-- function M.get_cmp_mappings()
--   local cmp = require('cmp')
--   local luasnip = require('luasnip')

--   return {
--     ['<CR>'] = require('cmp').mapping.confirm {
--       behavior = require('cmp').ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end,
--     ['<S-Tab>'] = function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end,
--   }
-- end
