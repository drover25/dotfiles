if !exists('g:vscode')
  nmap <silent> <c-p> :Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git<CR>
  nmap <silent> <c-s> :Telescope buffers<CR>
  nmap <silent> <c-c> :Telescope builtin<CR>
  nnoremap <leader>g :Telescope live_grep<CR>
endif
