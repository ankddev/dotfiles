-- Config
require('core.config')
-- Neovide specific configuration
if vim.g.neovide then
    require('core.neovide')
end
require('core.tabs')
require('core.search')
-- Plugins
require('core.plugins')
-- Keymap
require('core.keymap')
