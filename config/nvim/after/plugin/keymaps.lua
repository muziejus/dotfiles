-- vim: set foldlevel=1

local wk = require("which-key")
local harpoon = require("harpoon")
local snacks = require("snacks")
local conform = require("conform")

wk.add({
	{ -- Leader
		{ -- a Harpoon
			{ "<leader>a", group = "Harpoon" },
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
		{ -- A Actions
			{ "<leader>A", group = "(VimTeX) Actions" },
			{ "<leader>Ac", "<cmd>VimtexClean<CR>", desc = "clean aux" },
			{ "<leader>Ap", '<cmd>lua require("nabla").popup()<CR>', desc = "preview symbols" },
			{ "<leader>As", "<cmd>e ~/.config/nvim/snippets/tex.lua<CR>", desc = "edit snippets" },
			{ "<leader>Au", "<cmd>cd %:p:h<CR>", desc = "update cwd" },
			{ "<leader>Av", "<plug>(vimtex-context-menu)", desc = "vimtex menu" },
		},
		{ -- b Buffers
			{ "<leader>b", group = "Buffers" },
			{ "<leader>bp", "<CMD>BufferPrevious<CR>", desc = "Previous Buffer" },
			{ "<leader>bn", "<CMD>BufferNext<CR>", desc = "Next Buffer" },
			{
				"<leader>bd",
				function()
					snacks.bufdelete.delete(0, false)
				end,
				desc = "Delete Buffer",
			},
		},
		-- { "<leader>b", "<cmd>terminal bibexport -o %:p:r.bib
		-- %:p:r.aux<CR>", "bib export"},
		-- { "<leader>g", "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>",
		-- "edit glossary"},
		-- { "<leader>h", "<cmd>lua _HTOP_TOGGLE()<CR>", desc = "htop" },
		-- { "<leader>i", "<cmd>IlluminateToggle<CR>", desc = "illuminate" },
		-- { "<leader>l", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", "LSP"},
		-- { "<leader>r", "<cmd>VimtexErrors<CR>", desc = "report errors" },
		-- { "<leader>w", "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>" , B
		-- (Barbar and Buffers)
		-- C
		-- D
		-- E
		{ -- f Find / Pickers
			{ "<leader>f", group = "Pickers" },
			{
				"<leader>fq",
				function()
					snacks.picker.qflist()
				end,
				desc = "Quickfix",
			},
			{
				"<leader>ff",
				function()
					snacks.picker.smart()
					-- snacks.picker.files()
				end,
				desc = "Smart File",
			},
			{
				"<leader>fF",
				function()
					snacks.picker.files()
				end,
				desc = "File",
			},
			{
				"<leader>fg",
				function()
					snacks.picker.grep()
				end,
				desc = "Grep Files",
			},
			{
				"<leader>fu",
				function()
					snacks.picker.undo()
				end,
				desc = "Undo",
			},
			{
				"<leader>fk",
				function()
					snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>fl",
				function()
					snacks.picker.loclist()
				end,
				desc = "Loclist",
			},
			{
				"<leader>fm",
				function()
					snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>fb",
				function()
					snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fh",
				function()
					snacks.picker.help()
				end,
				desc = "Help",
			},
			{
				"<leader>fr",
				function()
					snacks.picker.recent()
				end,
				desc = "Recent Files",
			},
			{
				"<leader>fR",
				function()
					snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"<leader>f'",
				function()
					snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<leader>fp",
				function()
					snacks.picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<leader>fd",
				function()
					snacks.picker.lsp_definitions()
				end,
				desc = "Definitions",
			},
			{
				"<leader>ft",
				function()
					snacks.picker.lsp_type_definitions()
				end,
				desc = "Types",
			},
		},
		{ -- g Git
			{ "<leader>g", group = "Git" },
			{
				"<leader>gs",
				function()
					snacks.picker.git_status()
				end,
				desc = "git status",
			},
			{
				"<leader>gb",
				function()
					snacks.picker.git_branches()
				end,
				desc = "git branches",
			},
			{
				"<leader>gl",
				function()
					snacks.picker.git_log()
				end,
				desc = "git log",
			},
			{
				"<leader>gS",
				function()
					snacks.picker.git_stash()
				end,
				desc = "git stash",
			},
			{
				"<leader>gd",
				function()
					snacks.picker.git_diff()
				end,
				desc = "git diff",
			},
			{ "<leader>gc", "<CMD>Neogit commit<CR>", desc = "git commit" },
			{ "<leader>gpom", "<CMD>Git push origin main<CR>", desc = "git commit origin main" },

			{ -- GitHub
				{ "<leader>gh", group = "Git" },
				{ "<leader>ghcc", "<cmd>GHCloseCommit<cr>", desc = "Close" },
				{ "<leader>ghce", "<cmd>GHExpandCommit<cr>", desc = "Expand" },
				{ "<leader>ghco", "<cmd>GHOpenToCommit<cr>", desc = "Open To" },
				{ "<leader>ghcp", "<cmd>GHPopOutCommit<cr>", desc = "Pop Out" },
				{ "<leader>ghcz", "<cmd>GHCollapseCommit<cr>", desc = "Collapse" },
				{ "<leader>ghip", "<cmd>GHPreviewIssue<cr>", desc = "Preview" },
				{ "<leader>ghrb", "<cmd>GHStartReview<cr>", desc = "Begin" },
				{ "<leader>ghrc", "<cmd>GHCloseReview<cr>", desc = "Close" },
				{ "<leader>ghrd", "<cmd>GHDeleteReview<cr>", desc = "Delete" },
				{ "<leader>ghre", "<cmd>GHExpandReview<cr>", desc = "Expand" },
				{ "<leader>ghrs", "<cmd>GHSubmitReview<cr>", desc = "Submit" },
				{ "<leader>ghrz", "<cmd>GHCollapseReview<cr>", desc = "Collapse" },
				{ "<leader>ghpc", "<cmd>GHClosePR<cr>", desc = "Close" },
				{ "<leader>ghpd", "<cmd>GHPRDetails<cr>", desc = "Details" },
				{ "<leader>ghpe", "<cmd>GHExpandPR<cr>", desc = "Expand" },
				{ "<leader>ghpo", "<cmd>GHOpenPR<cr>", desc = "Open" },
				{ "<leader>ghpp", "<cmd>GHPopOutPR<cr>", desc = "PopOut" },
				{ "<leader>ghpr", "<cmd>GHRefreshPR<cr>", desc = "Refresh" },
				{ "<leader>ghpt", "<cmd>GHOpenToPR<cr>", desc = "Open To" },
				{ "<leader>ghpz", "<cmd>GHCollapsePR<cr>", desc = "Collapse" },
				{ "<leader>ghtc", "<cmd>GHCreateThread<cr>", desc = "Create" },
				{ "<leader>ghtn", "<cmd>GHNextThread<cr>", desc = "Next" },
				{ "<leader>ghtt", "<cmd>GHToggleThread<cr>", desc = "Toggle" },
			},
		},
		{ -- h Hunks
			-- There are some bindings in the gitsigns config because they
			-- rely on visual mode.
			-- Same for ]c and [c
			{ "<leader>h", group = "Hunks" },
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
		-- I
		-- J
		-- K
		{ -- l VimTeX
			{ "<leader>l", group = "VimTeX" },
			{
				"<leader>lg",
				function()
					snacks.lazygit.open()
				end,
				desc = "Open Lazygit",
			},
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
		},
		{ -- L LSP
			{ "<leader>L", group = "LSP" },

			{
				"<leader>Lr",
				function()
					snacks.picker.lsp_references()
				end,
				desc = "Show References",
			},
			{
				"<leader>Ld",
				function()
					snacks.picker.lsp_definitions()
				end,
				desc = "Show Definitions",
			},
			{
				"<leader>Lt",
				function()
					snacks.picker.lsp_type_definitions()
				end,
				desc = "Show Type Definitions",
			},
			{
				"<leader>Li",
				function()
					snacks.picker.lsp_implementations()
				end,
				desc = "Show Implementations",
			},
			{
				"<leader>Lc",
				function()
					snacks.picker.lsp_code_actions()
				end,
				desc = "Show Code Actions",
			},
			{
				"<leader>Lds",
				function()
					snacks.picker.lsp_document_symbols()
				end,
				desc = "Show Document Symbols",
			},
			{
				"<leader>Lws",
				function()
					snacks.picker.lsp_workspace_symbols()
				end,
				desc = "Show Workspace Symbols",
			},
		},
		{ -- m (Molten)
			{ "<leader>m", group = "Molten" },
			{ "<leader>mi", "<CMD>MoltenInit<cr>", desc = "Initialize Molten" },
			{ "<leader>mp", "<CMD>MoltenImagePopup<cr>", desc = "Molten image popup" },
			{ "<leader>mb", "<CMD>MoltenOpenInBrowser<cr>", desc = "Molten open in browser" },
			{ "<leader>mh", "<CMD>MoltenHideOutput<cr>", desc = "Molten hide output" },
			{ "<leader>ms", "<CMD>noautocmd MoltenEnterOutput<cr>", desc = "Molten show/enter output" },
		},
		-- N
		{ -- o (Obsidian)
			{ "<leader>o", group = "Obsidian" },
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
		-- P
		{ -- q (Quarto)
			{ "<leader>q", group = "Quarto" },
			{ "<leader>qa", "<CMD>QuartoActivate<CR>", desc = "Activate" },
			{ "<leader>qe", require("otter").export, desc = "Export" },
			{ "<leader>qp", "<CMD>QuartoPreview<CR>", desc = "Preview" },
			{ "<leader>qq", "<CMD>QuartoClosePreview<CR>", desc = "Quiet Preview" },
			{ "<leader>qra", "<CMD>QuartoSendAll<CR>", desc = "Run All" },
			{ "<leader>qrb", "<CMD>QuartoSendBelow<CR>", desc = "Run Below" },
			{ "<leader>qrr", "<CMD>QuartoSendAbove<CR>", desc = "Run to Cursor" },
			{ "<leader>qm", '<CMD>lua require"nabla".toggle_virt()<cr>', desc = "toggle [m]ath equations" },
		},
		-- R
		{ -- s Snippets)
			{ "<leader>s", group = "Snippets" },
			{ "<leader>sr", "<cmd>source ~/.config/nvim/after/plugin/snippets.lua<CR>", desc = "Reload LuaSnip" },
		},
		{ -- t (terminal)
			{ "<leader>t", group = "Terminal" },
			{
				"<leader>tt",
				function()
					snacks.terminal.toggle()
				end,
				desc = "Toggle Terminal",
			},
		},
		{ -- T Types
			{ "<leader>T", group = "Types" },
			{ "<leader>Tm", "<CMD>set filetype=markdown<CR>", desc = "Set to Markdown" },
		},
		-- U
		{
			"<leader>u",
			function()
				snacks.picker.undo()
			end,
			desc = "Undo",
		},
		-- V
		-- W
		{ -- X (Trouble)
			{ "<leader>x", group = "Trouble" },
			{ "<leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
			{ "<leader>xq", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{ "<leader>xL", "<CMD>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
			{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
		},
		-- Y
		-- Z
	},
	{ -- G
		{
			"gd",
			function()
				snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"gs",
			function()
				snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"gS",
			function()
				snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"gqap",
			function()
				conform.format({ bufnr = 0 })
			end,
			desc = "Run Conform on paragraph",
		},
	},
	{
		"<C-n>",
		function()
			snacks.explorer.open()
		end,
		desc = "Open Explorer",
		{ "<leader>z", vim.cmd.ZenMode, desc = "Enable Zen mode" },
		{ "<leader><space>za", desc = "Toggle fold" },
	},
	{
		"<C-\\>",
		function()
			snacks.terminal.toggle()
		end,
		desc = "Toggle Terminal",
	},
	{
		"<C-u>",
		function()
			require("luasnip.extras.select_choice")()
		end,
		desc = "Cycle LuaSnip choice node",
		mode = "i",
	},
	-- Hop around
	{ "<C-j>", "<CMD>wincmd j<CR>", desc = "Hop down" },
	{ "<C-h>", "<CMD>wincmd h<CR>", desc = "Hop left" },
	{ "<C-k>", "<CMD>wincmd k<CR>", desc = "Hop up" },
	{ "<C-l>", "<CMD>wincmd l<CR>", desc = "Hop right" },
	{ "<Esc><Esc>", "<CMD>silent! nohls<CR>", desc = "Clear Search Highlight" },
})
