-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- save mappings
vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>", { desc = "Quick escape" })
vim.keymap.set("n", "<leader>wq", "<cmd>:wq<cr>", { desc = "Quick escape" })

-- tmux move window
vim.keymap.set("n", "<C-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "Go to right window" })

-- git
vim.keymap.set("n", "<leader>gS", "<cmd>:Neogit<cr>", { desc = "Neogit" })

-- mini.surround
-- Remap adding surrounding to Visual mode selection
vim.keymap.del("x", "ys")
vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
-- Make special mapping for "add surrounding for line"
vim.keymap.set("n", "yss", "ys_", { remap = true })
