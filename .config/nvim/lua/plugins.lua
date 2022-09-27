local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'olimorris/onedarkpro.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Lsp and completion
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'onsails/lspkind-nvim' -- vscode like pcitograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim' -- Mason
  use 'williamboman/mason-lspconfig.nvim' -- Mason LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions and more via Lua

  -- Statusline and tabs
  use 'hoob3rt/lualine.nvim'
  use 'akinsho/nvim-bufferline.lua'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Comments
  use 'numToStr/Comment.nvim' -- Easily comment stuff
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Formatting
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in

  -- Autopairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Utilities
  use 'nvim-lua/plenary.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Colors
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use {
    'TimUntersberger/neogit',
    requires = {
      'sindrets/diffview.nvim'
    }
  }
  use { 'akinsho/git-conflict.nvim', tag = 'v1.0.0' }

  -- Auto session
  use 'rmagatti/auto-session'

end)
