return {
  {
    'Shatur/neovim-ayu',
    config = function()
      require('ayu').setup({
        dark = true,
      })

      vim.cmd([[colorscheme ayu]])
    end
  }
}
