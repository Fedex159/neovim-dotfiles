local status, git = pcall(require, 'git-conflict')
if (not status) then return end

vim.api.nvim_set_hl(0, 'DiffText', { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = "#ffffff", bg = "#1d3450" })

git.setup({
  highlights = {
    incoming = 'DiffText',
    current = 'DiffAdd',
  }
})
