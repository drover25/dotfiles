if !exists('g:vscode')
  syntax on " Enable syntax highlighting
  set t_ZH=^[[3m " Enable italics
  set t_ZR=^[[23m
  highlight Comment cterm=italic
  set hls " Highlight search results
  set cursorline " Highlight current line

  " configure nvcode-color-schemes
  let g:nvcode_termcolors=256

  " checks if your terminal has 24-bit color support
  if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
  endif

  set list listchars=tab:»\ ,trail:° " use » to mark Tabs and ° to mark trailing whitespace
  set completeopt-=preview " Disable the preview window
  set signcolumn=yes " Always draw the signcolumn.
  set relativenumber " Relative numbers
  if has('nvim')
    au TermOpen * setlocal nonumber norelativenumber signcolumn=no " Disable linenumbers in term
  endif

  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
  augroup END

  let iterm_profile = $ITERM_PROFILE
  if iterm_profile == "solarized-dark"
    set background=dark
    let g:airline_solarized_bg="dark"
    colorscheme solarized8_flat
  elseif iterm_profile == "solarized-light"
    set background=light
    let g:airline_solarized_bg="light"
    colorscheme solarized8_flat
  elseif iterm_profile == "gruvbox-dark"
    set background=dark
    let g:gruvbox_italic=1
    colorscheme gruvbox
  elseif iterm_profile == "gruvbox-light"
    set background=light
    let g:gruvbox_italic=1
    colorscheme gruvbox
  elseif iterm_profile == "nord"
    set background=dark
    let g:nord_underline=1
    let g:nord_italic=1
    let g:nord_italic_comments=1
    let g:nord_uniform_diff_background=1
    let g:nord_bold_vertical_split_line=1
    let g:nord_uniform_status_lines=0
    colorscheme aurora
  elseif iterm_profile == "light"
    set background=light
    let g:one_allow_italics=1
    colorscheme one
  else
    set background=dark
    let g:one_allow_italics=1
    colorscheme one
  endif
endif
