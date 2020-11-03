if !exists('g:vscode')
  let g:floaterm_open_command='edit'
  let g:floaterm_position='center'
  map <C-n> :FloatermNew lf<CR>
  nnoremap <leader>t :FloatermToggle<CR>
  if has('nvim')
    tnoremap <leader>t <C-d>
  endif
endif
