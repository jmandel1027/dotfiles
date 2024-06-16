local M = {}

function M.setup()
  -- Navigate vim panes better
  vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
  vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
  vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
  vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

  vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
  -- vim.keymap.set('n', '<c-u>', ':WhichKey<CR>')

  vim.keymap.set('n', '<J>', ':bprev<CR>')
  vim.keymap.set('n', '<K>', ':bnext<CR>')

  -- Quicksave
  vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

  -- ChatGPT
  vim.keymap.set("n", "<leader>gc", "<cmd>ChatGPT<CR>")

  vim.keymap.set('n', '<leader>gs', '<cmd>ChatGPTRun summarize<CR>')
  vim.keymap.set('v', '<leader>gs', '<cmd>ChatGPTRun summarize<CR>')

  vim.keymap.set("n", "<leader>ge", "<cmd>ChatGPTRun explain_code<CR>")
  vim.keymap.set("v", "<leader>ge", "<cmd>ChatGPTRun explain_code<CR>")

  vim.keymap.set("n", "<leader>gg", "<cmd>ChatGPTRun grammar_correction<CR>")
  vim.keymap.set("v", "<leader>gg", "<cmd>ChatGPTRun grammar_correction<CR>")

  Toggle_neotree = function()
    vim.cmd('Neotree toggle')
    vim.cmd('wincmd p')
  end

  --Neotree
  vim.keymap.set('n', '<leader>t', Toggle_neotree, { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>r', '<cmd>Neotree current reveal_force_cwd<CR>')


  function open_link()
    local url = vim.fn.expand("<cWORD>")
    if url ~= "" then
      vim.fn.jobstart({ "open", url })
    end
  end

  -- Map the gx key combination to the open_link function
  vim.api.nvim_set_keymap('n', 'gx', ':lua open_link()<CR>', { noremap = true })

  -- Persistence
  -- restore the session for the current directory
  vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})

  -- restore the last session
  vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

  -- stop Persistence => session won't be saved on exit
  vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})


  -- View PR
  vim.keymap.set('n', '<leader>gp', '<cmd>!gh pr view --web || gh pr create --web<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gr', '<cmd>!~/.config/nvim/scripts/status_check.sh<CR>', { noremap = true, silent = true })

  -- Fugitive
  vim.keymap.set('n', '<leader>G', '<cmd>Git<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>', { noremap = true, silent = true })

  vim.keymap.set('n', '<leader>gh', '<cmd>GBrowse<CR>', { noremap = true, silent = true })
  vim.keymap.set('v', '<leader>gh', ":<C-u>'<,'>GBrowse<CR>", {noremap = true, silent = true})
  vim.keymap.set('n', '<leader>gl', '<cmd>Git log<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>dv', '<cmd>:Gvdiffsplit<CR>', { noremap = true, silent = true })

  -- Open config files
  vim.keymap.set('n', '<leader>c', function()
    vim.cmd('cd ~/.config/nvim/')
    vim.cmd('tabnew ~/.config/nvim/lua/config/keymaps.lua')
    Toggle_neotree()
  end, { noremap = true, silent = true })

  -- Removes trailing spaces on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[%s/\s\+$//e]],
  })
end

return M
