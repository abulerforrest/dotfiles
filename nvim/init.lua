-- # set the path for require to work with symlinks
package.path = '/Users/abulerforrest/dotfiles/nvim/?.lua;' .. package.path
-- # set spacebar as leader key
vim.g.mapleader = ' '
-- # require(s)
require('lsp')
require('globals')
require('mappings')
require('plugins')
require('helpers')
require('theme')
require('git')
require('lualine').setup {
  options = { theme = 'catppuccin' }
}

