local wk = require("which-key")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      -- Telescope
            f = { "<CMD>Telescope find_files<CR>", "Find File" },
      g = { "<CMD>Telescope live_grep<CR>", "Grep Files" },
      b = { "<CMD>Telescope buffers<CR>", "Find Buffers" },
      h = { "<CMD>Telescope help_tags<CR>", "Help Tags" },
      r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
      v = { "<CMD>Telescope registers<CR>", "Show/Paste Registers" },
      n = { "<CMD>enew<CR>", "New File" },
      s = { function()
              require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ")})
            end, "Search with Grep" },
      G = {
        name = "+git",
        c = { "<CMD>Telescope git_commits<CR>", "Show Commits" },
        b = { "<CMD>Telescope git_bcommits<CR>", "Show Buffer Commits" },
        s = { "<CMD>Telescope git_status<CR>", "Show Status" },
        t = { "<CMD>Telescope git_stash<CR>", "Show Stashes" },
      },
      l = {
        name = "+lsp",
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
    -- Harpoon
    -- See also <C-e>
    h = { ui.toggle_quick_menu, "Toggle Harpoon Menu" },
    a = { mark.add_file, "Harpoon add file" },
    j = { function() ui.nav_file(1) end, "Harpoon file 1" },
    k = { function() ui.nav_file(2) end, "Harpoon file 2" },
    l = { function() ui.nav_file(3) end, "Harpoon file 3" },
    [";"] = { function() ui.nav_file(4) end, "Harpoon file 4" },
    -- Misc
    u = { vim.cmd.UndotreeToggle, "Toggle Undo Tree" },
  },
  z = {
    -- Folding
    R = { require("ufo").openAllFolds, "Open all folds"},
    M = { require("ufo").closeAllFolds, "Close all folds"},
  },
  ["<C-e>"] = { ui.toggle_quick_menu, "Toggle Harpoon Menu" },
  ["<C-n>"] = { "<CMD>Telescope find_files<CR>", "Telescope Find File" },
  ["<C-p>"] = { "<CMD>Telescope git_files<CR>", "Telescope Find Git File" },
  -- Split mappings
  ["<C-k>"] = { vim.cmd.KittyNavigateUp },
  ["<C-j>"] = { vim.cmd.KittyNavigateDown },
  ["<C-h>"] = { vim.cmd.KittyNavigateLeft },
  ["<C-l>"] = { vim.cmd.KittyNavigateRight },

})

