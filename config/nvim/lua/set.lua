local options = {
	-- Cursors and Look
	guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
	cursorline = true,
	signcolumn = "yes", -- always show signcolumn
	showmode = false, -- Don't show -- INSERT --
	-- Line numbers
	nu = true,
	relativenumber = true,
	-- Tabs
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	-- Text stuff
	breakindent = true, -- long lines get broken and indented
	smartindent = true,
	textwidth = 75,
	conceallevel = 0, -- don't obfuscate Markdown
	completeopt = { "menuone", "noselect" }, -- show completion menu but don't autoselect
	-- Splits
	splitbelow = true,
	splitright = true,
	-- File handling
	autowriteall = true, -- Write buffers when losing focus
	fileencoding = "utf-8",
	swapfile = false,
	backup = false,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,
	-- Search
	hlsearch = false,
	incsearch = true,
	-- Color
	termguicolors = true,
	colorcolumn = "80",
	-- Offset
	scrolloff = 8,
	-- Outside world
	clipboard = "unnamedplus",
	mouse = "a",
	-- Run fast
	updatetime = 50,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,]") -- use arrow keys to wrap lines

vim.opt.isfname:append("@-@") -- Add "@" to possible filenames.
vim.opt.shortmess:append("c") -- Move through "Hit Enter" messages quickly

-- Highlight on yank
vim.api.nvim_exec(
	[[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
  ]],
	false
)
