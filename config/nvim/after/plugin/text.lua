-- Don't forget that TeX things are handled at the ftplugin-level.

require("nvim-prose").setup({
	wpm = 200.0,
	filetypes = { "tex", "markdown", "asciidoc" },
	placeholders = {
		words = "w",
		minutes = "min",
	},
})

-- Quarto
require("quarto").setup({
	debug = false,
	closePreviewOnExit = true,
	lspFeatures = {
		enabled = true,
		languages = { "python", "r", "julia", "bash" }, -- javascript?
		chunks = "curly", -- or "all"
		diagnostics = {
			enabled = true,
			triggers = { "BufWritePost" },
		},
		completion = {
			enabled = true,
		},
	},
	codeRunner = {
		enabled = false,
		default_method = nil, -- 'molten' or 'slime'
		ft_runners = {}, -- filteype to runner, ie `{python = "molten"}`
		never_run = { "yaml" },
	},
	keymap = {
		hover = "K",
		definition = "gd",
		rename = "<leaderlR",
		references = "gr",
	},
})

-- PandocAutoexecCommand = function()
-- 	local vim_pandoc_template = vim.b.pandoc_yaml_data.vim_pandoc_template
-- 	local command = "Pandoc pdf"
-- 	if vim_pandoc_template then
-- 		command = "Pandoc #" .. vim_pandoc_template
-- 	end
-- 	vim.cmd(command)
-- end

-- -- vim.g["pandoc#command#autoexec_on_writes"] = 1
-- vim.g["pandoc#command#autoexec_command"] = "lua PandocAutoexecCommand()"
-- -- vim.g["pandoc#command#custom_open"] = "lua PandocAutoOpenCommand(file)"
-- vim.g["pandoc#command#custom_open"] = "MyPandocOpen"
-- vim.g["pandoc#biblio#sources"] = "yGtbc"
-- vim.g["pandoc#biblio#use_bibtool"] = 1
-- vim.g["pandoc#syntax#conceal#use"] = 0
-- vim.g["pandoc#syntax#conceal#blacklist"] = { "inlinemath", "codeblock_start", "codeblock_delim", "inlinecode" }

-- vim.cmd[[
-- 	function! MyPandocOpen(file)
-- 		let file = shellescape(fnamemodify(a:file, ':p'))
-- 		let file_extension = fnamemodify(a:file, ':e')
-- 		if file_extension is? 'pdf'
--       return "/Applications/Skim.app/Contents/MacOS/Skim " . file
-- 		elseif file_extension is? 'html'
-- 			if !empty($BROWSER)
-- 				return expand('$BROWSER') . ' ' . file
-- 			elseif executable('firefox')
-- 				return 'firefox ' . file
-- 			elseif executable('chromium')
-- 				return 'chromium ' . file
-- 			endif
-- 		elseif file_extension is? 'odt' && executable('okular')
-- 			return 'okular ' . file
-- 		elseif file_extension is? 'epub' && executable('okular')
-- 			return 'okular ' . file
-- 		else
-- 			return 'xdg-open ' . file
-- 		endif
-- 	endfunction
-- ]]
--
--
