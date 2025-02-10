local function is_file_open()
	return #(vim.fn.expand("%")) > 0
end

local function filepath()
	local path = vim.fn.expand("%")
	if vim.fn.winwidth(0) <= 84 then
		path = vim.fn.pathshorten(path)
	end

	if not path or #path == 0 then
		return ""
	end

	local icon = require("nvim-web-devicons").get_icon(path)
	return icon .. "  " .. path
end

local function getWords()
	return tostring(vim.fn.wordcount().words)
end
require("lualine").setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				always_visible = is_file_open,
				update_in_insert = true,
			},
		},
		lualine_c = {
			-- filepath,
		},
		lualine_x = {
			"PencilMode",
			getWords,
			--"encoding",
			--"fileformat",
			{
				"filetype",
				icon_only = true,
			},
		},
		lualine_y = { "location" }, -- { "progress" },
		lualine_z = { "ctime" }, -- { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
