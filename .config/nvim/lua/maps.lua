local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decremen
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', '<A-left>', '<C-w>h')
keymap.set('', '<A-up>', '<C-w>k')
keymap.set('', '<A-down>', '<C-w>j')
keymap.set('', '<A-right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resise window
keymap.set('n', '<A-S-left>', '<C-w><')
keymap.set('n', '<A-S-right>', '<C-w>>')
keymap.set('n', '<A-S-up>', '<C-w>+')
keymap.set('n', '<A-S-down>', '<C-w>-')

-- Move lines
keymap.set('v', '<S-down>', ":m '>+1<CR>gv=gv", { noremap = true })
keymap.set('v', '<S-up>', ":m '<-2<CR>gv=gv", { noremap = true })

-- Paste when replace
keymap.set('v', '<leader>p', '\"_dP')
