nmap <silent> <c-p> :<C-u>CocCommand fzf-preview.DirectoryFiles<CR>
nmap <silent> <c-s> :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <leader>s :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <leader>g :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap <leader>g "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
