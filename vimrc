" General Settings
set nocompatible " uses vim settings instead of vi.
set enc=utf-8 " encode as utf-8 by default
" set path+=** " for :find
set ruler " shows the line along the bottom
set nu " show line numbers
set cursorline " highlight current line
set showcmd " display incomplete commands
set incsearch " incremental searching ?
"set noautochdir " Stop changing working directories on me.

"stop saving swp to watched directories.
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Colors
syntax enable " syntax highlighting
set t_Co=256 "force vim to use 256 colors
" let g:werewolf_day_themes = ['PaperColor']
" let g:werewolf_night_themes = ['solarized']
" let g:werewolf_day_start = 7
" let g:werewolf_day_end = 17
colorschem solarized
if strftime("%H") < 17
  set background=light
else
  set background=dark
endif

" General Keymappings
set backspace=indent,eol,start " backspace kills all in insert
set pastetoggle=<F2> " make it easier to paste code.
let mapleader="," " this removes backward f/t search
let maplocalleader="\\"
set expandtab " to get a real tab, type Ctrl-V<Tab>
set tabstop=2
set softtabstop=2
set shiftwidth=2
map Q gq " don't use Ex mode
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G Gzz

" Filetypes
filetype plugin indent on " Load filetype plugin and indent files
" autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
autocmd FileType Markdown,vimwiki,pandoc,mkd,text,tex,plaintex,mail setlocal spell spelllang=en_us formatoptions=nt textwidth=78 wrapmargin=0 indentexpr=
autocmd FileType Markdown,vimwiki,pandoc,mkd,text,tex,plaintex,mail call textobj#quote#init()
autocmd FileType Markdown,vimwiki,pandoc,mkd,text,tex,plaintex,mail call textobj#sentence#init()
autocmd FileType html setlocal spell spelllang=en_us "foldmethod=syntax foldlevel=1
autocmd Filetype javascript,json if getfsize(@%) > 10000 | setlocal syntax=OFF | endif
"autocmd FileType javascript,ruby,json " setlocal foldmethod=syntax foldlevel=0 foldlevelstart=2  as opposed to fold by indent.
autocmd BufNewFile,BufRead firestore.rules set filetype=firestore

" Folding
autocmd Syntax javascript,ruby,json,html setlocal foldmethod=syntax foldlevel=1 foldlevelstart=2
" let g:vimwiki_folding = 'custom'
let g:vimwiki_folding = 'expr'

" Spelling
hi clear SpellBad " change look of misspelled words
hi link SpellBad Special

" Colaboration
set exrc " allows for project-specific vimrcs.

""" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-unimpaired' " Hop around things
Plug 'tpope/vim-surround' " Surround stuff
Plug 'tpope/vim-repeat' " expands what gets repeated by .
Plug 'tpope/vim-speeddating' " Use <C-A> and <C-X> to change dates.
Plug 'chrisbra/NrrwRgn' " Create narrow regions
Plug 'ctrlpvim/ctrlp.vim' " Find things
Plug 'majutsushi/tagbar' " More tagging
" Plug 'jonstoler/werewolf.vim'
Plug 'Konfekt/vim-sentence-chopper'
""" Text
Plug 'kana/vim-textobj-user' " define textobjs easily
Plug 'reedes/vim-textobj-quote' " for curly quotes
Plug 'reedes/vim-textobj-sentence' " for sentence manipulation
Plug 'tpope/vim-abolish' " fancy find/replacing
Plug 'plasticboy/vim-markdown'
""" Org
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes' " This kills notes w/o warning.
Plug 'vimwiki/vimwiki'
""" Git
Plug 'airblade/vim-gitgutter' " shows changes in gutter
Plug 'tpope/vim-fugitive' " Git wrapper.
""" Syntax
Plug 'tpope/vim-commentary' " creates gcc for commenting things
Plug 'tpope/vim-endwise' " for adding an 'end' do a ruby 'do'
Plug 'tpope/vim-ragtag' " ^x mappings for editing xml
Plug 'nathanaelkane/vim-indent-guides', { 'for': ['javascript', 'python', 'json', 'ruby'] } " Creates indent guides
Plug 'vim-syntastic/syntastic', { 'for': ['ruby', 'python'] }
Plug 'xojs/vim-xo'
Plug 'w0rp/ale'
Plug 'jparise/vim-graphql'
Plug 'jxnblk/vim-mdx-js'
Plug 'leafgarland/typescript-vim'
Plug 'delphinus/vim-firestore'
" Autocomplete
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'mattn/emmet-vim' " Snippets with <c-y>,
""" This is way too much IDE shit to get Javascript to work.
" Plug 'wokalski/autocomplete-flow'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
""" IDE magic
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
""" Filesystem
" Plug 'wincent/command-t' " can't get the ruby library to linkup.
Plug 'tpope/vim-projectionist'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax' 

