local function codecompanion_send()
	local keys = vim.api.nvim_replace_termcodes("<C-s>", true, false, true)
	vim.api.nvim_feedkeys(keys, "m", false)
end

vim.keymap.set("n", "gS", codecompanion_send, {
	buffer = true,
	desc = "CodeCompanion Send",
})
