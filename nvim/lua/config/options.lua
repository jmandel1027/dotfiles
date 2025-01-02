-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.cmd([[
  filetype plugin indent on
  set termguicolors
  set encoding=utf-8
  set noswapfile
  syntax enable
]])

-- set <leader> to <space>
vim.g.mapleader = " "
vim.g.autoformat = true

-- General editor settings
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.hlsearch = true -- Highlight all search results
vim.o.number = true -- Show line numbers
vim.o.ruler = true -- Always show the cursor position
vim.o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.o.softtabstop = 2
vim.o.smartcase = true -- Smart case sensitivity
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.conceallevel = 1 -- Show concealable characters
vim.o.wrap = true -- Enable line wrapping
vim.o.sidescrolloff = 999 -- Prevent horizontal scrolling unless necessary

-- keymaps
-- Enable 24-bit RGB colors
vim.o.termguicolors = true
