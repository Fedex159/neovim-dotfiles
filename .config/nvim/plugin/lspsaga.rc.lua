local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = "NONE",
    }
  },
  beacon = {
    enable = false,
  }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<cr>', opts)
vim.keymap.set('n', 'gt', '<Cmd>Lspsaga term_toggle<cr>', opts)
vim.keymap.set('t', '<C-t>', [[<C-\><C-n><cmd>Lspsaga term_toggle<CR>]], opts)
vim.keymap.set('n', '<Leader>o', '<Cmd>Lspsaga outline<cr>', opts)
vim.keymap.set('n', '<Leader>g', '<Cmd>Lspsaga goto_definition<cr>', opts)

vim.keymap.set('t', '<C-s>', [[<C-\><C-n>]], opts)
