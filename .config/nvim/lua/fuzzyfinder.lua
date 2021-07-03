require('telescope').setup{
  defaults = {
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
  }
}
require('telescope').load_extension('coc')

