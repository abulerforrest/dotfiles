-- # set spacebar as leader key
vim.g.mapleader = ' ' 
-- # require(s)
require('global')
require('mappings')
require('plugins')
require('helpers')
require('lsp')
require('theme')
require('git')
require('lualine').setup {
  options = { theme = 'catppuccin' }
}

