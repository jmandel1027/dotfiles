return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = true, -- Assuming you want to enable autoformatting
      inlay_hints = { enabled = false },
      -- Define the on_attach function here
      on_attach = function(client, bufnr)
        -- Disable autoformatting for JSON and YAML
        local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
        if ft == "json" or ft == "yaml" then
          return
        end

        -- Enable autoformatting if the server supports it
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
      end,
    },
    -- The config function is called after the plugin is loaded,
    -- so we can reference opts here and set up bashls.
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      lspconfig.bashls.setup({
        on_attach = opts.on_attach,
        settings = {
          bash = {
            format = {
              enable = true,
              defaultFormatter = "shfmt",
              shfmt = {
                extraArgs = { "-i", "2", "-ci", "-bn" }, -- 2-space indent, etc.
              },
            },
          },
        },
      })
    end,
  },
}
