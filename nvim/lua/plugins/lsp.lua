local on_attach = function(client, bufnr)
  -- Disable autoformatting for JSON and YAML files
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  if filetype == "json" or filetype == "yaml" then
    return
  end

  -- Enable autoformatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_augroup("Format", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "Format",
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

-- Configure bashls to use shfmt for formatting
require("lspconfig").bashls.setup({
  on_attach = on_attach,
  settings = {
    bash = {
      format = {
        enable = true,
        defaultFormatter = "shfmt",
        shfmt = {
          extraArgs = { "-i", "2", "-ci", "-bn" }, -- Use 2 spaces for indentation
        },
      },
    },
  },
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = true, -- Assuming you want to enable autoformatting
      on_attach = on_attach,
      inlay_hints = { enabled = false },
    },
  },
}
