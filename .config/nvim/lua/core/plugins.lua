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
	use({ "folke/lua-dev.nvim", setup = [[require('plugin.lua-dev')]] })
	use("wbthomason/packer.nvim")
	use({ "windwp/nvim-autopairs", setup = [[require('plugin.nvim-autopairs')]] })
	use({
		"ChristianChiarulli/nvcode-color-schemes.vim",
		setup = [[require('plugin.nvcode-color-schemes')]],
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
					{
						"onsails/lspkind-nvim",
						setup = [[require('plugin.lspkind-nvim')]],
					},
				},
			},
		},
	})
	use("nvim-lua/lsp-status.nvim")
	use({ "ggandor/lightspeed.nvim", setup = [[require('plugin.lightspeed')]] })
	use("tpope/vim-repeat")
	use("tpope/vim-obsession")
	-- use {'glepnir/galaxyline.nvim', setup = [[require('plugin.galaxyline')]]}
	-- use {'hoob3rt/lualine.nvim', setup = [[require('plugin.lualine')]]}
	use({ "famiu/feline.nvim", setup = [[require('plugin.feline')]] })
	use("tpope/vim-surround")
	use("wellle/targets.vim")
	use({
		"nvim-telescope/telescope.nvim",
		setup = [[require('plugin.telescope')]],
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
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

	-- Autoinstall/compile plugins
	if vim.fn.isdirectory(vim.fn.glob(plugin_path)) > 0 then
		packer.install()
	end
	if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then
		packer.compile()
	end
end)
