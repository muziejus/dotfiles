local lsp = require("lsp-zero")
lsp.preset("minimal")

lsp.set_server_config({
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
})

lsp.configure("lua_ls", {
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
})

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr }

	vim.keymap.set({ "n", "x" }, "gq", function()
		vim.lsp.buf.format({
			async = false,
			timeout_ms = 10000,
			-- filter == allow_format({'lua_ls', 'tsserver'}) -- if needed
		})
	end, opts)
end)

lsp.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

-- Format on gq
lsp.format_mapping("gq", {
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "typescript", "lua" },
	},
})

-- Format on save, too.
lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "typescript", "lua" },
	},
})

lsp.setup()

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.commitlint,
		null_ls.builtins.formatting.prettierd.with({
			-- From my old null-ls setup.
			-- env = {
			-- 	PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
			-- },
			-- prefer_local = "node_modules/.bin",
			filetypes = {
				"css",
				"json",
				"jsonc",
				"javascript",
				"typescript",
				"javascript.glimmer",
				"typscript.glimmer",
				"handlebars",
			},
		}),
		null_ls.builtins.code_actions.gitsigns,
		-- null_ls.builtins.completion.luasnip,
		-- null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.stylua,
		-- Spell check that has better tooling
		-- all stored locally
		-- https://github.com/streetsidesoftware/cspell
		-- null_ls.builtins.diagnostics.cspell.with({
		--   -- This file is symlinked from my dotfiles repo
		--   extra_args = { "--config", "~/.cspell.json" }
		-- }),
	},
})

require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
})

-- cmp is already configured using lsp-zero's defaults.
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		-- ["<Tab>"] = cmp_action.luasnip_supertab(),
		-- ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	},
	sources = {
		{ name = "cmp_pandoc" },
		-- { name = "latex_symbols" }, -- don't actually like this one bit.
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 5 },
		{ name = "luasnip", keyword_length = 2 },
	},
	formatting = {
		fileds = { "abbr", "kind", "menu" },
		format = require("lspkind").cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "…",
		}),
	},
})

require("cmp_pandoc").setup()
