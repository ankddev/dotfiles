require("core.common")
require("core.keymap")
-- Neovide specific configuration
if vim.g.neovide then
  require("core.neovide")
end
require("core.plugins")
