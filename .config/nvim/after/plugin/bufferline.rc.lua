local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local status2, colors = pcall(require, 'onedarkpro')
if (not status2) then return end
local c = colors.get_colors(vim.g.onedarkpro_theme)

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true,
    diagnostics = 'nvim_lsp',
    indicator = {
      style = 'icon'
    },
    numbers = 'ordinal'
  },
  highlights = {
    separator = {
      fg = c.bg,
      bg = c.bg,
    },
    separator_selected = {
      fg = c.green,
    },
  },
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
