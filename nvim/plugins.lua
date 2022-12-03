vim.cmd [[packadd packer.nvim]]
-- # run packer and use plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter' }
  -- # themes
  use { "catppuccin/nvim", as = "catppuccin" }
  -- # fzf
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- # lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- # lspconfig
  use "neovim/nvim-lspconfig"
  -- # lsp servers
  -- require("lspconfig").tsserver.setup {
  --  on_attach = lspconfig_on_attach,
  -- }
end)
