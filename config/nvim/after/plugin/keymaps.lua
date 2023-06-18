local wk = require("which-key")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

wk.register({
  ["<leader>"] = {
    f = {
      name = "+FIND",
      -- Telescope
      f = { "<CMD>Telescope find_files<CR>", "Find File" },
      g = { "<CMD>Telescope live_grep<CR>", "Grep Files" },
      c = { "<CMD>Telescope bibtex<CR>", "Find Citation" },
      b = { "<CMD>Telescope buffers<CR>", "Find Buffers" },
      h = { "<CMD>Telescope help_tags<CR>", "Help Tags" },
      r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
      v = { "<CMD>Telescope registers<CR>", "Show/Paste Registers" },
      s = { function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end, "Search with Grep" },
      G = {
        name = "+GIT",
        c = { "<CMD>Telescope git_commits<CR>", "Show Commits" },
        b = { "<CMD>Telescope git_bcommits<CR>", "Show Buffer Commits" },
        s = { "<CMD>Telescope git_status<CR>", "Show Status" },
        t = { "<CMD>Telescope git_stash<CR>", "Show Stashes" },
      },
      l = {
        name = "+LSP",
        r = { "<CMD>Telescope lsp_references<CR>", "Show References" },
        d = { "<CMD>Telescope lsp_definitions<CR>", "Show Definitions" },
        t = { "<CMD>Telescope lsp_type_definitions<CR>", "Show Type Definitions" },
        i = { "<CMD>Telescope lsp_implementations<CR>", "Show Implementations" },
        c = { "<CMD>Telescope lsp_code_actions<CR>", "Show Code Actions" },
        ds = { "<CMD>Telescope lsp_document_symbols<CR>", "Show Document Symbols" },
        ws = { "<CMD>Telescope lsp_workspace_symbols<CR>", "Show Workspace Symbols" },
      },
      t = {
        name = "+type",
        m = { "<CMD>set filetype=markdown<CR>", "Set to Markdown" },
      },
    },
    s = {
      -- Snippets
      r = {"<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>", "Reload LuaSnip"},
    },
    g = {
      -- Git
      name = "+git",
      s = { vim.cmd.Git, "git status" },
      l = { "<CMD>diffget LOCAL<CR>", "get LOCAL diff" },
      b = { "<CMD>diffget BASE<CR>", "get BASE diff" },
      r = { "<CMD>diffget REMOTE<CR>", "get REMOTE diff" },
      j = { "<CMD>diffget //3<CR>", "diffget 3" },
      f = { "<CMD>diffget //2<CR>", "diffget 2" },
      c = { "<CMD>Git commit<CR>", "git commit" },
      pom = { "<CMD>Git push origin main<CR>", "git commit origin main" },
    },
    -- Trouble
    -- See also gR
    x = {
      name = "+trouble",
      x = { "<CMD>TroubleToggle<CR>", "Toggle Trouble" },
      q = { "<CMD>TroubleToggle quickfix<CR>", "Quickfix" },
      l = { "<CMD>TroubleToggle loclist<CR>", "Loclist" },
      d = { "<CMD>TroubleToggle document_diagnostics<CR>", "List Document Diagnostics" },
      w = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "List Workspace Diagnostics" },
      r = { "<cmd>TroubleToggle lsp_references<cr>" },
    },
    -- Harpoon
    -- See also <C-e>
    h = { ui.toggle_quick_menu, "Toggle Harpoon Menu" },
    a = {
      name = "ACTIONS",
      -- b = { "<cmd>terminal bibexport -o %:p:r.bib %:p:r.aux<CR>", "bib export"},
      c = { "<cmd>VimtexClean<CR>", "clean aux" },
      -- g = { "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>", "edit glossary"},
      -- h = { "<cmd>lua _HTOP_TOGGLE()<CR>", "htop" },
      -- i = { "<cmd>IlluminateToggle<CR>", "illuminate" },
      -- l = { "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", "LSP"},
      p = { '<cmd>lua require("nabla").popup()<CR>', "preview symbols"},
      -- r = { "<cmd>VimtexErrors<CR>", "report errors" },
      s = { "<cmd>e ~/.config/nvim/snippets/tex.lua<CR>", "edit snippets"},
      u = { "<cmd>cd %:p:h<CR>", "update cwd" },
      -- w = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>" , "word"},
      v = { "<plug>(vimtex-context-menu)", "vimtex menu" },
    },
    -- a = { mark.add_file, "Harpoon add file" },
    j = { function() ui.nav_file(1) end, "Harpoon file 1" },
    k = { function() ui.nav_file(2) end, "Harpoon file 2" },
    l = { function() ui.nav_file(3) end, "Harpoon file 3" },
    [";"] = { function() ui.nav_file(4) end, "Harpoon file 4" },
    -- Misc
    u = { vim.cmd.UndotreeToggle, "Toggle Undo Tree" },
    z = { vim.cmd.ZenMode, "Enable Zen mode" },
    ["<space>"] = { "za", "Toggle fold" },
  },
  g = {
    R = { "<cmd>TroubleToggle lsp_references<cr>", "LSP References"},
  },
  -- Folding
  K = { function ()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end, "Peek fold or hover"},
  z = {
    R = { require("ufo").openAllFolds, "Open all folds" },
    M = { require("ufo").closeAllFolds, "Close all folds" },
    r = { require("ufo").openFoldsExceptKinds, "Open folds except kinds" },
    m = { require("ufo").closeFoldsWith, "Close folds with" },
    ["<space>"] = { require("ufo").peekFoldedLinesUnderCursor, "Peek folded lines" },
  },
  ["<C-e>"] = { ui.toggle_quick_menu, "Toggle Harpoon Menu" },
  ["<C-n>"] = { vim.cmd.NvimTreeToggle, "Toggle Nvim Tree" },
  ["<C-p>"] = { "<CMD>Telescope git_files<CR>", "Telescope Find Git File" },
  -- Insert / Visual mode
  ["<C-u>"] = { function()
    require("luasnip.extras.select_choice")()
  end, "Cycle LuaSnip choice node", mode="i" }
})
