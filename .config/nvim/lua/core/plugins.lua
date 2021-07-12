local packer_path = U.os.data .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' ..
                packer_path)
end
vim.cmd 'packadd packer.nvim | au BufWritePost plugins.lua PackerCompile'
vim.opt.rtp = vim.opt.rtp + (U.os.data .. '/site/pack/packer/opt/*')

local packer = require('packer')
local plugin_path = U.os.data .. '/site/pack/packer/opt/'
local packer_compiled = U.os.data .. '/site/plugin/packer_compiled.vim'

return packer.startup(function(use)
    packer.init({compile_path = packer_compiled, opt_default = true})

    -- init.lua utils
    use 'nvim-lua/plenary.nvim'
    use {'folke/lua-dev.nvim', setup = [[require('plugin.lua-dev')]]}

    -- Plugin Manager
    use 'wbthomason/packer.nvim'
    -- Autopairs
    use {'windwp/nvim-autopairs', setup = [[require('plugin.nvim-autopairs')]]}
    -- Colorschemes
    use {
        'ChristianChiarulli/nvcode-color-schemes.vim',
        setup = [[require('plugin.nvcode-color-schemes')]]
    }
    -- Completion
    use {
        {
            'hrsh7th/nvim-compe',
            setup = [[require('plugin.nvim-compe')]],
            event = 'InsertEnter'
        }, -- Snippets
        {
            'hrsh7th/vim-vsnip',
            event = 'InsertEnter',
            requires = {use 'rafamadriz/friendly-snippets'}
        }
    }
    -- Comments
    use 'tpope/vim-commentary'
    -- EditorConfig
    use 'editorconfig/editorconfig-vim'
    -- File explorer
    use 'kyazdani42/nvim-tree.lua'
    -- Git
    use {'lewis6991/gitsigns.nvim', setup = [[require('plugin.gitsigns')]]}
    use {
        'TimUntersberger/neogit',
        requires = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'}
    }
    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use {'onsails/lspkind-nvim', setup = [[require('plugin.lspkind-nvim')]]}
    -- Indentline
    use {
        'lukas-reineke/indent-blankline.nvim',
        setup = [[require('plugin.indent-blankline')]]
    }
    -- Lsp
    use {
        'neovim/nvim-lspconfig',
        setup = [[require('plugin.nvim-lspconfig')]],
        requires = {
            'kabouzeid/nvim-lspinstall', 'glepnir/lspsaga.nvim',
            'jose-elias-alvarez/nvim-lsp-ts-utils'
        }
    }
    -- Navigation
    use {'ggandor/lightspeed.nvim', setup = [[require('plugin.lightspeed')]]}
    -- Repeat
    use 'tpope/vim-repeat'
    -- Sessions
    use 'tpope/vim-obsession'
    -- Statusline
    use {'glepnir/galaxyline.nvim', setup = [[require('plugin.galaxyline')]]}
    -- Surround
    use 'tpope/vim-surround'
    -- Targets
    use 'wellle/targets.vim'
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        setup = [[require('plugin.telescope')]],
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
    }
    -- Tmux
    use {'christoomey/vim-tmux-navigator'}
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        setup = [[require('plugin.nvim-treesitter')]],
        requires = {
            'p00f/nvim-ts-rainbow', 'windwp/nvim-ts-autotag',
            'JoosepAlviste/nvim-ts-context-commentstring'
        }
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Autoinstall/compile plugins
    if vim.fn.isdirectory(vim.fn.glob(plugin_path)) > 0 then packer.install() end
    if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then packer.compile() end
end)
