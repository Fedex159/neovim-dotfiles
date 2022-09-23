local status, neogit = pcall(require, 'neogit')
if (not status) then return end

neogit.setup {
  integrations = {
    diffview = true
  }
}

local opts = { silent = true }
vim.keymap.set('n', '<leader>nc', ':Neogit commit<Return>', opts)
vim.keymap.set('n', '<leader>n', ':Neogit<Return>', opts)
vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<Return>', opts)
vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory<Return>', opts)
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<Return>', opts)
