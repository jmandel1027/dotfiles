return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
    config = function()
      require("lspconfig").tilt_ls.setup({})
    end,
  },
}
