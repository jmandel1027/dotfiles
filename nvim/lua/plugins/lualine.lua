return {
  "nvim-lualine/lualine.nvim",
  enable = true,
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        section_separators = { left = "", right = "" },
      },
    })
  end,
}
