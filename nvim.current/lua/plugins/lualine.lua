return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
          options = {
            theme = "ayu_dark",
            section_separators = { left = '│', right = '│' },
          },
        })
	end,
}
