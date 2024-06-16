return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          section_separators = { left = " ", right = " " },
        },
      })
    end,
    event = function()
      return "UIEnter"
    end,
  },
}
