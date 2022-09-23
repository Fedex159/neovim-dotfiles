local status, neogit = pcall(require, 'neogit')
if (not status) then return end

neogit.setup {
  integrations = {
    diffview = true
  }
}

vim.keymap.set('n', '<leader>nc', ':Neogit commit<Return>')
vim.keymap.set('n', '<leader>n', ':Neogit<Return>')
vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<Return>')
vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory<Return>')
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<Return>')
