set nocompatible
set hidden

filetype off

"Try Plug

call plug#begin('~/.vim/plugged')
" Syntax plugins
Plug 'tmux-plugins/vim-tmux'
Plug 'dag/vim-fish'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/SWIG-syntax'
Plug 'tpope/vim-git'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'rking/ag.vim'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Shortcuts and general
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'Valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'vim-scripts/CursorLineCurrentWindow'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nathanaelkane/vim-indent-guides'

" Tags to get to functions classes etc.
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" TMUX integration
Plug 'christoomey/vim-tmux-navigator'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'

" Statusbar plugins
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'

" Code completion
if !filereadable($HOME . '/google_vimrc')
else
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
colorscheme hybrid
set guifont=Menlo\ for\ Powerline

" Show line numbers
set number

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


"==================================="
" Source google vimrc if we have it "
"==================================="

if filereadable($HOME . '/.google_vimrc')
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
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----- scrooloose/nerdtree -----
map <C-n> :NERDTreeToggle<CR>

" ----- kien/ctrlp.vim -----
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore .git5_specs
      \ --ignore review
      \ -g ""'
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
let g:ctrlp_working_path_mode = 0

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags

" ----- tpope/vim-sensible -----
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
nmap <silent> <C-m> :TagbarToggle<CR>

" ----- bling/vim-airline -----
let g:airline_powerline_fonts = 1
let g:airline_detct_paste = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='hybrid'

" ----- tpope/vim-fugitive -----
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>ga :Gwrite<CR>

" ----- nathanaelkane/vim-indent-guides -----
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
