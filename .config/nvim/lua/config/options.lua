-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.backspace = "start,eol,indent"
opt.backupskip = "/tmp*,/private/tmp/*"
opt.breakindent = true
opt.laststatus = 2
opt.path:append({ "**" })
opt.scrolloff = 10
opt.shell = "zsh"
opt.wildignore:append({ "*/node_modules/* " })

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
