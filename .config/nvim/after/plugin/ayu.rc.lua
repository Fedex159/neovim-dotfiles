local status, ayu = pcall(require, 'ayu')
if (not status) then return end

ayu.setup({
  mirage = true,
})

ayu.colorscheme()

local colors = {
  red = '#e95678',
  yellow = '#f7bb3b',
  cyan = '#36d0e0',
  purple = '#CBA6F7',
}

-- Original: #262335
-- New: #1F2430
vim.cmd [[highlight Normal guibg=none]]
vim.cmd [[highlight SignColumn guibg=none]]
vim.cmd [[highlight CursorLine guibg=none gui=bold]]
vim.cmd [[highlight CursorLineNr guibg=none gui=bold]]
vim.cmd [[highlight LineNr guifg=#5CCFE6]]

vim.cmd(string.format([[ hi CodeActionNumber guibg=none guifg=%s ]], colors.yellow))
vim.cmd(string.format([[ hi OutlineIndent guibg=none guifg=%s ]], colors.red))
vim.cmd(string.format([[ hi SagaBorder guibg=none guifg=%s ]], colors.cyan))

vim.cmd(string.format([[ hi FinderIcon guibg=none guifg=%s ]], colors.cyan))
vim.cmd(string.format([[ hi FinderType guibg=none guifg=%s ]], colors.purple))
vim.cmd(string.format([[ hi FinderSelection guibg=none guifg=%s gui=bold ]], colors.cyan))
