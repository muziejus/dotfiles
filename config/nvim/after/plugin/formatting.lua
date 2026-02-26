local conform = require("conform")

conform.formatters.ventilate = {
	command = "ventilate",
	stdin = true,
	args = {},
}

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		tex = { "ventilate", "latexindent" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "ventilate", "prettierd" },
		graphql = { "prettierd" },
		liquid = { "prettierd" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		if ft == "tex" then
			require("conform").format({ bufnr = args.buf, timeout_ms = 10000 })
		else
			require("conform").format({ bufnr = args.buf })
		end
	end,
})
