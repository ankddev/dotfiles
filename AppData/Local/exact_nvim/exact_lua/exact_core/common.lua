-- Disable netrw since I'm using external file tree plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Show more colors for TUI
vim.opt.termguicolors = true
-- Show global statusline
vim.o.laststatus = 3
-- Highlight current line
vim.o.cursorline = true
-- Show relative line numbers
vim.o.number = true
vim.o.relativenumber = true
-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.o.clipboard = "unnamed,unnamedplus"
end)
vim.opt.confirm = true
-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
-- Highlig matches
vim.o.showmatch = true
-- Keep signcolumn on by default
vim.o.signcolumn = "yes"
-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300
-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true
-- Whitespace characters
vim.o.list = true
-- Wrap lines at convenient points
vim.opt.linebreak = true
-- Popup blend
vim.opt.pumblend = 10
-- Maximum number of entries in a popup
vim.opt.pumheight = 10
-- Preview substitutions live, as you type!
vim.o.inccommand = "split"
-- Tabs settings
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.numberwidth = 4
vim.opt.smartindent = true
