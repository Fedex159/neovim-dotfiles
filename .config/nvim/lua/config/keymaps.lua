-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local utils = require("utils")

local keymap = vim.keymap
local getTermOpts = utils.getTermOpts

-- Reset original
keymap.del("n", "<leader>w-")
keymap.del("n", "<leader>w|")
keymap.del("n", "<C-Up>")
keymap.del("n", "<C-Down>")
keymap.del("n", "<C-Left>")
keymap.del("n", "<C-Right>")
keymap.del("n", "<leader>gg")
keymap.del("n", "<leader>gG")
keymap.del("n", "<leader>ft")
keymap.del("n", "<leader>fT")

-- stylua: ignore start
-- Lazygit
keymap.set("n", "<leader>gg", function() Util.float_term({ "lazygit" }, getTermOpts({ disableEsc = true, addCwd = true })) end, { desc = "Lazygit (root dir)" })
keymap.set("n", "<leader>gG", function() Util.float_term({ "lazygit" }, getTermOpts({ disableEsc = true })) end, { desc = "Lazygit (cwd)" })

-- Terminal
keymap.set("n", "<leader>ft", function() Util.float_term(nil, getTermOpts({ addCwd = true })) end, { desc = "Terminal (root dir)" })
keymap.set("n", "<leader>fT", function() Util.float_term(nil, getTermOpts()) end, { desc = "Terminal (cwd)" })
-- stylua: ignore end

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- Increment/decremen
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<Leader>a", "gg<S-v>G", { desc = "Select all" })

-- New tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })

-- Split window
keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split window below" })
keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split window right" })

-- Move window
keymap.set("n", "<Space>", "<C-w>w", { desc = "Go to next window" })
keymap.set("n", "<A-Left>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<A-Down>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<A-Up>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<A-Right>", "<C-w>l", { desc = "Go to right window" })

-- Resise window
keymap.set("n", "<A-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<A-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<A-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<A-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines
keymap.set("v", "<S-down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "<S-up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Paste without replace
keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without replace" })

-- Tabs
keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Tab" })
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Tab" })

-- Diffview
vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<Return>", { silent = true })
vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory %<Return>", { silent = true })
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<Return>", { silent = true })
