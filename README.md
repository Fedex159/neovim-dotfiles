# Neovim Dotfiles

## Description

This are my personal config for Neovim, is based on <a href='https://www.youtube.com/watch?v=ajmK0ZNcM4Q&t'>devaslife</a> config.

## Dependencies

- Neovim >= 0.7
- NPM
- Brew (mac os)
- Nerd fonts (MesloLGS NF used)

## Installation

### Mac

```
$ brew install nvim
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
$ npm i -g typescript-language-server
$ npm i -g eslint_d
$ brew install tree-sitter
$ brew install ripgrep
$ npm install -g @fsouza/prettierd
$ brew install lazygit
```

- Copy all files from folder .config/nvim to your /${USER}/.config/nvim
- Next open Neovim (is going to show some errors, not problem)
- Call **:PackerInstall** (if tressitter fail is ok)
- Close Neovim and open again.
