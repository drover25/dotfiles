set nocompatible
set hidden

runtime! before/**/*.vim

filetype off

lua require ('plugins')
if !exists('g:vscode')
  " lua require('lsp')
  lua require('highlighting')
  lua require('fuzzyfinder')
  lua require('spaceline')
  lua require('gitdisplay')

  let g:vista_sidebar_position = 'vertical topleft'
  let g:vista_default_executive = 'coc'
  let g:vista_fzf_preview = ['right:50%']
  let g:vista#renderer#enable_icon = 1
  nnoremap <C-t> :Vista!!<CR>

  " " Use completion-nvim in every buffer
  " autocmd BufEnter * lua require'completion'.on_attach()
  " " Use <Tab> and <S-Tab> to navigate through popup menu
  " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " " Set completeopt to have a better completion experience
  " set completeopt=menuone,noinsert,noselect
  " " Avoid showing message extra message when using completion
  " set shortmess+=c
  " " Tune matching
  " let g:completion_matching_smart_case = 1
  " let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
  " " Setup snippets
  " let g:completion_enable_snippet = 'vim-vsnip'
  " " Completion chain
  " let g:completion_chain_complete_list = [
  "       \{'complete_items': ['lsp', 'snippet']},
  "       \{'complete_items': ['buffers', 'tmux']},
  "       \{'mode': '<c-p>'},
  "       \{'mode': '<c-n>'}
  "       \]
  " let g:completion_auto_change_source = 1

  nnoremap <C-n> :LuaTreeToggle<CR>
  nnoremap <leader>f :LuaTreeFindFile<CR>
  let g:lua_tree_bindings = {
    \ 'edit':            ['<CR>', 'o'],
    \ 'edit_vsplit':     '<C-v>',
    \ 'edit_split':      '<C-x>',
    \ 'edit_tab':        '<C-t>',
    \ 'toggle_ignored':  'I',
    \ 'toggle_dotfiles': 'H',
    \ 'refresh':         'R',
    \ 'preview':         '<Tab>',
    \ 'cd':              '<C-]>',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'y',
    \ 'paste':           'p',
    \ 'prev_git_item':   '[c',
    \ 'next_git_item':   ']c',
    \ }
else
  nnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
  xnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
  nnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
  xnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
  nnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
  xnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
  nnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
  xnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
endif

filetype plugin indent on

runtime! plugin/**/*.vim
