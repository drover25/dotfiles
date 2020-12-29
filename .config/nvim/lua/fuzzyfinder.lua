require('telescope').setup{
  defaults = {
    color_devicons = false,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
  }
}
