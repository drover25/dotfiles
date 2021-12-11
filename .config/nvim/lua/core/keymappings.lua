local function nmap(key, cmd, opts)
	U.keymap.map("n", key, cmd, opts)
end
local function imap(key, cmd, opts)
	U.keymap.map("i", key, cmd, opts)
end
local function xmap(key, cmd, opts)
	U.keymap.map("x", key, cmd, opts)
end
local function vmap(key, cmd, opts)
	U.keymap.map("v", key, cmd, opts)
end
local function tmap(key, cmd, opts)
	U.keymap.map("t", key, cmd, opts)
end
local function lua_nmap(key, cmd, opts)
	nmap(key, "<cmd>lua  " .. cmd .. "<CR>", opts)
end

vim.g.mapleader = ","
nmap("<leader>", "<Nop>")
xmap("<leader>", "<Nop>")

nmap("<leader>w", ":w<CR>")
nmap("<leader>wq", ":wq<CR>")
imap("jk", "<Esc>")
vmap("jk", "<Esc>")

-- Move from the neovim terminal window to somewhere else
tmap("<C-h>", "<C-\\><C-n><C-w>h")
tmap("<C-j>", "<C-\\><C-n><C-w>j")
tmap("<C-k>", "<C-\\><C-n><C-w>k")
tmap("<C-l>", "<C-\\><C-n><C-w>l")

-- Telescope
lua_nmap("<c-p>", 'require"telescope.builtin".find_files({ hidden = true })')
nmap("<c-c>", ":Telescope builtin<CR>")
nmap("<leader>g", ":Telescope live_grep<CR>")
nmap("<leader>d", ":Telescope lsp_document_diagnostics<CR>")

-- Git
nmap("gst", ":Neogit<CR>", { silent = true })

-- Nvim-Tree
nmap("<C-n>", ":NvimTreeToggle<CR>")

-- Trouble
nmap("<leader>xx", ":TroubleToggle<CR>")
nmap("<leader>xq", ":TroubleToggle quickfix<CR>")
nmap("<leader>xl", ":TroubleToggle loclist<CR>")
