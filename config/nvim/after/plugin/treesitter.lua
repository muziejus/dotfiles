require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"javascript",
		"typescript",
		"graphql",
		"yaml",
		"regex",
		"html",
		"css",
		"jsonc",
		"glimmer",
		"markdown",
		"markdown_inline",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"diff",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"java",
	},
	ignore_install = { "json", "latex" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = { "latex" },
	},

	-- rainbow = {
	-- 	enable = true,
	-- 	extended_mode = true,
	-- },

	playground = {
		enabled = true,
	},

	indent = {
		enable = true,
		disable = { "python", "latex", "markdown" },
	},

	autopairs = {
		enable = true,
	},
})

vim.treesitter.language.register("markdown", "mdx")
