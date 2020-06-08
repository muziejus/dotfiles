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
set hidden " TextEdit might fail if hidden is not set.


"stop saving swp to watched directories.
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

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
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p ")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p ")<CR>
" map <F3> :r!date +"\%Y-\%m-\%d \%H:\%M:\%S"
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
autocmd Filetype javascript,json if getfsize(@%) > 20000 | setlocal syntax=OFF | endif
"autocmd FileType javascript,ruby,json " setlocal foldmethod=syntax foldlevel=0 foldlevelstart=2  as opposed to fold by indent.
autocmd BufNewFile,BufRead firestore.rules set filetype=firestore
autocmd FileType json syntax match Comment +\/\/.\+$+ " Allow commenting for jsonc files.

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
Plug 'mhinz/vim-startify'
Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
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
" Plug 'Konfekt/vim-sentence-chopper' " breaks.
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
"
""" Filesystem
" Plug 'wincent/command-t' " can't get the ruby library to linkup.
Plug 'tpope/vim-projectionist'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax' 

" Colors
syntax enable " syntax highlighting
set t_Co=256 "force vim to use 256 colors
" let g:werewolf_day_themes = ['PaperColor']
" let g:werewolf_night_themes = ['solarized']
" let g:werewolf_day_start = 7
" let g:werewolf_day_end = 17
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorschem solarized8
if strftime("%H") < 17
  set background=light
else
  set background=dark
endif

" Printing
set printfont=Ubuntu
set printencoding=utf-8
set printoptions="paper:letter,number:y"



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
let g:vimwiki_list = [{'path': '~/Library/Mobile Documents/com~apple~CloudDocs/notes', 'syntax': 'markdown'}]
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
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:markdown_fenced_languages = ['html', 'javascript', 'ruby', 'python']

" Utl
nmap <F4> :Utl o u vsplit<cr>
 
" CoC / Intellisense
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-ember',
  \ 'coc-tailwindcss'
\ ]

" Better display for messages
" set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" vim-startify
let g:startify_custom_header = [
    \ '    ██╗   ██╗██╗███╗   ███╗      ███████╗██╗███████╗███████╗████████╗ █████╗ ',
    \ '    ██║   ██║██║████╗ ████║      ██╔════╝██║██╔════╝██╔════╝╚══██╔══╝██╔══██╗',
    \ '    ██║   ██║██║██╔████╔██║█████╗█████╗  ██║█████╗  ███████╗   ██║   ███████║',
    \ '    ╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██╔══╝  ██║██╔══╝  ╚════██║   ██║   ██╔══██║',
    \ '     ╚████╔╝ ██║██║ ╚═╝ ██║      ██║     ██║███████╗███████║   ██║   ██║  ██║',
    \ '      ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚═╝     ╚═╝╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝',
    \ ]
                                                                         


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
" nmap zy <plug>(ChopSentences)
" xmap zy <plug>(ChopSentences)
" onoremap <silent> . :<c-u>call search('\v\C%(%([^[:digit:]IVX]\|[)''"])\zs[.]\|[,;:!?])[[:space:])''"]\|[.,;:!?]$','W')<CR>

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
