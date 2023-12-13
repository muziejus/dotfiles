local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")

local new_maker = function(filepath, bufnr, opts)
	opts = opts or {}
	filepath = vim.fn.expand(filepath)
	vim.loop.fs_stat(filepath, function(_, stat)
		if not stat then
			return
		end
		if stat.size > 100000 then
			return
		else
			previewers.buffer_previewer_maker(filepath, bufnr, opts)
		end
	end)
end

telescope.load_extension("bibtex")
telescope.load_extension("projections")
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("dap")

telescope.setup({
	defaults = {
		buffer_previewer_maker = new_maker,
		file_ignore_patterns = {
			"node_modules",
			"%_files/*.html",
			"%_cache",
			".git/",
			"site_libs",
			".venv",
		},
		layout_strategy = "flex",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
		mappings = {
			n = { ["<c-t>"] = trouble.open_with_trouble },
			i = {
				["<c-t>"] = trouble.open_with_trouble,
				["<C-u>"] = false,
				["<C-d>"] = false,
				["<esc>"] = actions.close,
				["<c-j>"] = actions.move_selection_next,
				["<c-k>"] = actions.move_selection_previous,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = false,
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--glob",
				"!.git/*",
				"--glob",
				"!**/.Rproj.user/*",
				"--glob",
				"!_site/*",
				"--glob",
				"!docs/**/*.html",
				"-L",
			},
		},
	},
	load_extensions = { "yank_history", "bibtex" },
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
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
