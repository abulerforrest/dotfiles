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
  use { "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
  }
  -- # lsp servers
  -- require("lspconfig").tsserver.setup {
  --  on_attach = lspconfig_on_attach,
  -- }
  -- # git
  use "f-person/git-blame.nvim"
  use "lewis6991/gitsigns.nvim" 
end)
