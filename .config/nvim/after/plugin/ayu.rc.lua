local status, ayu = pcall(require, 'ayu')
if (not status) then return end

local status2, utils = pcall(require, 'utils')
if (not status2) then return end

local highlight = utils.highlight

ayu.setup({
  mirage = true,
})

ayu.colorscheme()

local colors = {
  red = '#e95678',
  yellow = '#f7bb3b',
  cyan = '#5CCFE6',
  purple = '#CBA6F7',
}

-- Original: #262335
-- New: #1F2430
highlight('Normal', { 'guibg' }, { 'none' })
highlight('SignColumn', { 'guibg' }, { 'none' })
highlight('CursorLine', { 'guibg', 'gui' }, { 'none', 'bold' })
highlight('CursorLineNr', { 'guibg', 'gui' }, { 'none', 'bold' })
highlight('LineNr', { 'guifg' }, { colors.cyan })

-- LSPSaga
highlight('CodeActionNumber', { 'guibg', 'guifg' }, { 'none', colors.yellow })
highlight('OutlineIndent', { 'guibg', 'guifg' }, { 'none', colors.red })
highlight('SagaBorder', { 'guibg', 'guifg' }, { 'none', colors.cyan })
highlight('FinderIcon', { 'guibg', 'guifg' }, { 'none', colors.cyan })
highlight('FinderType', { 'guibg', 'guifg' }, { 'none', colors.purple })
highlight('FinderSelection', { 'guibg', 'guifg', 'gui' }, { 'none', colors.cyan, 'bold' })

-- Telescope
highlight('TelescopeBorder', { 'guibg', 'guifg' }, { 'none', colors.cyan })
highlight('TelescopePromptBorder', { 'guibg', 'guifg' }, { 'none', colors.cyan })
highlight('TelescopePromptTitle', { 'guibg', 'guifg' }, { 'none', colors.yellow })
highlight('TelescopePreviewTitle', { 'guibg', 'guifg' }, { 'none', colors.yellow })
highlight('TelescopeResultsTitle', { 'guibg', 'guifg' }, { 'none', colors.yellow })
highlight('TelescopeSelectionCaret', { 'guibg', 'guifg' }, { 'none', colors.yellow })
