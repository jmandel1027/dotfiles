local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end


-- set <leader> to <space>
vim.g.mapleader = " "

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {})

require("config").setup()
require("config.keymaps").setup()