local ls = require("luasnip")
local types = require("luasnip.util.types")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

ls.config.setup({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.insertNode] = {
			active = {
				hl_group = "TermCursor",
			},
			unvisited = {
				virt_text = { { "unvisited", "Search" } },
			},
			passive = {
				virt_text = { { "Pass", "Search" } },
			},
		},
	},
	--   [require("luasnip.util.types").choiceNode] = {
	--     active = {
	--       virt_text = { {"•", "GruvboxOrange" } },
	--     },
	--   },
	-- },
})
