return {
  {
    "al1-ce/just.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim", -- async jobs
      "nvim-telescope/telescope.nvim", -- task picker
      "j-hui/fidget.nvim", -- task progress
      "rcarriga/nvim-notify", -- general notifications (optional)
      "al1-ce/jsfunc.nvim", -- extension library
    },
    config = function()
      require("just").setup({})
      vim.api.nvim_set_keymap("n", "<leader>j", ":Just<CR>", { noremap = true, silent = true, desc = " Just" })
    end,
  },
}
