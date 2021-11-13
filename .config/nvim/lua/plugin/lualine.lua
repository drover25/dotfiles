require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "onenord",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "filetype", icon_only = true }, "filename" },
		lualine_c = { "diff", { "diagnostics", sources = { "nvim_lsp" } } },
		lualine_x = {},
		lualine_y = { "branch" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filetype", icon_only = true }, { "filename", path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree" },
})

require("tabline").setup({
	-- Defaults configuration options
	enable = true,
	options = {
		max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
		show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
		show_devicons = true, -- this shows devicons in buffer section
		show_bufnr = false, -- this appends [bufnr] to buffer section,
		show_filename_only = false, -- shows base filename only instead of relative path in filename
	},
})

vim.cmd([[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]])

U.keymap.map("n", "gb", ":TablineBufferNext<CR>", { noremap = true, silent = true })
U.keymap.map("n", "gB", ":TablineBufferPrevious<CR>", { noremap = true, silent = true })
