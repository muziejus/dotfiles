return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Required
			{ "hrsh7th/cmp-path" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			-- See snippets.lua for snippets.
			{ "hrsh7th/cmp-calc" }, -- Required
			{ "hrsh7th/cmp-cmdline" }, -- Required
			{ "hrsh7th/cmp-emoji" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "petertriho/cmp-git" },
			{ "davidsierradz/cmp-conventionalcommits" },
			-- { "aspeddro/cmp-pandoc.nvim" },
			{ "jmbuhr/cmp-pandoc-references" },
			{ "kdheepak/cmp-latex-symbols" },
			{ "mfussenegger/nvim-jdtls" },
			{ "onsails/lspkind-nvim" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "f3fora/cmp-spell" },
			{ "ray-x/cmp-treesitter" },
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
}
