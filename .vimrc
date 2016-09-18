" Compatibility
set nocompatible

" General
set background=dark         " dark background
set hidden
set ttyfast
set nowrap
set textwidth=0             " don't break lines
set nobackup
set nowritebackup
set showmatch               " higlight matching braces

" Search
set incsearch               " search while typing
set hlsearch                " highlight search
set ignorecase              " case insensitive search
set smartcase               " override ignorecase if uppercase in search string

" Indentation
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2

" Display
set number
set numberwidth=6
set scrolloff=4             " minimal number of screen lines to keep above and below the cursor.
set colorcolumn=80          "
set splitright              " open vertical split right of current window

" Files, Buffer and Clipboard
set autoread                " auto reload buffer when file modified externally
set clipboard=unnamed       " yank and paste using system clipboard
set noswapfile              " do not use a swap file for buffers
set nowritebackup           " do not make backup before overwriting file

" set relativenumber
set showcmd
set laststatus=2            " always show statusline
set background=dark
set cursorline

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules$\|build$\|dist$\|.tmp$\|coverage$\|platforms$\|_boiler$\|platforms$\|plugins$\|bower_components$\|.vagrant$\|.sass-cache$',
  \ 'file': '\.so$\|\.dat$\|.swp$'
  \ }
let g:ctrlp_show_hidden = 1

set t_Co=256
let g:solarized_termcolors=256

" jshint2
let jshint2_save = 1

"colorscheme badwolf
let g:badwolf_darkgutter = 1
let g:badwolf_darkbackground = 1
"colorscheme tomorrow2
colorscheme badwolf

" syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_eslint_exec = "~/Local/bin/eslint"
let g:syntastic_javascript_checkers = ['eslint']

" spell-checking
:setlocal spell spelllang=en_us

syntax enable
set complete+=kspell
execute pathogen#infect()
"
map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git --exclude-from=exclude.list . -e " . expand("<cword>") . " " <bar> cwindow<CR>
nnoremap <F12>c :exe ':silent !chromium-browser %<F12>'<CR>
"
autocmd BufNewFile,BufReadPost *.less setl filetype=less
autocmd BufNewFile,BufReadPost *.md setl filetype=markdown shiftwidth=2 tabstop=2 spell textwidth=0 colorcolumn=72 wrap linebreak
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost *.litcoffee setl shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost Cakefile setl shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost javascript setl nocindent shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost *.tsv setl noexpandtab listchars=eol:$,tab:>- list
autocmd BufNewFile,BufReadPost *.swig setl filetype=html
autocmd Filetype gitcommit setlocal spell textwidth=72 colorcolumn=72
"
autocmd BufWritePre *.{less,md,coffee,litcoffee,Cakefile,js} :%s/\s\+$//e

" CursorHold : fires after you move the cursor and then let it sit still for updatetime milliseconds. (Default 4 seconds.)
" checktime  : check for changes on disk and prompt you to reload
autocmd CursorHold * checktime      " check for file changes on cursor 'idle'
autocmd WinEnter * checktime        " check for file changes on window enter
