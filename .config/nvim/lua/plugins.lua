local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- General Plugins
  use {
    'tpope/vim-repeat',
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'wellle/targets.vim',
  }

  -- Not in VSCode
  use {
    {'wbthomason/packer.nvim', opt = true},
    'christoomey/vim-tmux-navigator',
    'editorconfig/editorconfig-vim' ,
    'honza/vim-snippets' ,
    {'neoclide/coc.nvim', branch = 'release'} ,
    'tpope/vim-commentary' ,
    'tpope/vim-obsession' ,
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'christianchiarulli/nvcode-color-schemes.vim',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',
    'glepnir/galaxyline.nvim',
    'lewis6991/gitsigns.nvim',
    'junegunn/goyo.vim',
    'mattn/emmet-vim',
    'vim-test/vim-test',
    'fannheyward/telescope-coc.nvim',
    { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' },
    'steelsojka/pears.nvim',
    'ggandor/lightspeed.nvim',
    {
      'TimUntersberger/neogit',
      requires = { 
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim'
      }
    }
  }

  -- -- Lua LSP stuff
  -- use {
  --   'neovim/nvim-lspconfig',
  --   'nvim-lua/completion-nvim',
  --   'hrsh7th/vim-vsnip',
  --   'hrsh7th/vim-vsnip-integ',
  --   'steelsojka/completion-buffers',
  --   'albertoCaroM/completion-tmux',
  --   'RishabhRD/popfix',
  --   'RishabhRD/nvim-lsputils',
  -- }

end)
