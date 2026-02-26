local options = {
	-- Cursors and Look
	guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
	cursorline = true,
	signcolumn = "yes:1", -- always show signcolumn
	showmode = false, -- Don't show -- INSERT --
	-- Search
	ignorecase = false,
	smartcase = true,
	-- Line numbers
	nu = true,
	relativenumber = true,
	-- Tabs
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	-- Text stuff. Prose options changed in ftplugin files.
	formatoptions = "cqn", -- comments wrap, gq works, handle numbered lists.
	textwidth = 0,
	breakindent = true, -- long lines get broken and indented
	breakindentopt = "shift:2,min:40,sbr",
	autoindent = true,
	smartindent = true,
	conceallevel = 0, -- don't obfuscate Markdown
	-- completeopt = { "menuone", "noselect" }, -- show completion menu but don't autoselect
	completeopt = "menuone,noinsert", -- show completion menu but don't autoselect
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
	hlsearch = true,
	incsearch = true,
	-- Color
	termguicolors = true,
	colorcolumn = "80",
	-- Offset
	scrolloff = 8,
	-- Outside world
	clipboard = "unnamedplus",
	mouse = "a",
	mousefocus = true,
	-- Run fast
	updatetime = 50,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,]") -- use arrow keys to wrap lines

-- vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't auto continue comments

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
