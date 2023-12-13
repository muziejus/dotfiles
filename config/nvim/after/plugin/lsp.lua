local lsp = require("lsp-zero")
lsp.preset("minimal")

local luasnip = require("luasnip")

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
local lspkind = require("lspkind")
lspkind.init()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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
		["<C-f>"] = cmp.mapping.scroll_docs(-4), -- cmp_action.luasnip_jump_forward(),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- ["<C-n>"] = cmp.mapping(function(fallback)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		["<C-a>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		-- ["<Esc>"] = cmp.mapping.abort(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.choice_active() then
				luasnip.change_choice(1)
			elseif luasnip.expandable() then
				luasnip.expand()
			-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
			-- they way you will only jump inside the snippet region
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			-- elseif luasnip.choice_active() then
			-- 	luasnip.change_choice(-1)
			-- elseif luasnip.jumpable(-1) then
			-- 	luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "otter" },
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip", keyword_length = 3, max_item_count = 3 },
		-- { name = "pandoc_references" },
		{ name = "buffer", keyword_length = 5, max_item_count = 3 },
		{ name = "spell" },
		{ name = "treesitter", keyword_length = 5, max_item_count = 3 },
		{ name = "calc" },
		{ name = "latex_symbols" },
		{ name = "emoji" },
	},
	formatting = {
		-- fileds = { "abbr", "kind", "menu" },
		format = lspkind.cmp_format({
			-- mode = "symbol",
			-- maxwidth = 50,
			-- ellipsis_char = "…",
			with_text = true,
			menu = {
				otter = "[🦦]",
				copilot = "[]",
				luasnip = "[snip]",
				nvim_lsp = "[LSP]",
				buffer = "[buf]",
				path = "[path]",
				spell = "[spell]",
				pandoc_references = "[ref]",
				tags = "[tag]",
				treesitter = "[TS]",
				calc = "[calc]",
				latex_symbols = "[tex]",
				emoji = "[emoji]",
			},
		}),
	},
	view = {
		entries = "native",
	},
})

-- setup in ftplugin for java.

-- setup in ftplugin for tex.

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" },
		{ name = "conventionalcommits" },
	}),
})

require("cmp_git").setup()
require("cmp_pandoc").setup()
