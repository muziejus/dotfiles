return {
	"github/copilot.vim",
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "ollama",
					},
					inline = {
						adapter = "ollama",
					},
					agent = {
						adapter = "ollama",
					},
				},

				adapters = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "Ollama",
							schema = {
								model = {
									default = "qwen2.5-coder:7b",
								},
							},
						})
					end,
				},
			})
		end,
	},
}
