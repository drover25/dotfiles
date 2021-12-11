local packer_path = U.os.data .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
	vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. packer_path)
end
vim.cmd("packadd packer.nvim | au BufWritePost plugins.lua PackerCompile")
vim.opt.rtp = vim.opt.rtp + (U.os.data .. "/site/pack/packer/opt/*")

local packer = require("packer")
local plugin_path = U.os.data .. "/site/pack/packer/opt/"
local packer_compiled = U.os.data .. "/site/plugin/packer_compiled.vim"

return packer.startup(function(use)
	packer.init({ compile_path = packer_compiled, opt_default = true })

	use("nvim-lua/plenary.nvim")
	use("wbthomason/packer.nvim")
	use("folke/lua-dev.nvim")

	use({ "windwp/nvim-autopairs", setup = [[require('plugin.nvim-autopairs')]] })
	use("ChristianChiarulli/nvcode-color-schemes.vim")
	use({ "rmehri01/onenord.nvim", setup = [[require('plugin.onenord')]] })
	-- use("tpope/vim-commentary")
	use({
		"numToStr/Comment.nvim",
		setup = [[require('plugin.comment')]],
	})
	use("tpope/vim-commentary")
	use("editorconfig/editorconfig-vim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		setup = [[require('plugin.nvim-tree')]],
	})
	use({ "lewis6991/gitsigns.nvim", setup = [[require('plugin.gitsigns')]] })
	use({
		"TimUntersberger/neogit",
		setup = [[require('plugin.neogit')]],
		requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
	})
	use("kyazdani42/nvim-web-devicons")
	use({
		"lukas-reineke/indent-blankline.nvim",
		setup = [[require('plugin.indent-blankline')]],
	})
	use("rafamadriz/friendly-snippets")
	use({
		"neovim/nvim-lspconfig",
		setup = [[require('plugin.nvim-lspconfig')]],
		requires = {
			"williamboman/nvim-lsp-installer",
			"jose-elias-alvarez/null-ls.nvim",
			"jose-elias-alvarez/nvim-lsp-ts-utils",
			"b0o/schemastore.nvim",
			{
				"hrsh7th/nvim-cmp",
				setup = [[require('plugin.nvim-cmp')]],
				event = "InsertEnter",
				requires = {
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-buffer",
					"saadparwaiz1/cmp_luasnip",
					"L3MON4D3/LuaSnip",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-nvim-lua",
					"David-Kunz/cmp-npm",
					{
						"onsails/lspkind-nvim",
						setup = [[require('plugin.lspkind-nvim')]],
					},
				},
			},
		},
	})
	use("nvim-lua/lsp-status.nvim")
	use({ "phaazon/hop.nvim", setup = [[require('plugin.hop')]] })
	use("tpope/vim-repeat")
	use("tpope/vim-obsession")
	use({ "nvim-lualine/lualine.nvim", setup = [[require('plugin.lualine')]], requires = { "kdheepak/tabline.nvim" } })
	use("tpope/vim-surround")
	use("wellle/targets.vim")
	use({
		"nvim-telescope/telescope.nvim",
		setup = [[require('plugin.telescope')]],
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			"nvim-telescope/telescope-live-grep-raw.nvim",
		},
	})
	use({ "folke/trouble.nvim", setup = [[require('plugin.trouble')]] })
	use({ "christoomey/vim-tmux-navigator" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		setup = [[require('plugin.nvim-treesitter')]],
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "kristijanhusak/orgmode.nvim", setup = [[require('plugin.orgmode')]] })
	use({
		"folke/zen-mode.nvim",
		setup = [[require('plugin.zen-mode')]],
	})
	use({
		"stevearc/dressing.nvim",
		setup = [[require('plugin.dressing')]],
	})

	-- Autoinstall/compile plugins
	if vim.fn.isdirectory(vim.fn.glob(plugin_path)) > 0 then
		packer.install()
	end
	if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then
		packer.compile()
	end
end)
