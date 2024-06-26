-- gh.nvim configured in ui.lua
local neogit = require("neogit")

neogit.setup()

require("gitsigns").setup({
	signcolumn = true,
	numhl = true,
	linehl = false,
	word_diff = false,
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 100,
		ignore_whitespace = true,
	},
	attach_to_untracked = true,
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		-- add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		-- change = {
		-- 	hl = "GitSignsChange",
		-- 	text = "▎",
		-- 	numhl = "GitSignsChangeNr",
		-- 	linehl = "GitSignsChangeLn",
		-- },
		-- delete = {
		-- 	hl = "GitSignsDelete",
		-- 	text = "",
		-- 	numhl = "GitSignsDeleteNr",
		-- 	linehl = "GitSignsDeleteLn",
		-- },
		-- topdelete = {
		-- 	hl = "GitSignsDelete",
		-- 	text = "",
		-- 	numhl = "GitSignsDeleteNr",
		-- 	linehl = "GitSignsDeleteLn",
		-- },
		-- changedelete = {
		-- 	hl = "GitSignsChange",
		-- 	text = "▎",
		-- 	numhl = "GitSignsChangeNr",
		-- 	linehl = "GitSignsChangeLn",
		-- },
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map({ "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
		map({ "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})
