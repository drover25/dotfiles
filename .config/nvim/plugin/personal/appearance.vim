set termguicolors

syntax on " Enable syntax highlighting
set t_ZH=^[[3m " Enable italics
set t_ZR=^[[23m
highlight Comment cterm=italic
set hls " Highlight search results
set cursorline " Highlight current line
set list listchars=tab:»\ ,trail:° " use » to mark Tabs and ° to mark trailing whitespace
set completeopt-=preview " Disable the preview window
set signcolumn=yes " Always draw the signcolumn.
set relativenumber " Relative numbers
set cmdheight=2 " Better display for messages
if has('nvim')
  au TermOpen * setlocal nonumber norelativenumber signcolumn=no " Disable linenumbers in term
endif

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
    colorscheme nord
elseif iterm_profile == "light"
    set background=light
    let g:one_allow_italics=1
    colorscheme one
else
    set background=dark
    let g:one_allow_italics=1
    colorscheme one
endif

