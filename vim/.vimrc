set nocompatible
set hidden

filetype off

let is_google = filereadable($HOME . '/.google_vimrc')

call plug#begin('~/.vim/plugged')
" Syntax plugins
Plug 'tmux-plugins/vim-tmux'
Plug 'dag/vim-fish'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/SWIG-syntax'
Plug 'tpope/vim-git'

" Navigation
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Shortcuts and general
Plug 'qpkorr/vim-bufkill'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'junegunn/goyo.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tags to get to functions classes etc.
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" TMUX integration
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

" Themes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'altercation/vim-colors-solarized'

" Statusbar plugins
Plug 'vim-airline/vim-airline', { 'commit': '70ca735af008b413a611420ca34d38fc4d5f6088' }
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Code completion
if !is_google
  Plug 'Valloric/YouCompleteMe'
endif

call plug#end()

filetype plugin indent on

"===================="
" Some basic options "
"===================="

" Enable syntax highlighting
syntax on

" Setup theme
set background=dark
colorscheme solarized

" Highlight search results
set hls

" Highlight current line
set cursorline

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" By default, it looks up man pages for the word under the cursor, which isn't
" very useful, so we map it to something else.
nnoremap <s-k> <CR>

" Explicitly set the Leader to comma. You you can use '\' (the default),
" or anything else (some people like ';').
let mapleader=','

" Statusbar config
set laststatus=2

"=================="
" Custom shortcuts "
"=================="

" Quick save and exit
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>

" Tab cycling
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Get back to normal quickly
inoremap jk <Esc>
vnoremap jk <Esc>

" Toggle paste mode
set pastetoggle=<F2>

"==================================="
" Source google vimrc if we have it "
"==================================="

if is_google
  source ~/.google_vimrc
endif


"=================="
" Package Settings "
"=================="

" ----- SirVer/ultisnips -----
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" ----- scrooloose/syntastic -----
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----- junegunn/fzf -----
nmap <silent> <c-p> :Files<CR>
nmap <silent> <c-s> :Buffers<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

 " Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
let g:easytags_include_members = 1
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- vim-airline/vim-airline -----
let g:airline_powerline_fonts = 1
let g:airline_detct_paste = 1

" ----- tpope/vim-fugitive -----
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>

" ----- Valloric/YouCompleteMe -----
nnoremap <C-]> :YcmCompleter GoTo<CR>
