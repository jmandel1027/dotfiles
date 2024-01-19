local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set guicursor=i:ver25-iCursor")

vim.g.mapleader = " "
vim.g.moonflyWinSeparator = 2

vim.cmd("set mouse=a")

vim.cmd("set clipboard+=unnamed") -- Use the clipboards of vim and win
vim.cmd("set paste")              -- Paste from a windows or from vim
vim.cmd("set go+=a")              -- Visual selection automatically copied to the clipboard
vim.cmd("set noswapfile")

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<c-u>', ':WhichKey<CR>')

map('n', '<J>', ':bprev<CR>', opts)
map('n', '<K>', ':bnext<CR>', opts)

vim.wo.number = true

vim.g.copilot_no_tab_maps = true
vim.g.copilot_disable_mappings = 1
