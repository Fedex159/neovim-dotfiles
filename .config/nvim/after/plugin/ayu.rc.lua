local status, ayu = pcall(require, 'ayu')
if (not status) then return end

ayu.setup({
  mirage = true,
})

ayu.colorscheme()

-- Original: #262335
-- New: #1F2430
vim.cmd [[highlight Normal guibg=none]]
vim.cmd [[highlight SignColumn guibg=none]]
vim.cmd [[highlight CursorLine guibg=none gui=bold]]
vim.cmd [[highlight CursorLineNr guibg=none gui=bold]]
vim.cmd [[highlight LineNr guifg=#5CCFE6]]
