local cmp = require("cmp")

vim.api.nvim_command("call pencil#init({'wrap': 'hard', 'autoformat': 0})")

cmp.setup.filetype("quarto", {
	sources = cmp.config.sources({
		{ name = "luasnip", keyword_length = 2 },
		-- { name = "latex_symbols" }, -- don't actually like this one bit.
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "pandoc_references" },
		{ name = "buffer", keyword_length = 5, max_item_count = 3 },
		{ name = "spell" },
		{ name = "treesitter", keyword_length = 5, max_item_count = 3 },
		{ name = "calc" },
		{ name = "emoji" },
	}),
})

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.opt["conceallevel"] = 2
-- vim.cmd("highlight Conceal guifg=" .. colors.orange .. " guibg=NONE")

require("nvim-surround").buffer_setup({
	surrounds = {
		["O"] = {
			add = { "**", "**" },
			find = "\\%a-bf%b{}",
			delete = "^(\\%a-bf{)().-(})()$",
		},
		["I"] = {
			add = { "_", "_" },
			find = "\\%a-it%b{}",
			delete = "^(\\%a-it{)().-(})()$",
		},
		["T"] = {
			add = { "`", "`" },
			find = "\\%a-tt%b{}",
			delete = "^(\\%a-tt{)().-(})()$",
		},
	},
})

local api = vim.api
local ts = vim.treesitter

vim.b.slime_cell_delimiter = "```"
vim.b["quarto_is_r_mode"] = nil
vim.b["reticulate_running"] = false

-- wrap text, but by word no character
-- indent the wrappped line
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.showbreak = "|"

-- don't run vim ftplugin on top
vim.api.nvim_buf_set_var(0, "did_ftplugin", true)

-- markdown vs. quarto hacks
local ns = vim.api.nvim_create_namespace("QuartoHighlight")
vim.api.nvim_set_hl(ns, "@markup.strikethrough", { strikethrough = false })
vim.api.nvim_set_hl(ns, "@markup.doublestrikethrough", { strikethrough = true })
vim.api.nvim_win_set_hl_ns(0, ns)

-- highlight code cells similar to
-- 'lukas-reineke/headlines.nvim'
-- (disabled in lua/plugins/ui.lua)
local buf = api.nvim_get_current_buf()

local parsername = "markdown"
local parser = ts.get_parser(buf, parsername)
local tsquery = "(fenced_code_block)@codecell"

-- vim.api.nvim_set_hl(0, '@markup.codecell', { bg = '#000055' })
vim.api.nvim_set_hl(0, "@markup.codecell", {
	link = "CursorLine",
})

local function clear_all()
	local all = api.nvim_buf_get_extmarks(buf, ns, 0, -1, {})
	for _, mark in ipairs(all) do
		vim.api.nvim_buf_del_extmark(buf, ns, mark[1])
	end
end

local function highlight_range(from, to)
	for i = from, to do
		vim.api.nvim_buf_set_extmark(buf, ns, i, 0, {
			hl_eol = true,
			line_hl_group = "@markup.codecell",
		})
	end
end

local function highlight_cells()
	clear_all()

	local query = ts.query.parse(parsername, tsquery)
	local tree = parser:parse()
	local root = tree[1]:root()
	for _, match, _ in query:iter_matches(root, buf, 0, -1, { all = true }) do
		for _, nodes in pairs(match) do
			for _, node in ipairs(nodes) do
				local start_line, _, end_line, _ = node:range()
				pcall(highlight_range, start_line, end_line - 1)
			end
		end
	end
end

highlight_cells()

vim.api.nvim_create_autocmd({ "ModeChanged", "BufWrite" }, {
	group = vim.api.nvim_create_augroup("QuartoCellHighlight", { clear = true }),
	buffer = buf,
	callback = highlight_cells,
})
