--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true

lvim.colorscheme = "onenord"

vim.opt.signcolumn = "yes" -- Always draw the signcolumn.
vim.opt.number = true -- Absolute number on current line.
vim.opt.relativenumber = true -- Relative numbers
vim.opt.clipboard = ""

-- use » to mark Tabs and ° to mark trailing whitespace
vim.cmd([[set list listchars=tab:»\ ,trail:°]])

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<leader>wq"] = ":wq<cr>"
lvim.keys.normal_mode["[d"] = '<cmd>lua vim.diagnostic.goto_prev({float = {border = "single"}})<CR>'
lvim.keys.normal_mode["]d"] = '<cmd>lua vim.diagnostic.goto_next({float = {border = "single"}})<CR>'
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["g"].S = { "<cmd>Neogit<cr>", "Neogit" }

lvim.builtin.which_key.mappings["t"] = {
	name = "Diagnostics",
	t = { "<cmd>TroubleToggle<cr>", "trouble" },
	w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
	d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
	q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
	l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
	r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.project.manual_mode = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.lualine.options.globalstatus = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function()
-- 	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 		virtual_text = false,
-- 		update_in_insert = false,
-- 		signs = true,
-- 		underline = true,
-- 	})
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
	{
		command = "prettierd",
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "yaml", "json" },
	},
})

-- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
	{ command = "hadolint", filetypes = { "dockerfile" } },
})

local dap = require("dap")
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}
dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}
dap.configurations.typescript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

-- Additional Plugins
lvim.plugins = {
	{ "christoomey/vim-tmux-navigator" },
	{ "RyanMillerC/better-vim-tmux-resizer" },
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	{
		"rmehri01/onenord.nvim",
		config = function()
			local onenord = require("onenord")
			onenord.setup({
				theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
				borders = true, -- Split window borders
				fade_nc = false, -- Fade non-current windows, making them more distinguishable
				-- Style that is applied to various groups: see `highlight-args` for options
				styles = {
					comments = "italic",
					strings = "NONE",
					keywords = "NONE",
					functions = "NONE",
					variables = "NONE",
					diagnostics = "underline",
				},
				disable = {
					background = false, -- Disable setting the background color
					cursorline = false, -- Disable the cursorline
					eob_lines = true, -- Hide the end-of-buffer lines
				},
				-- Inverse highlight for different groups
				inverse = {
					match_paren = false,
				},
				custom_highlights = {}, -- Overwrite default highlight groups
				custom_colors = {}, -- Overwrite default colors
			})
		end,
	},
	-- {
	-- 	"olimorris/onedarkpro.nvim",
	-- 	config = function()
	-- 		local onedarkpro = require("onedarkpro")
	-- 		onedarkpro.setup({
	-- 			dark_theme = "onedark", -- The default dark theme
	-- 			light_theme = "onelight", -- The default light theme
	-- 			-- Theme can be overwritten with 'onedark' or 'onelight' as a string
	-- 			theme = function()
	-- 				if vim.o.background == "dark" then
	-- 					return "onedark"
	-- 				else
	-- 					return "onelight"
	-- 				end
	-- 			end,
	-- 			colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
	-- 			highlights = {}, -- Override default highlight groups
	-- 			ft_highlights = {}, -- Override default highlight groups for specific filetypes
	-- 			plugins = { -- Override which plugins highlight groups are loaded
	-- 				native_lsp = true,
	-- 				polygot = true,
	-- 				treesitter = true,
	-- 				-- NOTE: Other plugins have been omitted for brevity
	-- 			},
	-- 			styles = {
	-- 				strings = "NONE", -- Style that is applied to strings
	-- 				comments = "italic", -- Style that is applied to comments
	-- 				keywords = "NONE", -- Style that is applied to keywords
	-- 				functions = "NONE", -- Style that is applied to functions
	-- 				variables = "NONE", -- Style that is applied to variables
	-- 				virtual_text = "NONE", -- Style that is applied to virtual text
	-- 			},
	-- 			options = {
	-- 				bold = true, -- Use the themes opinionated bold styles?
	-- 				italic = true, -- Use the themes opinionated italic styles?
	-- 				underline = true, -- Use the themes opinionated underline styles?
	-- 				undercurl = true, -- Use the themes opinionated undercurl styles?
	-- 				cursorline = true, -- Use cursorline highlighting?
	-- 				transparency = false, -- Use a transparent background?
	-- 				terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
	-- 				window_unfocused_color = true, -- When the window is out of focus, change the normal background?
	-- 			},
	-- 		})
	-- 		onedarkpro.load()
	-- 	end,
	-- },
	{ "tpope/vim-surround", keys = { "c", "d", "y" } },
	{ "editorconfig/editorconfig-vim" },
	{ "tpope/vim-repeat" },
	{ "wellle/targets.vim" },
	{ "stevearc/dressing.nvim" },
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{ "p00f/nvim-ts-rainbow" },
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"TimUntersberger/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		init = function()
			local neogit = require("neogit")

			neogit.setup({
				disable_signs = true,
				disable_hint = false,
				disable_context_highlighting = false,
				disable_commit_confirmation = false,
				-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
				-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
				auto_refresh = true,
				disable_builtin_notifications = false,
				use_magit_keybindings = false,
				-- Change the default way of opening neogit
				kind = "tab",
				-- Change the default way of opening the commit popup
				commit_popup = {
					kind = "split",
				},
				-- Change the default way of opening popups
				popup = {
					kind = "split",
				},
				-- customize displayed signs
				signs = {
					-- { CLOSED, OPENED }
					section = { ">", "v" },
					item = { ">", "v" },
					hunk = { "", "" },
				},
				integrations = {
					-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
					-- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
					--
					-- Requires you to have `sindrets/diffview.nvim` installed.
					-- use {
					--   'TimUntersberger/neogit',
					--   dependencies = {
					--     'nvim-lua/plenary.nvim',
					--     'sindrets/diffview.nvim'
					--   }
					-- }
					--
					diffview = true,
				},
				-- Setting any section to `false` will make the section not render at all
				sections = {
					untracked = {
						folded = false,
					},
					unstaged = {
						folded = false,
					},
					staged = {
						folded = false,
					},
					stashes = {
						folded = true,
					},
					unpulled = {
						folded = true,
					},
					unmerged = {
						folded = false,
					},
					recent = {
						folded = true,
					},
				},
				-- override/add mappings
				mappings = {
					-- modify status buffer mappings
					status = {
						-- Adds a mapping with "B" as key that does the "BranchPopup" command
						["B"] = "BranchPopup",
					},
				},
			})
		end,
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
