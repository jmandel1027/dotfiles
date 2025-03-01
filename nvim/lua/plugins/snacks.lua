return {
  {
    "folke/snacks.nvim",
    opts = {
      animate = { enabled = false },
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        pane_gap = 10,
        sections = {
          {
            section = "terminal",
            cmd = "chafa ~/.config/media/block-400.png --format symbols --symbols vhalf --size 48x20",
            height = 20,
            width = 40,
            pane = 2,
          },
          {
            pane = 2,
            icon = " ",
            title = "Git Status\n",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { title = "Recent Files\n", section = "recent_files", indent = 2, padding = 2 },
          { title = "Projects\n", section = "projects", indent = 2, padding = 2 },
          { title = "Actions\n", section = "keys", indent = 2, padding = 2 },
          { section = "startup" },
        },
      },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      terminal = { enabled = false },
      scroll = { enabled = false },
      indent = { enabled = true },
      profiler = { enabled = true },
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          local Snacks = require("snacks")
          -- Toggle the profiler
          Snacks.toggle.profiler():map("<leader>pp")
          -- Toggle the profiler highlights
          Snacks.toggle.profiler_highlights():map("<leader>ph")
        end,
      })
    end,
    keys = {
      {
        "<leader>ps",
        function()
          Snacks.profiler.scratch()
        end,
        desc = "Profiler Scratch Buffer",
      },
    },
  },
}
