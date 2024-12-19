return {
  -- Configure tokyonight theme
  {
    "folke/tokyonight.nvim",
    -- enabled = false,
    config = function()
      require("tokyonight").setup({
        style = "night", -- Set the style to "night" for a darker theme
        on_colors = function(colors)
          -- Customize colors here
        end,
        on_highlights = function(highlights, colors)
          -- Customize highlights here
          highlights.Comment = { fg = colors.hint, italic = true }
          highlights.Error = { fg = colors.error, bold = true }
        end,
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
