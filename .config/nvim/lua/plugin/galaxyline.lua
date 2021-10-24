local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = { "LuaTree", "vista", "dbui" }
local nord_colors = {
	darktext = "#2E3440",
	bg = "#3B4252",
	yellow = "#EBCB8B",
	cyan = "#88C0D0",
	darkblue = "#5E81AC",
	green = "#A3BE8C",
	orange = "#D08770",
	lightblue = "#81A1C1",
	magenta = "#B48EAD",
	grey = "#D8DEE9",
	darkgrey = "#4C566A",
	blue = "#0087d7",
	red = "#BF616A",
}
local buffer_not_empty = function()
	if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
		return true
	end
	return false
end
local checkwidth = function()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 40 then
		return true
	end
	return false
end
local separator = function(color)
	return {
		provider = function()
			return ""
		end,
		condition = buffer_not_empty,
		highlight = { nord_colors.bg, color },
	}
end
local mode_color = function()
	local color = {
		n = nord_colors.lightblue,
		i = nord_colors.green,
		c = nord_colors.yellow,
		v = nord_colors.magenta,
		[""] = nord_colors.magenta,
	}
	return color[vim.fn.mode()]
end
gls.left = {
	{
		ViMode = {
			provider = function()
				local alias = {
					n = "  N ",
					i = "  I ",
					c = "  C ",
					v = "  V ",
					[""] = "  V ",
				}
				return alias[vim.fn.mode()]
			end,
			separator = "",
			separator_highlight = { mode_color, nord_colors.bg },
			highlight = { nord_colors.darktext, mode_color, "bold" },
		},
	},
	{ Sep1 = separator(nord_colors.bg) },
	{
		FileIcon = {
			provider = "FileIcon",
			condition = buffer_not_empty,
			highlight = {
				require("galaxyline.provider_fileinfo").get_file_icon_color,
				nord_colors.bg,
			},
		},
	},
	{ Sep2 = separator(nord_colors.cyan) },
	{
		FileName = {
			provider = {
				function()
					return "  "
				end,
				"FileName",
				"LineColumn",
				function()
					return " "
				end,
			},
			condition = buffer_not_empty,
			separator = "",
			separator_highlight = { nord_colors.cyan, nord_colors.bg },
			highlight = { nord_colors.darktext, nord_colors.cyan },
		},
	},
	{ Sep3 = separator(nord_colors.darkgrey) },
	{
		GitIcon = {
			provider = function()
				return "    "
			end,
			condition = buffer_not_empty,
			highlight = { nord_colors.orange, nord_colors.darkgrey },
		},
	},
	{
		GitBranch = {
			provider = "GitBranch",
			condition = buffer_not_empty,
			highlight = { nord_colors.grey, nord_colors.darkgrey },
		},
	},
	{
		DiffAdd = {
			provider = "DiffAdd",
			condition = checkwidth,
			icon = " ",
			highlight = { nord_colors.green, nord_colors.darkgrey },
		},
	},
	{
		DiffModified = {
			provider = "DiffModified",
			condition = checkwidth,
			icon = " ",
			highlight = { nord_colors.orange, nord_colors.darkgrey },
		},
	},
	{
		DiffRemove = {
			provider = "DiffRemove",
			condition = checkwidth,
			icon = " ",
			highlight = { nord_colors.red, nord_colors.darkgrey },
		},
	},
	{
		LeftEnd = {
			provider = function()
				return ""
			end,
			highlight = { nord_colors.darkgrey, nord_colors.bg },
			condition = buffer_not_empty,
		},
	},
	{
		Space = {
			provider = function()
				return " "
			end,
			highlight = { nord_colors.red, nord_colors.bg },
		},
	},
	{
		DiagnosticError = {
			provider = "DiagnosticError",
			icon = "  ",
			highlight = { nord_colors.red, nord_colors.bg },
		},
	},
	{
		DiagnosticWarn = {
			provider = "DiagnosticWarn",
			icon = "  ",
			highlight = { nord_colors.yellow, nord_colors.bg },
		},
	},
}
gls.short_line_left = {
	{
		ShortFileIcon = {
			provider = "FileIcon",
			condition = buffer_not_empty,
			highlight = { nord_colors.grey, nord_colors.darktext },
			separator = "",
			separator_highlight = { nord_colors.darktext, nord_colors.bg },
		},
	},
	{ ShortSep2 = separator(nord_colors.bg) },
	{
		ShortFileName = {
			provider = {
				function()
					return "  "
				end,
				"FileName",
			},
			condition = buffer_not_empty,
			highlight = { nord_colors.grey, nord_colors.bg },
		},
	},
}
gls.right = {
	{
		RightSep = {
			provider = function()
				return ""
			end,
			highlight = { nord_colors.bg, nord_colors.darkgrey },
		},
	},
	{
		PerCent = {
			provider = "LinePercent",
			separator = "",
			separator_highlight = { nord_colors.cyan, nord_colors.bg },
			highlight = { nord_colors.darktext, nord_colors.cyan },
		},
	},
}
