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

	mappings = {
		send = {
			-- In normal mode, use <leader>s
			-- In insert mode, use Ctrl+Enter (which is <C-CR>)
			modes = { n = "<leader>s", i = "<C-CR>" },
		},
	},
})
