-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false

vim.cmd("set mouse=a")

vim.cmd("set clipboard+=unnamed") -- Use the clipboards of vim and win
vim.cmd("set paste") -- Paste from a windows or from vim
vim.cmd("set go+=a") -- Visual selection automatically copied to the clipboard
vim.cmd("set noswapfile")

vim.cmd("set guicursor=i:ver25-iCursor")

vim.g.mapleader = " "
vim.g.moonflyWinSeparator = 2
