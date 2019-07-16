set nocompatible
set hidden

filetype off

call plug#begin('~/.local/share/nvim/plugged')
Plug 'sheerun/vim-polyglot' " Syntax plugins
Plug 'tpope/vim-sensible' " Sensible defaults
Plug 'tpope/vim-repeat' " Allow plugins to harness .
Plug 'tpope/vim-surround' " Surround action for text objects
Plug 'wellle/targets.vim' " Add some more text objects
Plug 'tpope/vim-fugitive' " source control plugins
Plug 'qpkorr/vim-bufkill' " Kill buffers w/o killing the split
Plug 'tpope/vim-commentary' " Comment all the things
Plug 'tpope/vim-obsession' " Save vim sessions. Works nice with TMUX
Plug 'tmux-plugins/vim-tmux-focus-events' " TMUX integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'Valloric/ListToggle' " Toggle the quickfix and loclist
Plug 'arcticicestudio/nord-vim' " Theme
Plug 'rakr/vim-one' " Theme
Plug 'vim-airline/vim-airline' " Statusbar plugins
Plug 'editorconfig/editorconfig-vim' " Default formatting
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} " LSP
call plug#end()

filetype plugin indent on

runtime! plugin/**/*.vim
