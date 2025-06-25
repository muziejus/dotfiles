local wk = require("which-key")
local harpoon = require("harpoon")

wk.add({
	{
		{
			name = "+FIND",
			-- Telescope
			{ "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
			{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "File" },
			{ "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Grep Files" },
			{ "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Marks" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Loclist" },
			{ "<leader>fc", "<CMD>Telescope bibtex<CR>", desc = "Citation" },
			{ "<leader>fC", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>fB", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy" },
			{ "<leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Help" },
			{ "<leader>fr", "<CMD>Telescope oldfiles<CR>", desc = "Open Recent File" },
			{ "<leader>fR", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "<leader>fv", "<CMD>Telescope registers<CR>", desc = "Show/Paste Registers" },
			{ "<leader>fs", "<CMD>Telescope session-lens<CR>", desc = "Sessions" },
			{
				"<leader>fp",
				function()
					vim.cmd("Telescope projections")
				end,
				desc = "Find Projections",
			},
			-- s = { "<leader><cmd>Telescope lsp_document_symbols<cr>", "symbols" },
			-- s = {
			-- 	function()
			-- 		require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
			-- 	end,
			-- 	"Search with Grep",
			-- },
		},
		{
			name = "+GIT",
			{ "<leader>Gc", "<CMD>Telescope git_commits<CR>", desc = "Show Commits" },
			{ "<leader>Gb", "<CMD>Telescope git_bcommits<CR>", desc = "Show Buffer Commits" },
			{ "<leader>Gs", "<CMD>Telescope git_status<CR>", desc = "Show Status" },
			{ "<leader>Gt", "<CMD>Telescope git_stash<CR>", desc = "Show Stashes" },
		},
		{
			name = "+HARPOON",
			{
				"<leader>aA",
				function()
					harpoon:list():add()
				end,
				desc = "Add to Harpoon",
			},
			{
				"<leader>aa",
				function()
					harpoon:list():select(1)
				end,
				desc = "Select File 1",
			},
			{
				"<leader>as",
				function()
					harpoon:list():select(2)
				end,
				desc = "Select File 2",
			},
			{
				"<leader>ad",
				function()
					harpoon:list():select(3)
				end,
				desc = "Select File 3",
			},
			{
				"<leader>af",
				function()
					harpoon:list():select(4)
				end,
				desc = "Select File 4",
			},
			{
				"<leader>al",
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "List files",
			},
			{
				"<leader>an",
				function()
					harpoon:list():next()
				end,
				desc = "Next file",
			},
			{
				"<leader>ap",
				function()
					harpoon:list():prev()
				end,
				desc = "Previous file",
			},
		},
		{
			name = "+VimTeX",
			{ "<leader>li", "<plug>(vimtex-info)", desc = "Info" },
			{ "<leader>lI", "<plug>(vimtex-info-full)", desc = "Info Full" },
			{ "<leader>lT", "<plug>(vimtex-toc-open)", desc = "ToC Open" },
			{ "<leader>lt", "<plug>(vimtex-toc-toggle)", desc = "ToC Toggle" },
			{ "<leader>lq", "<plug>(vimtex-log)", desc = "Log" },
			{ "<leader>lv", "<plug>(vimtex-view)", desc = "View" },
			{ "<leader>lr", "<plug>(vimtex-reverse-search)", desc = "Reverse Search" },
			{ "<leader>ll", "<plug>(vimtex-compile)", desc = "Compile" },
			{ "<leader>lL", "<plug>(vimtex-compile-selected)", desc = "Compile Selected" },
			{ "<leader>lk", "<plug>(vimtex-stop)", desc = "Stop" },
			{ "<leader>lK", "<plug>(vimtex-stop-all)", desc = "Stop All" },
			{ "<leader>le", "<plug>(vimtex-errors)", desc = "Errors" },
			{ "<leader>lo", "<plug>(vimtex-compile-output)", desc = "Compile Output" },
			-- { "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", desc = "Open Lazygit" },
			{ "<leader>lg", "<plug>(vimtex-status)", desc = "Status" },
			{ "<leader>lG", "<plug>(vimtex-status-all)", desc = "Status All" },
			{ "<leader>lc", "<plug>(vimtex-clean)", desc = "Clean" },
			{ "<leader>lC", "<plug>(vimtex-clean-full)", desc = "Clean Full" },
			{ "<leader>lm", "<plug>(vimtex-imaps-list)", desc = "List i-maps" },
			{ "<leader>lx", "<plug>(vimtex-reload)", desc = "Reload" },
			{ "<leader>lX", "<plug>(vimtex-reload-state)", desc = "Reload State" },
			{ "<leader>ls", "<plug>(vimtex-toggle-main)", desc = "Toggle Main" },
			{ "<leader>la", "<plug>(vimtex-context-menu)", desc = "Context Menu" },
		},
		{
			name = "+LSP",
			{ "<leader>Lr", "<CMD>Telescope lsp_references<CR>", desc = "Show References" },
			{ "<leader>Ld", "<CMD>Telescope lsp_definitions<CR>", desc = "Show Definitions" },
			{ "<leader>Lt", "<CMD>Telescope lsp_type_definitions<CR>", desc = "Show Type Definitions" },
			{ "<leader>Li", "<CMD>Telescope lsp_implementations<CR>", desc = "Show Implementations" },
			{ "<leader>Lc", "<CMD>Telescope lsp_code_actions<CR>", desc = "Show Code Actions" },
			{ "<leader>Lds", "<CMD>Telescope lsp_document_symbols<CR>", desc = "Show Document Symbols" },
			{ "<leader>Lws", "<CMD>Telescope lsp_workspace_symbols<CR>", desc = "Show Workspace Symbols" },
		},
		{
			name = "+terminal",
			{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
			{ "<leader>tc", "<cmd>ToggleTermSendCurrentLine<CR>", desc = "ToggleTerm send current line" },
			{ "<leader>tv", "<cmd>ToggleTermSendVisualLines<CR>", desc = "ToggleTerm send visual lines" },
			-- l = { "<leader><cmd>lua _lazygit_toggle()<CR>", desc = "Open Lazygit" },
			-- g = { "<leader><cmd>lua _lazygit_toggle()<CR>", desc = "Open Lazygit" },
		},
		{
			name = "+type",
			{ "<leader>Tm", "<CMD>set filetype=markdown<CR>", desc = "Set to Markdown" },
		},
		{
			-- Snippets
			{ "<leader>sr", "<cmd>source ~/.config/nvim/after/plugin/snippets.lua<CR>", desc = "Reload LuaSnip" },
		},
		{
			name = "+HUNKS",
			-- There are some bindings in the gitsigns config because they
			-- rely on visual mode.
			-- Same for ]c and [c
			{ "<leader>ha", "<CMD>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
			{ "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
			{ "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
			{ "<leader>hS", "<CMD>Gitsigns stage_buffer<CR>", desc = "Stage buffer" },
			{ "<leader>hR", "<CMD>Gitsigns reset_buffer<CR>", desc = "Reset buffer" },
			{ "<leader>hu", "<CMD>Gitsigns undo_stage_hunk<CR>", desc = "Undo stage hunk" },
			{ "<leader>hp", "<CMD>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
			{ "<leader>hd", "<CMD>Gitsigns diffthis<CR>", desc = "Diff this" },
			-- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
			-- map('n', '<leader>tb', gs.toggle_current_line_blame)
			-- map('n', '<leader>hD', function() gs.diffthis('~') end)
			-- map('n', '<leader>td', gs.toggle_deleted)
		},
		{
			-- Git
			name = "+git",
			{
				name = "+GitHub",
				{
					name = "+Commits",
					{ "<leader>ghcc", "<cmd>GHCloseCommit<cr>", desc = "Close" },
					{ "<leader>ghce", "<cmd>GHExpandCommit<cr>", desc = "Expand" },
					{ "<leader>ghco", "<cmd>GHOpenToCommit<cr>", desc = "Open To" },
					{ "<leader>ghcp", "<cmd>GHPopOutCommit<cr>", desc = "Pop Out" },
					{ "<leader>ghcz", "<cmd>GHCollapseCommit<cr>", desc = "Collapse" },
				},
				{
					name = "+Issues",
					{ "<leader>ghip", "<cmd>GHPreviewIssue<cr>", desc = "Preview" },
				},
				{
					name = "+Litee",
					{ "<leader>ghlt", "<cmd>LTPanel<cr>", desc = "Toggle Panel" },
				},
				{
					name = "+Review",
					{ "<leader>ghrb", "<cmd>GHStartReview<cr>", desc = "Begin" },
					{ "<leader>ghrc", "<cmd>GHCloseReview<cr>", desc = "Close" },
					{ "<leader>ghrd", "<cmd>GHDeleteReview<cr>", desc = "Delete" },
					{ "<leader>ghre", "<cmd>GHExpandReview<cr>", desc = "Expand" },
					{ "<leader>ghrs", "<cmd>GHSubmitReview<cr>", desc = "Submit" },
					{ "<leader>ghrz", "<cmd>GHCollapseReview<cr>", desc = "Collapse" },
				},
				{
					name = "+Pull Request",
					{ "<leader>ghpc", "<cmd>GHClosePR<cr>", desc = "Close" },
					{ "<leader>ghpd", "<cmd>GHPRDetails<cr>", desc = "Details" },
					{ "<leader>ghpe", "<cmd>GHExpandPR<cr>", desc = "Expand" },
					{ "<leader>ghpo", "<cmd>GHOpenPR<cr>", desc = "Open" },
					{ "<leader>ghpp", "<cmd>GHPopOutPR<cr>", desc = "PopOut" },
					{ "<leader>ghpr", "<cmd>GHRefreshPR<cr>", desc = "Refresh" },
					{ "<leader>ghpt", "<cmd>GHOpenToPR<cr>", desc = "Open To" },
					{ "<leader>ghpz", "<cmd>GHCollapsePR<cr>", desc = "Collapse" },
				},
				{
					name = "+Threads",
					{ "<leader>ghtc", "<cmd>GHCreateThread<cr>", desc = "Create" },
					{ "<leader>ghtn", "<cmd>GHNextThread<cr>", desc = "Next" },
					{ "<leader>ghtt", "<cmd>GHToggleThread<cr>", desc = "Toggle" },
				},
			},
			{ "<leader>gs", "<CMD>Neogit kind=split<CR>", desc = "git status" },
			{ "<leader>gl", "<CMD>diffget LOCAL<CR>", desc = "get LOCAL diff" },
			{ "<leader>gb", "<CMD>diffget BASE<CR>", desc = "get BASE diff" },
			{ "<leader>gr", "<CMD>diffget REMOTE<CR>", desc = "get REMOTE diff" },
			{ "<leader>gj", "<CMD>diffget //3<CR>", desc = "diffget 3" },
			{ "<leader>gf", "<CMD>diffget //2<CR>", desc = "diffget 2" },
			{ "<leader>gc", "<CMD>Neogit commit<CR>", desc = "git commit" },
			{ "<leader>gpom", "<CMD>Git push origin main<CR>", desc = "git commit origin main" },
		},
		{
			name = "+QUARTO",
      { "<leader>qa", "<CMD>QuartoActivate<CR>", desc= "Activate"},
      { "<leader>qe", require("otter").export, desc= "Export"},
      { "<leader>qp", "<CMD>QuartoPreview<CR>", desc= "Preview"},
      { "<leader>qq", "<CMD>QuartoClosePreview<CR>", desc= "Quiet Preview"},
      { "<leader>qra", "<CMD>QuartoSendAll<CR>", desc= "Run All"},
      { "<leader>qrb", "<CMD>QuartoSendBelow<CR>", desc= "Run Below"},
      { "<leader>qrr", "<CMD>QuartoSendAbove<CR>", desc= "Run to Cursor"},
			{ "<leader>qm", '<CMD>lua require"nabla".toggle_virt()<cr>', desc = "toggle [m]ath equations" },
		},
    {
      name = "+MOLTEN",
      { "<leader>mi", "<CMD>MoltenInit<cr>", desc = "Initialize Molten" },
      { "<leader>mp", "<CMD>MoltenImagePopup<cr>", desc = "Molten image popup" },
      { "<leader>mb", "<CMD>MoltenOpenInBrowser<cr>", desc = "Molten open in browser" },
      { "<leader>mh", "<CMD>MoltenHideOutput<cr>", desc = "Molten hide output" },
      { "<leader>ms", "<CMD>noautocmd MoltenEnterOutput<cr>", desc = "Molten show/enter output" },
    },
		{
			name = "+OBSIDIAN",
			{ "<leader>oo", "<CMD>ObsidianOpen<CR>", desc = "Open in Obsidian" },
			{ "<leader>om", "<CMD>ObsidianTemplate<CR>", desc = "Apply Obsidian template" },
			{ "<leader>on", "<CMD>ObsidianNewFromTemplate<CR>", desc = "New Obsidian note from template" },
			{ "<leader>of", "<CMD>ObsidianQuickSwitch<CR>", desc = "Find note with picker" },
			{ "<leader>ov", "<CMD>ObsidianFollowLink vsplit<CR>", desc = "Vsplit link" },
			{ "<leader>ob", "<CMD>ObsidianBacklinks<CR>", desc = "Backlinks with picker" },
			{ "<leader>ot", "<CMD>ObsidianTags<CR>", desc = "Tags with picker" },
			{ "<leader>oT", "<CMD>ObsidianToday<CR>", desc = "New daily note" },
			{ "<leader>oD", "<CMD>ObsidianDailies<CR>", desc = "Dailies with picker" },
			{ "<leader>og", "<CMD>ObsidianSearch<CR>", desc = "Search with picker" },
			{ "<leader>ox", "<CMD>ObsidianToggleCheckbox<CR>", desc = "Toggle checkbox" },
			{ "<leader>oX", "<CMD>ObsidianExtractNote<CR>", desc = "Extract selected text" },
			{ "<leader>oi", "<CMD>ObsidianPasteImg<CR>", desc = "Paste image" },
			{ "<leader>ol", "<CMD>ObsidianLink<CR>", desc = "Link visually selected text" },
		},
		-- Trouble
		-- See also gR
		{
			name = "+trouble",
			{ "<leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
			{ "<leader>xq", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{ "<leader>xL", "<CMD>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
			-- { "<leader>d", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "List Document Diagnostics" },
			-- { "<leader>w", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "List Workspace Diagnostics" },
			{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
		},
		{
			name = "Barbar",
			{ "<leader>bp", "<CMD>BufferPrevious<CR>", desc = "Previous Buffer" },
			{ "<leader>bn", "<CMD>BufferNext<CR>", desc = "Next Buffer" },
			{ "<leader>b<", "<CMD>BufferMovePrevious<CR>", desc = "Move Previous Buffer" },
			{ "<leader>b>", "<CMD>BufferMoveNext<CR>", desc = "Move Next Buffer" },
			{ "<leader>bx", "<CMD>BufferPin<CR>", desc = "Pin/Unpin Buffer" },
			{ "<leader>bw", "<CMD>BufferClose<CR>", desc = "Close Buffer" },
		},
		{
			name = "ACTIONS",
			-- { "<leader>b", "<cmd>terminal bibexport -o %:p:r.bib %:p:r.aux<CR>", "bib export"},
			{ "<leader>Ac", "<cmd>VimtexClean<CR>", desc = "clean aux" },
			-- { "<leader>g", "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>", "edit glossary"},
			-- { "<leader>h", "<cmd>lua _HTOP_TOGGLE()<CR>", desc = "htop" },
			-- { "<leader>i", "<cmd>IlluminateToggle<CR>", desc = "illuminate" },
			-- { "<leader>l", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", "LSP"},
			{ "<leader>Ap", '<cmd>lua require("nabla").popup()<CR>', desc = "preview symbols" },
			-- { "<leader>r", "<cmd>VimtexErrors<CR>", desc = "report errors" },
			{ "<leader>As", "<cmd>e ~/.config/nvim/snippets/tex.lua<CR>", desc = "edit snippets" },
			{ "<leader>Au", "<cmd>cd %:p:h<CR>", desc = "update cwd" },
			-- { "<leader>w", "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>" , "word"},
			{ "<leader>Av", "<plug>(vimtex-context-menu)", desc = "vimtex menu" },
		},
		-- Misc
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undo Tree" },
		{ "<leader>z", vim.cmd.ZenMode, desc = "Enable Zen mode" },
		{ "<leader><space>za", desc = "Toggle fold" },
	},
	{ "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP References" },
	-- Folding
	{
		{
			"K",
			function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end,
			desc = "Peek fold or hover",
		},
		{ "zR", require("ufo").openAllFolds, desc = "Open all folds" },
		{ "zM", require("ufo").closeAllFolds, desc = "Close all folds" },
		{ "zr", require("ufo").openFoldsExceptKinds, desc = "Open folds except kinds" },
		{ "zm", require("ufo").closeFoldsWith, desc = "Close folds with" },
		{ "z<space>", require("ufo").peekFoldedLinesUnderCursor, desc = "Peek folded lines" },
	},
	{ "<C-n>", vim.cmd.LTPopOutFiletree, desc = "Toggle Nvim Tree" },
	-- {"<C-n>", vim.cmd.NvimTreeToggle, desc = "Toggle Nvim Tree" },
	{ "<C-p>", "<CMD>Telescope git_files<CR>", desc = "Telescope Find Git File" },
	-- Insert / Visual mode
	{
		"<C-u>",
		function()
			require("luasnip.extras.select_choice")()
		end,
		desc = "Cycle LuaSnip choice node",
		mode = "i",
	},
	-- Barbar. See also leader.
	{ "<A-,>", "<CMD>BufferPrevious<CR>", desc = "Previous Buffer" },
	{ "<A-.>", "<CMD>BufferNext<CR>", desc = "Next Buffer" },
	{ "<A-<>", "<CMD>BufferMovePrevious<CR>", desc = "Move Previous Buffer" },
	{ "<A->>", "<CMD>BufferMoveNext<CR>", desc = "Move Next Buffer" },
	{ "<A-p>", "<CMD>BufferPin<CR>", desc = "Pin/Unpin Buffer" },
	{ "<A-c>", "<CMD>BufferClose<CR>", desc = "Close Buffer" },
  -- Hop around
  { "<C-j>", "<CMD>wincmd j<CR>", desc="Hop down"},
  { "<C-h>", "<CMD>wincmd h<CR>", desc="Hop left"},
  { "<C-k>", "<CMD>wincmd k<CR>", desc="Hop up"},
  { "<C-l>", "<CMD>wincmd l<CR>", desc="Hop right"},
  { "<Esc><Esc>", "<CMD>silent! nohls<CR>", desc="Clear Search Highlight"},
})
