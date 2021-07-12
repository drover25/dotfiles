local Path = require 'plenary.path'

-- Setup python path
vim.g.python3_host_prog = '/usr/local/bin/python3'

-- Disable swap files
vim.o.swapfile = false

-- Setup an undodir for persistant undo state.
-- Use persistent history.
local undoDir = Path:new{"/tmp/.vim-undo-dir/"}
if not undoDir.exists then undoDir.mkdir({mode = "0700"}) end

vim.o.undodir = undoDir.filename;
vim.o.undofile = true
