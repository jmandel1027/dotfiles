return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          -- theme = "onedark",
          section_separators = { left = " ", right = " " },
          icons_enabled = true,
        },
        sections = {
          lualine_a = {
            function()
              return " 󰀘 "
            end,
          },
          lualine_b = { "branch" },
          lualine_c = {
            function()
              return vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
            end,
          },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
    event = function()
      return "UIEnter"
    end,
  },
}
