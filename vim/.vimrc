set nocompatible
set hidden

filetype off

let is_google = filereadable($HOME . '/.google_vimrc')

call plug#begin('~/.vim/plugged')
" Syntax plugins
Plug 'tmux-plugins/vim-tmux'
Plug 'dag/vim-fish'
Plug 'vim-scripts/SWIG-syntax'
Plug 'tpope/vim-git'

" Sensible defaults
Plug 'tpope/vim-sensible'

" Allow plugins to harness .
Plug 'tpope/vim-repeat'

" Surround action for text objects
Plug 'tpope/vim-surround'

" Add some more text objects
Plug 'wellle/targets.vim'

" Navigation
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" For concentrating on one thing
Plug 'junegunn/goyo.vim'

" Kill buffers w/o killing the split
Plug 'qpkorr/vim-bufkill'

" Automatic closing quote, bracket etc.
Plug 'Raimondi/delimitMate'

" Visualize the undo tree
Plug 'sjl/gundo.vim'

" Comment all the things
Plug 'tpope/vim-commentary'

" Save vim sessions. Works nice with TMUX
Plug 'tpope/vim-obsession'

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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Async make. Lots of linters built in.
Plug 'benekastah/neomake'

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

" Setup an undodir for persistant undo state.
set undofile
set undodir=~/.vim/undodir

"==================================="
" Source google vimrc if we have it "
"==================================="

if is_google
  source ~/.google_vimrc
endif

"=================="
" Custom shortcuts "
"=================="

" Quick save and exit
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>

" Get back to normal quickly
inoremap jk <Esc>
vnoremap jk <Esc>

" Toggle paste mode
set pastetoggle=<F2>

if has('nvim')
  " Get back to normal quickly
  tnoremap jk <C-\><C-n>

  " Move from the neovim terminal window to somewhere else
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

"=================="
" Package Settings "
"=================="

" ----- SirVer/ultisnips -----
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" ----- benekastah/neomake -----
autocmd! BufWritePost,BufEnter * Neomake
hi MyErrorMsg ctermbg=black ctermfg=red cterm=bold
let g:neomake_error_sign = {
      \ 'text': '>>',
      \ 'texthl': 'MyErrorMsg',
      \ }
hi MyWarningMsg ctermbg=black ctermfg=magenta cterm=bold
let g:neomake_warning_sign = {
      \ 'text': '>>',
      \ 'texthl': 'MyWarningMsg',
      \ }

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
