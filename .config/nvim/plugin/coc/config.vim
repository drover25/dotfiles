if !exists('g:vscode')
  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " use `:Prettier` to run Prettier on current buffer
  command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  let g:coc_node_path = '/Users/drover/n/n/versions/node/12.16.2/bin/node'
endif
