-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, 'lazy')
if (not status) then
  print('Lazy is not installed')
end

local plugins = {
  -- Theme
  { 'nvim-tree/nvim-web-devicons',
    commit = 'd7f598ed63a66d6dce1117c61b0d5ba71b7c45e8'
  },
  { 'Shatur/neovim-ayu' },

  -- Lsp and completion
  { 'glepnir/lspsaga.nvim' }, -- LSP UIs
  { 'onsails/lspkind-nvim' }, -- vscode like pcitograms
  { 'hrsh7th/cmp-buffer' }, -- nvim-cmp source for buffer words
  { 'hrsh7th/cmp-nvim-lsp' }, -- nvim-cmp source for neovim's built-in LSP
  { 'hrsh7th/nvim-cmp' }, -- Completion
  { 'neovim/nvim-lspconfig' }, -- LSP
  { 'williamboman/mason.nvim' }, -- Mason
  { 'williamboman/mason-lspconfig.nvim' }, -- Mason LSP
  { 'jose-elias-alvarez/null-ls.nvim' }, -- Use Neovim as a language server to inject LSP diagnostics, code actions and more via Lua

  -- Statusline and tabs
  { 'hoob3rt/lualine.nvim' },
  { 'akinsho/nvim-bufferline.lua' },

  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- Comments
  { 'numToStr/Comment.nvim' }, -- Easily comment stuff
  { 'JoosepAlviste/nvim-ts-context-commentstring' },

  -- Autopairs
  { 'windwp/nvim-autopairs' },
  { 'windwp/nvim-ts-autotag' },

  -- Utilities
  { 'nvim-lua/plenary.nvim' },

  -- Telescope
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },

  -- Colors
  { 'norcalli/nvim-colorizer.lua' },

  -- Git
  { 'sindrets/diffview.nvim' },
  { 'lewis6991/gitsigns.nvim' },

  -- Github copilot
  { 'zbirenbaum/copilot.lua' },

  -- Auto session
  { 'rmagatti/auto-session' },

  -- Markdown viewer
  { "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  }

};

lazy.setup(plugins)
