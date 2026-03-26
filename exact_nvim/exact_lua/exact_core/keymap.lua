local builtin = require('telescope.builtin')
local map = vim.keymap.set

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')

-- nvim-telescope
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- toggle-term
map('t', '<esc>', '<C-\\><C-N>', { nowait = true })
map('n', '<C-\\>', '<cmd> ToggleTerm direction=horizontal<CR>')
map('t', '<C-\\>', '<C-\\><C-n>:ToggleTerm direction=horizontal<CR>')
map('n', '<leader>\\', '<cmd> TermNew<CR>')
map('t', '<leader>\\', '<C-\\><C-n>:TermNew<CR>')
