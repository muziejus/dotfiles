local lsp = vim.lsp

-- ===============================
-- Python
-- ===============================
lsp.config["ruff"] = {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { ".git", ".gitignore" },
}
lsp.enable("ruff") -- only for diagnostics; no formatting

-- ===============================
-- Lua
-- ===============================
lsp.config["luals"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
}
lsp.enable("luals")

-- ===============================
-- JavaScript / TypeScript
-- ===============================
lsp.config["ts_ls"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
}
lsp.enable("ts_ls")

-- ===============================
-- Tailwind CSS (diagnostics only)
-- ===============================
lsp.config["tailwindcss"] = {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"html",
		"css",
		"handlebars",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
	},
	settings = { tailwindCSS = { validate = true } },
}
lsp.enable("tailwindcss")

-- ===============================
-- Markdown diagnostics (Vale)
-- ===============================
lsp.config["vale"] = {
	cmd = { "vale", "--lsp" },
	filetypes = { "markdown", "md" },
	root_markers = { ".git", ".vale.ini" },
}
lsp.enable("vale")

-- ===============================
-- R / Quarto
-- ===============================
lsp.config["r_language_server"] = {
	cmd = { "R", "--no-echo", "-e", "languageserver::run()" },
	filetypes = { "quarto" },
	root_markers = { ".git", ".gitignore" },
}
lsp.enable("r_language_server")

-- ===============================
-- Ember / Glimmer
-- ===============================

lsp.config["ember"] = {
	cmd = { "ember-language-server", "--stdio" },
	filetypes = {
		"handlebars",
		"typescript",
		"javascript",
		"typescript.glimmer",
		"javascript.glimmer",
	},
	root_markers = { "package.json", "ember-cli-build.js" },
}
lsp.enable("ember")

lsp.config["glint"] = {
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
lsp.enable("glint")

require("mason").setup({})
