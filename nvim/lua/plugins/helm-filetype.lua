-- Ensure Helm chart template files are recognized as 'helm' filetype
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Add autocmd for Helm template filetype detection
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*/charts/*/templates/*.yaml", "*/charts/*/templates/*.tpl" },
        callback = function()
          vim.bo.filetype = "helm"
        end,
      })

      return opts
    end,
  },
}
