local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.load_extension("bibtex")
telescope.load_extension("projections")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	load_extensions = { "yank_history", "bibtex" },
	extensions = {
		bibtex = {
			-- Defaults commented out
			-- depth = 1,
			global_files = { "/Users/moacir/Library/texmf/bibtex/bib/Zotero.bib" },
			-- search_keys = { "author", "year", "title" },
			-- citation_format = "{{author}} ({{year}}) {{title}}",
			-- citation_trim_firstname = true,
			-- citation_max_auth = 2,
		},
	},
})
