-- It's funny. This is set to 0 in set.lua just so markdown doesn't
-- conceal, but, like, now I want concealing?
-- vim.opt["conceallevel"] = 2

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.api.nvim_command("call pencil#init()")

vim.bo.formatexpr = "v:lua.MarkdownVentilate()"

function _G.MarkdownVentilate()
	if vim.fn.mode():match("^[iR]") then
		return 0
	end

	local start = vim.v.lnum
	local finish = start + vim.v.count - 1

	-- Trim trailing blank lines from range
	while finish > start and vim.fn.getline(finish):match("^%s*$") do
		finish = finish - 1
	end

	-- Treesitter paragraph check
	local parser = vim.treesitter.get_parser(0, "markdown")
	if not parser then
		return 0
	end

	local tree = parser:parse()[1]
	local root = tree:root()
	local row = start - 1
	local node = root:named_descendant_for_range(row, 0, row, 0)

	while node do
		if node:type() == "paragraph" then
			break
		end
		node = node:parent()
	end

	if not node or node:type() ~= "paragraph" then
		return 0
	end

	-- Join paragraph only (no blank line)
	vim.cmd(string.format("%d,%djoin", start, finish))

	-- Split sentences
	vim.cmd(string.format("%ds/\\([.!?][\"'”’]*\\)\\s\\+/\\1\\r/g", start))

	return 0
end
