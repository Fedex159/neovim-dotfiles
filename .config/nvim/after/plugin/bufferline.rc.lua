local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local colors = {
  bg = '#1C1F24',
  fg = '#657b83',
  fill = '#0D0E10',
  blue = '#61afef'
}

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = 'nvim_lsp',
    indicator = {
      style = 'icon'
    },
  },
  highlights = {
    separator = {
      fg = colors.fill,
      bg = colors.bg,
    },
    separator_selected = {
      fg = colors.fill,
    },
    background = {
      fg = colors.fg,
      bg = colors.bg,
    },
    buffer_selected = {
      fg = colors.blue,
      bold = true,
    },
    fill = {
      bg = colors.fill
    },
    error = {
      bg = colors.bg,
    },
    warning = {
      bg = colors.bg,
    },
    hint = {
      bg = colors.bg,
    },
    diagnostic = {
      bg = colors.bg,
    },
    info = {
      bg = colors.bg,
    },
  },
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
