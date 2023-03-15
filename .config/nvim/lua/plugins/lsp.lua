return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.code_actions.eslint_d,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.formatting.eslint_d,
        nls.builtins.formatting.prettierd,
      })
    end,
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "eslint_d",
      })
    end,
  },
}
