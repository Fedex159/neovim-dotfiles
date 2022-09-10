local status, n = pcall(require, 'onedark')
if (not status) then return end

n.setup({
  style = 'dark',
  toggle_style_key = '<A-t>',
  toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}
})

n.load()
