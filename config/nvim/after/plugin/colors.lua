require("catppuccin").setup({
	auto_integrations = true,
})

function ColorMyPencils(color)
	color = color or "catppuccin-mocha"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- require("barbecue").setup({
	-- 	theme = color,
	-- })

	require("lualine").setup({
		options = {
			theme = color,
		},
	})
end

ColorMyPencils()
