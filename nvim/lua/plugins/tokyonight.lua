return {
  -- Configure tokyonight theme
  {
    "folke/tokyonight.nvim",
    -- enabled = false,
    config = function()
      require("tokyonight").setup({
        style = "night", -- Set the style to "night" for a darker theme
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
