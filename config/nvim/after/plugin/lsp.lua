local null_ls = require("null-ls")

vim.lsp.config["luals"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

vim.lsp.enable("luals")

-- vim.lsp.config["texlab"] = {
--   cmd = { "texlab"},
--   filetypes = { "quarto" },
--   root_markers = { ".git", ".gitignore" },
-- }
--
-- vim.lsp.enable("texlab")

vim.lsp.config["r_language_server"] = {
	cmd = { "R", "--no-echo", "-e", "languageserver::run()" },
	filetypes = { "quarto" },
	root_markers = { ".git", ".gitignore" },
}
vim.lsp.enable("r_language_server")

-- vim.lsp.config["pyright"] = {
--   cmd = {"pyright-langserver", "--stdio"},
--   filetypes = { "python" },
--   root_markers = { ".git", ".gitignore" },
-- }
-- vim.lsp.enable("pyright")

vim.lsp.config["ruff"] = {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { ".git", ".gitignore" },
}
vim.lsp.enable("ruff")

vim.lsp.config["ember"] = {
	cmd = { "ember-language-server", "--stdio" },
	filetypes = { "handlebars", "typescript", "javascript", "typescript.glimmer", "javascript.glimmer" },
	root_markers = { "package.json", "ember-cli-build.js" },
}

vim.lsp.enable("ember")

vim.lsp.config["glint"] = {
	cmd = { "glint-language-server" },
	filetypes = {
		"html.handlebars",
		"handlebars",
		"typescript",
		"javascript",
		"typescript.glimmer",
		"javascript.glimmer",
	},
	root_markers = {
		".glintrc.yml",
		".glintrc",
		".glintrc.json",
		".glintrc.js",
		"glint.config.js",
		"package.json",
	},
}

vim.lsp.enable("glint")

vim.lsp.config["ts_ls"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
}

vim.lsp.enable("ts_ls")

vim.lsp.config["tailwindcss"] = {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir",
		"elixir",
		"ejs",
		"erb",
		"eruby",
		"gohtml",
		"gohtmltmpl",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"htmlangular",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"templ",
	},
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
			includeLanguages = {
				eelixir = "html-eex",
				elixir = "phoenix-heex",
				eruby = "erb",
				heex = "phoenix-heex",
				htmlangular = "html",
				templ = "html",
			},
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			validate = true,
		},
	},
}

vim.lsp.enable("tailwindcss")

require("mason").setup({})

-- null_ls.setup({
-- sources = {
-- null_ls.builtins.code_actions.gitsigns,
-- null_ls.builtins.completion.luasnip,
--		null_ls.builtins.diagnostics.commitlint,
-- null_ls.builtins.formatting.black, -- use ruff instead
-- null_ls.builtins.formatting.format_r,
-- From my old null-ls setup.
-- env = {
-- 	PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
-- },
-- prefer_local = "node_modules/.bin",
-- Spell check that has better tooling
-- all stored locally
-- https://github.com/streetsidesoftware/cspell
-- null_ls.builtins.diagnostics.cspell.with({
--   -- This file is symlinked from my dotfiles repo
--   extra_args = { "--config", "~/.cspell.json" }
-- }),
-- 	},
-- })
