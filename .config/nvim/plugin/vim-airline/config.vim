let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_section_x = ''
let g:airline_section_y = airline#section#create_right(['bookmark', 'tagbar', 'vista', 'gutentags', 'grepper', 'filetype'])
let g:airline_section_z = airline#section#create(['%l', '/%L', g:airline_symbols.space.':%2v'])