" Autocomplete
let g:deoplete#enable_at_startup = 1

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" change the directions of new splits
set splitbelow
set splitright
" tmux_navigator things
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
nmap ,d :b#<bar>bd#<CR> " closes buffer but keeps split.

" Airline
" https://github.com/vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
set laststatus=2 " startsup airline

" Vim-markdown
" https://github.com/gabrielelana/vim-markdown
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

" syntastic
" https://github.com/vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': ['html'] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_javascript_checkers = ['xo']
" let g:syntastic_javascript_eslint_args = ['--fix']
let g:syntastic_html_tidy_ignore_errors = [ '<input> proprietary attribute "role"', "plain text isn't allowed in <head> elements", "trimming empty <i>" ]
let g:syntastic_quiet_messages = { "regex": [
      \ 'display math end',
  \ 'math begin',
  \ 'instead of \$\$',
  \ ] }

" Show indents
" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']


" set folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Vim-notes
let g:notes_directories = ['~/Documents/Notes', '~/Dropbox/Shared Notes']
let g:notes_suffix = '.txt'
let g:notes_word_boundaries = 1


" for mustache abbrs
let g:mustache_abbreviations = 1


" Bundle 'christoomey/vim-tmux-navigator'




" let twitvim_enable_ruby = 1
" let twitvim_browser_cmd = 'open'
" let twitvim_old_retweet = 1

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/notes/', 'syntax': 'markdown'}]
" let wiki.nested_syntaxes = {'ruby': 'ruby', 'python': 'python', 'javascript': 'javascript'}

" autosave when loses focus
autocmd BufLeave,FocusLost * silent! wall

" NERDTree
map <C-n> :NERDTreeToggle<CR> " toggle NERDtree
" autocmd vimenter * if !argc() | NERDTree | endif " open NERDtree if no file specified
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " close vim if NERDTree is the only window left

" launch wiki
" This crashes, but the nerdtree doesn't...
" autocmd VimEnter * if !argc() | VimwikiIndex | endif

" make backups work right w/ crontabs
au BufEnter /private/tmp/crontab.* setl backupcopy=yes


" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:markdown_fenced_languages = ['html', 'javascript', 'ruby', 'python']

" Utl
nmap <F4> :Utl o u vsplit<cr>
 
" CoC / Intellisense

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
  \ 'coc-ember'
\ ]
" Better display for messages
" set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
" don't give |ins-completion-menu| messages.
" set shortmess+=c
" always show signcolumns
" set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" vim-firestore
let g:vim_firestore_warnings = 0

" ale
let g:ale_linters = {
\   'javascript': ['xo'],
\}
" let g:ale_linters_explicit = 1
let g:ale_fixers = ['prettier', 'xo']
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" This breaks html fixes.
" let g:ale_fix_on_save = 1

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" sentence-chopping
nmap zy <plug>(ChopSentences)
xmap zy <plug>(ChopSentences)
onoremap <silent> . :<c-u>call search('\v\C%(%([^[:digit:]IVX]\|[)''"])\zs[.]\|[,;:!?])[[:space:])''"]\|[.,;:!?]$','W')<CR>

" Spare functions

function! SoftWrap()
    let s:old_tw = &textwidth
    set tw=999999
    normal gggqG
    let &tw = s:old_tw
endfunction

function! MarkdownLevel() 
    let h = matchstr(getline(v:lnum), '^#\+') 
    if empty(h) 
        return "=" 
    else 
        return ">" . len(h) 
    endif
endfunction

function! MyFormatExpr(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

" set formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)
