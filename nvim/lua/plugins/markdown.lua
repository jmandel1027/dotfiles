return {
  -- Inline markdown rendering with beautiful formatting
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      -- Render style
      code = {
        -- How code blocks are rendered
        style = "full", -- full, normal, language, none
        left_pad = 2,
        right_pad = 4,
        width = "block", -- block, full
        border = "thin",
      },
      heading = {
        -- Add icons and colors to headings
        enabled = true,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
      },
      bullet = {
        -- Bullet point icons
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },
    },
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },

  -- Optional: Browser-based preview with live reload
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    ft = { "markdown" },
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_theme = "dark"
    end,
  },

  -- Improve markdown editing experience
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown" },
  },
}
