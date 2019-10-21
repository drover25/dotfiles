set nocompatible
set hidden

filetype off

call plug#begin('~/.local/share/nvim/plugged')
Plug 'arcticicestudio/nord-vim' " Theme
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim' " Default formatting
Plug 'edkolev/tmuxline.vim' " Tmuxline config
Plug 'honza/vim-snippets' " Some snippets
Plug 'lifepillar/vim-solarized8' " Theme
Plug 'morhetz/gruvbox' " Theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " A lot of things...
Plug 'qpkorr/vim-bufkill' " Kill buffers w/o killing the split
Plug 'rakr/vim-one' " Theme
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'scrooloose/nerdtree' " File explorer
Plug 'sheerun/vim-polyglot' " Syntax plugins
Plug 'tmux-plugins/vim-tmux-focus-events' " TMUX integration
Plug 'tpope/vim-commentary' " Comment all the things
Plug 'tpope/vim-fugitive' " source control plugins
Plug 'tpope/vim-obsession' " Save vim sessions. Works nice with TMUX
Plug 'tpope/vim-repeat' " Allow plugins to harness .
Plug 'tpope/vim-sensible' " Sensible defaults
Plug 'tpope/vim-surround' " Surround action for text objects
Plug 'vim-airline/vim-airline' " Statusbar plugins
Plug 'vim-airline/vim-airline-themes' " Statusbar plugins
Plug 'wellle/targets.vim' " Add some more text objects
Plug 'Xuyuanp/nerdtree-git-plugin' " Add git status to NerdTree
call plug#end()

filetype plugin indent on

runtime! plugin/**/*.vim
