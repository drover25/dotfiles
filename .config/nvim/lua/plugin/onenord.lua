local colors = require("onenord.colors")

require("onenord").setup({
	borders = true, -- Split window borders
	styles = {
		comments = "italic", -- Style that is applied to comments: see `highlight-args` for options
		strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
		keywords = "italic", -- Style that is applied to keywords: see `highlight-args` for options
		functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
		variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
		diagnostics = "underline", -- Style that is applied to diagnostics: see `highlight-args` for options
	},
	disable = {
		background = false, -- Disable setting the background color
		cursorline = false, -- Disable the cursorline
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	custom_highlights = {
		NvimTreeNormal = { fg = colors.fg, bg = colors.active },
	}, -- Overwrite default highlight groups
})

vim.cmd([[colorscheme onenord]])
