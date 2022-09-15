local status, neogit = pcall(require, 'neogit')
if (not status) then return end

neogit.setup {
  integrations = {
    diffview = true
  }
}

vim.keymap.set('n', '<leader>gd', '<cmd>Neogit<cr>')
vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<cr>')
