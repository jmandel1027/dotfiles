return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>sB",
      ":Telescope file_browser path=%:p:h=%:p:h<cr>",
      desc = "Browse Files",
    },
  },
  config = function()
    require("telescope")
      .setup({
        defaults = {
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          winblend = 20, -- Adjust this value for transparency
        },
      })
      .load_extension("file_browser")

    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1a1b26" })
  end,
}
