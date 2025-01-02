return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignore = false,
        },
      },
      default_component_configs = {
        modified = {
          symbol = "~",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "✚",
            modified = "~",
            deleted = "✖",
            renamed = "",
            -- Status type
            untracked = "?",
            ignored = "",
            unstaged = "⍉",
            staged = "☑",
            conflict = "",
          },
        },
      },
      enable_git_status = true,
      sources = { "filesystem", "git_status" },
    },
  },
}
