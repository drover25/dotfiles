vim.o.cursorline = true

if vim.fn.has 'termguicolors' then
    vim.o.termguicolors = true
    vim.cmd [[hi LineNr ctermbg=NONE guibg=NONE]]
end

-- use » to mark Tabs and ° to mark trailing whitespace
vim.cmd [[set list listchars=tab:»\ ,trail:°]]

vim.o.signcolumn = 'yes' -- Always draw the signcolumn.
vim.o.relativenumber = true -- Relative numbers

vim.cmd [[colorscheme aurora]]
