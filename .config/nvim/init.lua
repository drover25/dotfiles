-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("vscode.lazy")
else
  require("config.lazy")
end
