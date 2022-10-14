local status, gitsigns = pcall(require, 'gitsigns')
if (not status) then return end

local diffAdded = '#98be65'
local diffDelete = '#ec5f67'
local diffChanged = '#ECBE7B'
local currentLineBlame = '#5C6773'

gitsigns.setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 100,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> · <summary>'
}

vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = diffAdded })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = diffDelete })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = diffChanged })
vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = currentLineBlame })

vim.keymap.set('n', '<leader>gf', '<cmd>Gitsigns diffthis<cr>')
