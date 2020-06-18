set nocompatible
set hidden

runtime! before/**/*.vim

filetype off

call plug#begin('~/.local/share/nvim/plugged')
Plug 'arcticicestudio/nord-vim' " Theme
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " Syntax for styled components
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim' " Default formatting
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'honza/vim-snippets' " Some snippets
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'lifepillar/vim-solarized8' " Theme
Plug 'morhetz/gruvbox' " Theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " A lot of things...
Plug 'qpkorr/vim-bufkill' " Kill buffers w/o killing the split
Plug 'rakr/vim-one' " Theme
Plug 'rbong/vim-flog' " git graph
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'sheerun/vim-polyglot' " Syntax plugins
Plug 'shumphrey/fugitive-gitlab.vim' " GitLab/fugitive integration
Plug 'tmux-plugins/vim-tmux-focus-events' " TMUX integration
Plug 'tpope/vim-commentary' " Comment all the things
Plug 'tpope/vim-fugitive' " source control plugins
Plug 'tpope/vim-obsession' " Save vim sessions. Works nice with TMUX
Plug 'tpope/vim-repeat' " Allow plugins to harness .
Plug 'tpope/vim-rhubarb' " Github/fugitive integration
Plug 'tpope/vim-sensible' " Sensible defaults
Plug 'tpope/vim-surround' " Surround action for text objects
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
Plug 'vim-airline/vim-airline' " Statusbar plugins
Plug 'vim-airline/vim-airline-themes' " Statusbar plugins
Plug 'voldikss/vim-floaterm' " Floating terminal!
Plug 'wellle/targets.vim' " Add some more text objects
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
call plug#end()

filetype plugin indent on

runtime! plugin/**/*.vim
