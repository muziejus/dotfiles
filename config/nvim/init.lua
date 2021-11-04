require("settings") -- lua/settings.lua
require("maps") -- lua/maps.lua

--[[
"" Use vim stuff?
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"" source ~/.vimrc
"
"set nu " Line numbers
"" set cursorline " highlight current line
"" set noautochdir " Stop changing working directories on me.
"
"" stop saving swp to watched directories.
"" nvim should set these by default to something similar
"" set backupdir=~/.vim/backup//
"" set directory=~/.vim/swp//
"
"""" Keymappings
"set pastetoggle=<F2> " make it easier to paste code.
"nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p ")<CR><Esc>
"imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p ")<CR>
"" map <F3> :r!date +"\%Y-\%m-\%d \%H:\%M:\%S"
"nnoremap <SPACE> <Nop>
"let mapleader=" "
"let maplocalleader="\\"
"set expandtab " to get a real tab, type Ctrl-V<Tab>
"" Center search results
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz
"nnoremap G Gzz
"
"""" Tabs
"set tabstop=2
"set softtabstop=2
"set shiftwidth=2
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
"""" Plugins
"call plug#begin('~/.vim/plugged')
"" Editing
"  Plug 'thinca/vim-visualstar'
"" Look and Feel
"  Plug 'arcticicestudio/nord-vim'
"  Plug 'itchyny/lightline.vim'
"  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"" Org
"  Plug 'vimwiki/vimwiki'
"" Syntax
"  Plug 'tpope/vim-commentary' " creates gcc for commenting things
"" Git
"  Plug 'airblade/vim-gitgutter' " shows changes in gutter
"  Plug 'tpope/vim-fugitive' " Git wrapper.
"" Autocomplete
"  Plug 'neovim/nvim-lspconfig'
"" Filesystem
"  Plug 'tpope/vim-projectionist'
"  Plug 'preservim/nerdtree'
"  Plug 'Xuyuanp/nerdtree-git-plugin'
"  Plug 'ryanoasis/vim-devicons'
"call plug#end()
"
"colorscheme nord
"
"" Splits
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"" change the directions of new splits
"set splitbelow
"set splitright
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
"" lightline
"set noshowmode "get rid of rendundant -- INSERT --
"let g:lightline = {
"  \ 'colorscheme': 'nord'
"  \ }
"" fugitive (from https://www.youtube.com/watch?v=PO6DxfGPQvw)
"nmap <leader>gs :G<CR>
"nmap <leader>gh :diffget //3<CR>
"nmap <leader>gu :diffget //2<CR>
"nmap <leader>gc :Git commit<CR>
"nmap <leader>gpom :Git push origin main<CR>
"" vimwiki
"let g:vimwiki_list = [{'path': '/Users/moacir/Dropbox/notes', 'syntax': 'markdown', 'ext': '.md'}]
"" NERDTree
"map <C-n> :NERDTreeToggle<CR> " toggle NERDtree
"" NERDTree git status
"let g:NERDTreeGitStatusUseNerdFonts = 1
--]]

