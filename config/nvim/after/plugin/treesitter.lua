local parsers = {
	"r",
	"python",
	"javascript",
	"typescript",
	"graphql",
	"yaml",
	"regex",
	"html",
	"css",
	"jsonc",
	"glimmer",
	"markdown",
	"markdown_inline",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"diff",
	"git_rebase",
	"gitcommit",
	"gitignore",
	"java",
	"bash",
	"dot",
}

require("nvim-treesitter").setup({
	ensure_installed = parsers,
	ignore_install = { "json", "latex" },
	auto_install = true,
})

-- Highlighting: core Neovim, unless a ftplugin opts out
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		if vim.b[ev.buf].disable_treesitter then
			return
		end
		pcall(vim.treesitter.start, ev.buf)
	end,
})

-- Indent: only python left here; latex handles itself in its ftplugin
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function(ev)
		vim.bo[ev.buf].indentexpr = ""
	end,
})

-- -- Textobjects: guarded so a missing/renamed module can't nuke startup again.
-- local ok, textobjects = pcall(require, "nvim-treesitter.textobjects")
-- if ok then
--   textobjects.setup({
--     select = {
--       enable = true,
--       lookahead = true,
--       keymaps = {
--         ["af"] = "@function.outer",
--         ["if"] = "@function.inner",
--         ["ac"] = "@class.outer",
--         ["ic"] = "@class.inner",
--       },
--     },
--   })
-- end

vim.treesitter.language.register("markdown", "mdx")
