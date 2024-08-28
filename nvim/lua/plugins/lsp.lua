local on_attach = function(client, bufnr)
  -- Enable autoformatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  -- Set expandtab and shiftwidth for the current buffer
  vim.api.nvim_buf_set_option(bufnr, 'expandtab', true)
  vim.api.nvim_buf_set_option(bufnr, 'shiftwidth', 2)
  vim.api.nvim_buf_set_option(bufnr, 'tabstop', 2)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = true, -- Assuming you want to enable autoformatting
      on_attach = on_attach,
    },
  },
}
