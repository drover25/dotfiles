return {
  { "editorconfig/editorconfig-vim", lazy = false },
  { "tpope/vim-surround", lazy = false, vscode = true },
  {
    "max397574/better-escape.nvim",
    lazy = false,
    config = function()
      require("better_escape").setup()
    end,
  },
}
