return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local function progress_percentage()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local percentage = current_line / total_lines

        if percentage <= 1 / 8 then
          return "▁▁"
        elseif percentage <= 1 / 4 then
          return "▂▂"
        elseif percentage <= 3 / 8 then
          return "▃▃"
        elseif percentage <= 1 / 2 then
          return "▄▄"
        elseif percentage <= 5 / 8 then
          return "▅▅"
        elseif percentage <= 3 / 4 then
          return "▆▆"
        elseif percentage <= 7 / 8 then
          return "▇▇"
        else
          return "██"
        end
      end

      require("lualine").setup({
        options = {
          theme = "tokyonight",
          section_separators = { left = "", right = "" },
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
          lualine_y = { progress_percentage },
          -- lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
    event = function()
      return "UIEnter"
    end,
  },
}
