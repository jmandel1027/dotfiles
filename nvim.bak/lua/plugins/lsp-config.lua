return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "bashls",
        "dockerls",
        "docker_compose_language_service",
        "gopls",
        "gradle_ls",
        "graphql",
	    "jdtls",
        "pyright",
        "terraformls",
        "kotlin_language_server",
        "yamlls",
        "tsserver",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()

      require('go').setup({ lsp_cfg = false })
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local util = require "lspconfig/util"
      local lspconfig = require("lspconfig")

      local cfg = require("go.lsp").config() -- config() return the go.nvim gopls setup

      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = {"gopls"},
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })

      lspconfig.terraformls.setup({
        capabilites = capabilities,
      })

      require('lspconfig').gopls.setup(cfg)

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
