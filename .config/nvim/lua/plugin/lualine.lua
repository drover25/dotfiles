require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "nord",
		component_separators = { "", "" },
		section_separators = { "", "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = { "diff", require("lsp-status").status },
		lualine_x = { "filetype" },
		lualine_y = { "branch" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree", "quickfix" },
})
