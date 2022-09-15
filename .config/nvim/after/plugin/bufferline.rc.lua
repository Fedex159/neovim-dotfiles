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
      fg = '#0D0E10',
      bg = '#1C1F24',
    },
    separator_selected = {
      fg = '#0D0E10',
    },
    background = {
      fg = '#657b83',
      bg = '#1C1F24',
    },
    buffer_selected = {
      fg = c.blue,
      bold = true,
    },
    fill = {
      bg = '#0D0E10'
    }
  },
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
