vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors    = true
vim.o.laststatus         = 4
vim.o.scrolloff          = 0
vim.o.mousemoveevent     = true
vim.o.cursorline         = true
vim.o.wrap               = true
vim.o.spell              = false
vim.o.pumblend           = 0
vim.o.winblend           = 0
vim.o.relativenumber     = true
vim.o.number             = true
vim.opt.clipboard        = 'unnamed,unnamedplus'
vim.opt.confirm = true

vim.api.nvim_command('set nowrap')
vim.o.whichwrap          = "<>[]hlb,s"
vim.g.mapleader          = " "
vim.opt.completeopt      = 'menu,menuone'

vim.opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}
vim.opt.colorcolumn = '110'
vim.g.markdown_recommended_style = 0
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.wrap = false -- Disable line wrap
vim.opt.wildmode = "longest:full,full"
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true -- Put new windows right of current
vim.opt.scrolloff = 4
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.laststatus = 3 -- global statusline
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
