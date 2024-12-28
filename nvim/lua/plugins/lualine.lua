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
              local mode = vim.api.nvim_get_mode().mode
              if mode == "n" then
                -- return " ⌽ "
                -- return " ⍒ "
                return " ℕ "
              elseif mode == "i" then
                -- return " ⍍ "
                return " ⅈ "
              elseif mode == "v" or mode == "V" or mode == "" then
                -- return " ⍔ "
                return " ℽ "
              else
                -- return " ⌾ "
                -- return " ⍋ "
                -- return " ⅀ "
                return " ℂ "
              end
              -- return " 󰀘 "
            end,
          },
          lualine_b = {
            {
              "branch",
              icon = "⨚ ",
            },
          },
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
