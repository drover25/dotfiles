require('gitsigns').setup {
  signs = {
    add          = {hl = 'DiffAdd'   , text = ' '},
    change       = {hl = 'DiffChange', text = ' '},
    delete       = {hl = 'DiffDelete', text = ' '},
    topdelete    = {hl = 'DiffDelete', text = ' '},
    changedelete = {hl = 'DiffChange', text = ' '},
  },
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]h'] = { expr = true, "&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [h'] = { expr = true, "&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
  },
  watch_index = {
    interval = 1000
  },
  sign_priority = 6,
}

require('neogit').setup {
  integrations = {
    diffview = true
  }
}
