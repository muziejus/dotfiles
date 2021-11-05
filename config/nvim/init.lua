require("plugins") -- lua/plugins.lua
require("settings") -- lua/settings.lua
require("maps") -- lua/maps.lua
require("statusline")


--[[
"" Use vim stuff?
"" set cursorline " highlight current line
"" set noautochdir " Stop changing working directories on me.
"
"" stop saving swp to watched directories.
"" nvim should set these by default to something similar
"" set backupdir=~/.vim/backup//
"" set directory=~/.vim/swp//
"
"""" Filetypes
"" autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
"" autocmd FileType Markdown,vimwiki,pandoc,mkd,text,tex,plaintex,mail setlocal spell spelllang=en_us formatoptions=nt textwidth=78 wrapmargin=0 indentexpr=
"" autocmd FileType Markdown,vimwiki,pandoc,mkd,text,tex,plaintex,mail call textobj#quote#init()
"" autocmd FileType Markdown,vimwiki,pandoc,mkd,text,tex,plaintex,mail call textobj#sentence#init()
"" autocmd FileType html setlocal spell spelllang=en_us "foldmethod=syntax foldlevel=1
"" autocmd Filetype javascript,json if getfsize(@%) > 20000 | setlocal syntax=OFF | endif
"" autocmd BufNewFile,BufRead firestore.rules set filetype=firestore
"" autocmd FileType json syntax match Comment +\/\/.\+$+ " Allow commenting for jsonc files.
"
"" tmux_navigator things
"" let g:tmux_navigator_no_mappings = 1
"" nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
"" nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
"" nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
"" nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"" nmap ,d :b#<bar>bd#<CR> " closes buffer but keeps split.
"
""use {
""  'nvim-treesitter/nvim-treesitter',
""  config = function()
""    require'nvim-treesitter.configs'.setup {
""      ensure_installed = {
""        "javascript", "typescript", "glimmer", "tsx",
""        "html", "jsdoc", "regex", "zsh",
""        "toml", "html", "yaml", "jsonc",
""        "css", "lua"
""      },
""      ignore_install = {
""        "json" -- jsonc is better
""      },
""      highlight = {
""        enable = true,
""      }
""    }
""  end
""}
"
"""" Plugin settings
"lua << EOF
"require'lspconfig'.html.setup{}
"require'lspconfig'.ember.setup{}
"EOF
"" vimwiki
"" NERDTree
"map <C-n> :NERDTreeToggle<CR> " toggle NERDtree
"" NERDTree git status
"let g:NERDTreeGitStatusUseNerdFonts = 1
--]]
