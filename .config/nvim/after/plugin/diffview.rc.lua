local status, diffview = pcall(require, 'diffview')
if (not status) then return end

diffview.setup({
  enhanced_diff_hl = true,
})

local opts = { silent = true }

vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<Return>', opts)
vim.keymap.set('n', '<leader>df', ':DiffviewFileHistory %<Return>', opts)
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<Return>', opts)

local colors = {
  add = {
    fg = '#56d364',
    bg = '#244032',
  },
  delete = {
    fg = '#f85149',
    bg = '#462c32',
  },
  change = {
    fg = '#e3b341',
    bg = '#341a00',
  },
  folded = {
    fg = '#c9d1d9',
    bg = '#284566'
  }
}

vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.add.fg, bg = colors.add.bg })
vim.api.nvim_set_hl(0, "DiffAdded", { fg = colors.add.fg, bg = "none" })
vim.api.nvim_set_hl(0, "DiffText", { fg = colors.change.fg, bg = colors.change.bg })
vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.change.fg, bg = colors.change.bg })
vim.api.nvim_set_hl(0, "DiffviewStatusModified", { fg = colors.change.fg, bg = "none" })
vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { fg = colors.delete.fg, bg = colors.delete.bg })
vim.api.nvim_set_hl(0, "DiffRemoved", { fg = colors.delete.fg, bg = "none" })
vim.api.nvim_set_hl(0, "Folded", { fg = colors.folded.fg, bg = colors.folded.bg })
