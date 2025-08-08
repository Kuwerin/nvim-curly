# 💥 Nvim-cURLy (Neovim curly)

Simple plugin to intercommunicate with interactive shell(`curl` more recently) from inside Neovim.

![gif](assets/1.gif)

## ✨ Features

- Stored requests & responses history.
- Easy requests modifying for API tests from inside the Neovim.
- Flexible window settings (`vertical`, `horizontal`,`float`).
- Light-weight access to an HTTP endpoints.

## ⚡️ Requirements

- Neovim >= v0.9.0
- Lua >= v2.1

## 📦 Installation

Install the plugin with your preferred package manager:

```lua
-- Packer.

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer itself
  use "wbthomason/packer.nvim"
  ...

  -- Nvim-cURLy
  use "kuwerin/nvim-curly"
end)

```

## Usage
