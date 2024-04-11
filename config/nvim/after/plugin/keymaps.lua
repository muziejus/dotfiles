local wk = require("which-key")

wk.register({
	["<leader>"] = {
		f = {
			name = "+FIND",
			-- Telescope
			q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
			f = { "<CMD>Telescope find_files<CR>", "File" },
			g = { "<CMD>Telescope live_grep<CR>", "Grep Files" },
			j = { "<cmd>Telescope jumplist<cr>", "Marks" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			l = { "<cmd>Telescope loclist<cr>", "Loclist" },
			c = { "<CMD>Telescope bibtex<CR>", "Citation" },
			C = { "<cmd>Telescope git_commits<cr>", "Commits" },
			b = { "<CMD>Telescope buffers<CR>", "Buffers" },
			B = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy" },
			h = { "<CMD>Telescope help_tags<CR>", "Help" },
			r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
			R = { "<cmd>Telescope lsp_references<cr>", "References" },
			v = { "<CMD>Telescope registers<CR>", "Show/Paste Registers" },
			s = { "<CMD>Telescope session-lens<CR>", "Sessions" },
			p = {
				function()
					vim.cmd("Telescope projections")
				end,
				"Find Projections",
			},
			-- s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
			-- s = {
			-- 	function()
			-- 		require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
			-- 	end,
			-- 	"Search with Grep",
			-- },
		},
		G = {
			name = "+GIT",
			c = { "<CMD>Telescope git_commits<CR>", "Show Commits" },
			b = { "<CMD>Telescope git_bcommits<CR>", "Show Buffer Commits" },
			s = { "<CMD>Telescope git_status<CR>", "Show Status" },
			t = { "<CMD>Telescope git_stash<CR>", "Show Stashes" },
		},
		l = {
			name = "+VimTeX",
			i = { "<plug>(vimtex-info)", "Info" },
			I = { "<plug>(vimtex-info-full)", "Info Full" },
			t = { "<plug>(vimtex-toc-open)", "ToC Open" },
			T = { "<plug>(vimtex-toc-toggle)", "ToC Toggle" },
			q = { "<plug>(vimtex-log)", "Log" },
			v = { "<plug>(vimtex-view)", "View" },
			r = { "<plug>(vimtex-reverse-search)", "Reverse Search" },
			l = { "<plug>(vimtex-compile)", "Compile" },
			L = { "<plug>(vimtex-compile-selected)", "Compile Selected" },
			k = { "<plug>(vimtex-stop)", "Stop" },
			K = { "<plug>(vimtex-stop-all)", "Stop All" },
			e = { "<plug>(vimtex-errors)", "Errors" },
			o = { "<plug>(vimtex-compile-output)", "Compile Output" },
			g = { "<cmd>lua _lazygit_toggle()<CR>", "Open Lazygit" },
			-- g = { "<plug>(vimtex-status)", "Status" },
			G = { "<plug>(vimtex-status-all)", "Status All" },
			c = { "<plug>(vimtex-clean)", "Clean" },
			C = { "<plug>(vimtex-clean-full)", "Clean Full" },
			m = { "<plug>(vimtex-imaps-list)", "List i-maps" },
			x = { "<plug>(vimtex-reload)", "Reload" },
			X = { "<plug>(vimtex-reload-state)", "Reload State" },
			s = { "<plug>(vimtex-toggle-main)", "Toggle Main" },
			a = { "<plug>(vimtex-context-menu)", "Context Menu" },
		},
		L = {
			name = "+LSP",
			r = { "<CMD>Telescope lsp_references<CR>", "Show References" },
			d = { "<CMD>Telescope lsp_definitions<CR>", "Show Definitions" },
			t = { "<CMD>Telescope lsp_type_definitions<CR>", "Show Type Definitions" },
			i = { "<CMD>Telescope lsp_implementations<CR>", "Show Implementations" },
			c = { "<CMD>Telescope lsp_code_actions<CR>", "Show Code Actions" },
			ds = { "<CMD>Telescope lsp_document_symbols<CR>", "Show Document Symbols" },
			ws = { "<CMD>Telescope lsp_workspace_symbols<CR>", "Show Workspace Symbols" },
		},
		T = {
			name = "+terminal",
			l = { "<cmd>lua _lazygit_toggle()<CR>", "Open Lazygit" },
			g = { "<cmd>lua _lazygit_toggle()<CR>", "Open Lazygit" },
		},
		t = {
			name = "+type",
			m = { "<CMD>set filetype=markdown<CR>", "Set to Markdown" },
		},
		s = {
			-- Snippets
			r = { "<cmd>source ~/.config/nvim/after/plugin/snippets.lua<CR>", "Reload LuaSnip" },
		},
		g = {
			-- Git
			name = "+git",
			h = {
				name = "+GitHub",
				c = {
					name = "+Commits",
					c = { "<cmd>GHCloseCommit<cr>", "Close" },
					e = { "<cmd>GHExpandCommit<cr>", "Expand" },
					o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
					p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
					z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
				},
				i = {
					name = "+Issues",
					p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
				},
				l = {
					name = "+Litee",
					t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
				},
				r = {
					name = "+Review",
					b = { "<cmd>GHStartReview<cr>", "Begin" },
					c = { "<cmd>GHCloseReview<cr>", "Close" },
					d = { "<cmd>GHDeleteReview<cr>", "Delete" },
					e = { "<cmd>GHExpandReview<cr>", "Expand" },
					s = { "<cmd>GHSubmitReview<cr>", "Submit" },
					z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
				},
				p = {
					name = "+Pull Request",
					c = { "<cmd>GHClosePR<cr>", "Close" },
					d = { "<cmd>GHPRDetails<cr>", "Details" },
					e = { "<cmd>GHExpandPR<cr>", "Expand" },
					o = { "<cmd>GHOpenPR<cr>", "Open" },
					p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
					r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
					t = { "<cmd>GHOpenToPR<cr>", "Open To" },
					z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
				},
				t = {
					name = "+Threads",
					c = { "<cmd>GHCreateThread<cr>", "Create" },
					n = { "<cmd>GHNextThread<cr>", "Next" },
					t = { "<cmd>GHToggleThread<cr>", "Toggle" },
				},
			},
			s = { vim.cmd.Git, "git status" },
			l = { "<CMD>diffget LOCAL<CR>", "get LOCAL diff" },
			b = { "<CMD>diffget BASE<CR>", "get BASE diff" },
			r = { "<CMD>diffget REMOTE<CR>", "get REMOTE diff" },
			j = { "<CMD>diffget //3<CR>", "diffget 3" },
			f = { "<CMD>diffget //2<CR>", "diffget 2" },
			c = { "<CMD>Git commit<CR>", "git commit" },
			pom = { "<CMD>Git push origin main<CR>", "git commit origin main" },
		},
		o = {
			name = "+OBSIDIAN",
			o = { "<CMD>ObsidianOpen<CR>", "Open in Obsidian" },
			n = { "<CMD>ObsidianNew<CR>", "New Obsidian note" },
			f = { "<CMD>ObsidianQuickSwitch<CR>", "Find note with picker" },
			v = { "<CMD>ObsidianFollowLink vsplit<CR>", "Vsplit link" },
			b = { "<CMD>ObsidianBacklinks<CR>", "Backlinks with picker" },
			t = { "<CMD>ObsidianTags<CR>", "Tags with picker" },
			T = { "<CMD>ObsidianToday<CR>", "New daily note" },
			D = { "<CMD>ObsidianDailies<CR>", "Dailies with picker" },
			g = { "<CMD>ObsidianSearch<CR>", "Search with picker" },
			x = { "<CMD>ObsidianToggleCheckbox<CR>", "Toggle checkbox" },
			X = { "<CMD>ObsidianExtractNote<CR>", "Extract selected text" },
			i = { "<CMD>ObsidianPasteImg<CR>", "Paste image" },
			-- l = { "<CMD>ObsidianLink<CR>", "Search with picker"},
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
		b = {
			name = "Barbar",
			p = { "<CMD>BufferPrevious<CR>", "Previous Buffer" },
			n = { "<CMD>BufferNext<CR>", "Next Buffer" },
			["<"] = { "<CMD>BufferMovePrevious<CR>", "Move Previous Buffer" },
			[">"] = { "<CMD>BufferMoveNext<CR>", "Move Next Buffer" },
			x = { "<CMD>BufferPin<CR>", "Pin/Unpin Buffer" },
			w = { "<CMD>BufferClose<CR>", "Close Buffer" },
		},
		a = {
			name = "ACTIONS",
			-- b = { "<cmd>terminal bibexport -o %:p:r.bib %:p:r.aux<CR>", "bib export"},
			c = { "<cmd>VimtexClean<CR>", "clean aux" },
			-- g = { "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>", "edit glossary"},
			-- h = { "<cmd>lua _HTOP_TOGGLE()<CR>", "htop" },
			-- i = { "<cmd>IlluminateToggle<CR>", "illuminate" },
			-- l = { "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", "LSP"},
			p = { '<cmd>lua require("nabla").popup()<CR>', "preview symbols" },
			-- r = { "<cmd>VimtexErrors<CR>", "report errors" },
			s = { "<cmd>e ~/.config/nvim/snippets/tex.lua<CR>", "edit snippets" },
			u = { "<cmd>cd %:p:h<CR>", "update cwd" },
			-- w = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>" , "word"},
			v = { "<plug>(vimtex-context-menu)", "vimtex menu" },
		},
		-- Misc
		u = { vim.cmd.UndotreeToggle, "Toggle Undo Tree" },
		z = { vim.cmd.ZenMode, "Enable Zen mode" },
		["<space>"] = { "za", "Toggle fold" },
	},
	g = {
		R = { "<cmd>TroubleToggle lsp_references<cr>", "LSP References" },
	},
	-- Folding
	K = {
		function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end,
		"Peek fold or hover",
	},
	z = {
		R = { require("ufo").openAllFolds, "Open all folds" },
		M = { require("ufo").closeAllFolds, "Close all folds" },
		r = { require("ufo").openFoldsExceptKinds, "Open folds except kinds" },
		m = { require("ufo").closeFoldsWith, "Close folds with" },
		["<space>"] = { require("ufo").peekFoldedLinesUnderCursor, "Peek folded lines" },
	},
	["<C-n>"] = { vim.cmd.LTPopOutFiletree, "Toggle Nvim Tree" },
	-- ["<C-n>"] = { vim.cmd.NvimTreeToggle, "Toggle Nvim Tree" },
	["<C-p>"] = { "<CMD>Telescope git_files<CR>", "Telescope Find Git File" },
	-- Insert / Visual mode
	["<C-u>"] = {
		function()
			require("luasnip.extras.select_choice")()
		end,
		"Cycle LuaSnip choice node",
		mode = "i",
	},
	-- Barbar. See also leader.
	["<A-,>"] = { "<CMD>BufferPrevious<CR>", "Previous Buffer" },
	["<A-.>"] = { "<CMD>BufferNext<CR>", "Next Buffer" },
	["<A-<>"] = { "<CMD>BufferMovePrevious<CR>", "Move Previous Buffer" },
	["<A->>"] = { "<CMD>BufferMoveNext<CR>", "Move Next Buffer" },
	["<A-p>"] = { "<CMD>BufferPin<CR>", "Pin/Unpin Buffer" },
	["<A-c>"] = { "<CMD>BufferClose<CR>", "Close Buffer" },
})
