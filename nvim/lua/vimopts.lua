vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.cmd("set mouse=a")

vim.cmd("set clipboard+=unnamed") -- Use the clipboards of vim and win
vim.cmd("set paste")              -- Paste from a windows or from vim
vim.cmd("set go+=a")              -- Visual selection automatically copied to the clipboard

--vim.cmd("set macligatures")
--vim.cmd("set guifont=Fira\ Code:h12")

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
