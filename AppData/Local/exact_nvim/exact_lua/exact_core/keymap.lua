-- Set leader key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Exit from builtin terminal in more friendly way
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- I often misspell these commands
-- TODO: make it in better way
vim.cmd("cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?(' w'):('W'))")
vim.cmd("cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?(' w'):('W'))")
vim.cmd("cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?(' wq'):('Wq'))")
vim.cmd("cnoreabbrev <expr> Wqa ((getcmdtype() is# ':' && getcmdline() is# 'Wqa')?(' wqa'):('Wqa'))")
vim.cmd("cnoreabbrev <expr> WQa ((getcmdtype() is# ':' && getcmdline() is# 'WQa')?(' wqa'):('WQa'))")
vim.cmd("cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?(' wq'):('WQ'))")
vim.cmd("cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?(' q'):('Q'))")
vim.cmd("cnoreabbrev <expr> Qa ((getcmdtype() is# ':' && getcmdline() is# 'Qa')?(' qa'):('Qa'))")
vim.cmd("cnoreabbrev <expr> Qa! ((getcmdtype() is# ':' && getcmdline() is# 'Qa!')?(' qa!'):('Qa!'))")
vim.cmd("cnoreabbrev <expr> QA ((getcmdtype() is# ':' && getcmdline() is# 'QA')?(' qa'):('QA'))")
vim.cmd("cnoreabbrev <expr> Q! ((getcmdtype() is# ':' && getcmdline() is# 'Q!')?(' q!'):('Q!'))")
