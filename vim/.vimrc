set nocompatible
set hidden

filetype off

call plug#begin('~/.vim/plugged')
" Syntax plugins
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/SWIG-syntax'
Plug 'google/vim-ft-bzl'

" Sensible defaults
Plug 'tpope/vim-sensible'

" Allow plugins to harness .
Plug 'tpope/vim-repeat'

" Surround action for text objects
Plug 'tpope/vim-surround'

" Add some more text objects
Plug 'wellle/targets.vim'

" Navigation
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" source control plugins
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Kill buffers w/o killing the split
Plug 'qpkorr/vim-bufkill'

" Comment all the things
Plug 'tpope/vim-commentary'

" Save vim sessions. Works nice with TMUX
Plug 'tpope/vim-obsession'

" TMUX integration
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

" Themes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'

" Statusbar plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'

" LSP
Plug 'w0rp/ale'

" Language specific plugins
Plug 'fatih/vim-go'

call plug#end()

filetype plugin indent on

"===================="
" Some basic options "
"===================="

" Enable syntax highlighting
syntax on

" Enable italics
set t_ZH=^[[3m
set t_ZR=^[[23m

" Setup theme
set termguicolors
set background=dark
let g:nord_comment_brightness = 20
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
colorscheme nord

" Highlight search results
set hls

" Highlight current line
set cursorline

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" Explicitly set the Leader to comma. You you can use '\' (the default),
" or anything else (some people like ';').
let mapleader=','

" Setup an undodir for persistant undo state.
set undofile
set undodir=~/.vim/undodir

" Disable the preview window
set completeopt-=preview

"====================================="
" Source other vimrcs if we have them "
"====================================="
let has_local = filereadable($HOME . '/.local_vimrc')
if has_local
  source ~/.local_vimrc
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

  " Automatically enter/leave insert mode in terminal
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
endif

" copy the current text selection to the system clipboard
" https://sunaku.github.io/tmux-yank-osc52.html
if has('gui_running') || has('nvim') && exists('$DISPLAY')
  noremap <leader>y "+y
else
  " copy to attached terminal using the yank(1) script:
  " https://github.com/sunaku/home/blob/master/bin/yank
  noremap <silent> <leader>y y:call system('yank > /dev/tty', @0)<Return>
endif

"=================="
" Package Settings "
"=================="

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

" ----- vim-airline/vim-airline -----
let g:airline_powerline_fonts = 1
let g:airline_detct_paste = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#ale#enabled = 1

" ----- tpope/vim-fugitive -----
nnoremap <leader>gs :Gstatus<CR>

" ----- mhinz/vim-signify -----
" let g:signify_realtime = 1

" ----- w0rp/ale -----
nnoremap <C-]> :ALEGoToDefinition <CR>
