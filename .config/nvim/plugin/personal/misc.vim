" Set mouse mode
set mouse=a

" Faster diagnostic
set updatetime=300

" Don't give |ins-completion-menu| messages
set shortmess+=c

" Setup an undodir for persistant undo state.
" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
