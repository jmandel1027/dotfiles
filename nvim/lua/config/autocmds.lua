-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local numbertogglegroup = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- toggle relative numbers
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
  pattern = "*",
  callback = function()
    vim.wo.relativenumber = true
  end,
  group = numbertogglegroup,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
  pattern = "*",
  callback = function()
    vim.wo.relativenumber = false
  end,
  group = numbertogglegroup,
})

-- disable NeoTree italics
vim.api.nvim_create_autocmd({ "Colorscheme", "BufReadPre", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    vim.cmd([[
      hi NeoTreeGitConflict gui=bold
      hi NeoTreeGitUntracked gui=none
      hi NeoTreeMessage gui=none
      hi NeoTreeRootName gui=bold
    ]])
  end,
})

-- Fix terraform commentstring
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "terraform",
  callback = function()
    vim.cmd([[
      setlocal commentstring=#\ %s
    ]])
  end,
})
