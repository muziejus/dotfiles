vim.lsp.config['luals'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      },
			diagnostics = {
				globals = { "vim" },
			},
			telemetry = {
				enable = false,
			},
    }
  }
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

vim.lsp.config["pyright"] = {
  cmd = {"pyright-langserver", "--stdio"},
  filetypes = { "python" },
  root_markers = { ".git", ".gitignore" },
}
vim.lsp.enable("pyright")

vim.lsp.config["ember"] = {
  cmd = { "ember-language-server", "--stdio"},
  filetypes = { "handlebars", "typescript", "javascript", "typescript.glimmer", "javascript.glimmer" },
  root_markers = {"package.json", "ember-cli-build.js"}
}

vim.lsp.enable("ember")

vim.lsp.config["glint"] = {
  cmd = { "glint-language-server"},
  filetypes = { "html.handlebars", "handlebars", "typescript", "javascript", "typescript.glimmer", "javascript.glimmer" },
  root_markers = {
      '.glintrc.yml',
      '.glintrc',
      '.glintrc.json',
      '.glintrc.js',
      'glint.config.js',
      'package.json'
  }
}

vim.lsp.enable("glint")

vim.lsp.config["ts_ls"] = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    root_dir = {'tsconfig.json', 'jsconfig.json', 'package.json', '.git'}
}


--
-- local function allow_format(servers)
-- 	return function(client)
-- 		return vim.tbl_contains(servers, client.name)
-- 	end
-- end
--
-- lsp.set_server_config({
-- 	capabilities = {
-- 		textDocument = {
-- 			foldingRange = {
-- 				dynamicRegistration = false,
-- 				lineFoldingOnly = true,
-- 			},
-- 		},
-- 	},
-- })
--
-- lsp.configure("texlab", {
-- 	filetypes = { "quarto" },
-- })
--
-- lsp.configure("lua_ls", {
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				version = "LuaJIT",
-- 			},
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- })
--
-- lsp.on_attach(function(_, bufnr)
-- 	lsp.default_keymaps({ buffer = bufnr })
-- 	-- local opts = { buffer = bufnr }
--
-- 	-- vim.keymap.set({ "n", "x" }, "gq", function()
-- 	-- 	vim.lsp.buf.format({
-- 	-- 		async = false,
-- 	-- 		timeout_ms = 10000,
-- 	-- 	})
-- 	-- end, opts)
-- end)
--
-- lsp.set_sign_icons({
-- 	error = "✘",
-- 	warn = "▲",
-- 	hint = "⚑",
-- 	info = "»",
-- })
--
-- Format on gq
-- lsp.format_mapping("gq", {
-- 	format_opts = {
-- 		async = false,
-- 		timeout_ms = 10000,
-- 		filter = allow_format({ "lua_ls", "tsserver", "pyright", "markdown-oxide" }),
-- 	},
-- 	servers = {
-- 		["null-ls"] = { "javascript", "typescript", "lua", "python", "markdown" },
-- 	},
-- })

-- Format on save, too.
-- lsp.format_on_save({
-- 	format_opts = {
-- 		async = false,
-- 		timeout_ms = 10000,
-- 	},
-- 	servers = {
-- 		["null-ls"] = { "javascript", "typescript", "lua", "python" },
-- 	},
-- })
--
-- lsp.setup()

-- local null_ls = require("null-ls")
-- null_ls.setup({
-- 	sources = {
-- 		null_ls.builtins.diagnostics.ruff,
-- 		null_ls.builtins.formatting.black,
-- 		null_ls.builtins.diagnostics.commitlint,
-- 		null_ls.builtins.formatting.prettierd.with({
-- 			-- From my old null-ls setup.
-- 			-- env = {
-- 			-- 	PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
-- 			-- },
-- 			-- prefer_local = "node_modules/.bin",
-- 			filetypes = {
-- 				"css",
-- 				"json",
-- 				"jsonc",
-- 				"javascript",
-- 				"typescript",
-- 				"javascript.glimmer",
-- 				"typscript.glimmer",
-- 				"handlebars",
-- 			},
-- 		}),
-- 		null_ls.builtins.code_actions.gitsigns,
-- 		-- null_ls.builtins.completion.luasnip,
-- 		-- null_ls.builtins.diagnostics.eslint,
-- 		null_ls.builtins.formatting.stylua,
-- 		-- Spell check that has better tooling
-- 		-- all stored locally
-- 		-- https://github.com/streetsidesoftware/cspell
-- 		-- null_ls.builtins.diagnostics.cspell.with({
-- 		--   -- This file is symlinked from my dotfiles repo
-- 		--   extra_args = { "--config", "~/.cspell.json" }
-- 		-- }),
-- 	},
-- })

require("mason").setup({})
-- require("mason-lspconfig").setup({
-- 	ensure_installed = {
-- 		"pyright",
-- 	},
-- 	handlers = {
-- 		lsp.default_setup,
-- 	},
-- })

-- require("mason-null-ls").setup({
-- 	ensure_installed = nil,
-- 	automatic_installation = true,
-- })

