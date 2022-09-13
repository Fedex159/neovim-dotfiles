local status, onedarkpro = pcall(require, 'onedarkpro')
if (not status) then return end

onedarkpro.setup {
  theme = 'onedark',
  styles = {
    comments = "italic",
  }
}

vim.cmd('colorscheme onedarkpro')