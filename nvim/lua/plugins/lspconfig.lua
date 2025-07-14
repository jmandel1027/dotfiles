return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.gopls.setup({
        cmd = { "gopls" },
        filetypes = { "go", "gomod" },
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      lspconfig.terraformls.setup({
        cmd = { "terraform-ls", "serve" },
        filetypes = { "terraform", "hcl", "tf", "tfvars" },
        root_dir = lspconfig.util.root_pattern(".terraform", ".git"),
      })

      lspconfig.bashls.setup({
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh" },
        root_dir = require("lspconfig").util.find_git_ancestor,
      })
    end,
  },
}
