return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim",  opts = {} },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "towolf/vim-helm",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "dockerls",
          "docker_compose_language_service",
          "lua_ls",
          "gopls",
          "pylsp",
          "terraformls",
          -- "yamlls",
        }
      })

      local on_attach = function(_, _)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
        vim.keymap.set('n', 'gf', vim.lsp.buf.format, {})
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, {})
      end

      local lspconf = require("lspconfig")


      lspconf.bashls.setup({
        on_attach = on_attach
      })

      -- lspconf.yamlls.setup({
      --   on_attach = on_attach
      -- })

      lspconf.lua_ls.setup {
        on_attach = on_attach
      }

      lspconf.gopls.setup {
        on_attach = on_attach
      }

      lspconf.pylsp.setup {
        on_attach = on_attach
      }

      lspconf.terraformls.setup {
        on_attach = on_attach
      }

      lspconf.ruby_lsp.setup {
        on_attach = on_attach
      }

      lspconf.helm_ls.setup {
        settings = {
          ['helm-ls'] = {
            yamlls = {
              path = "yaml-language-server",
            }
          }
        }
      }
    end
  }
}
