local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '  -- Set space as the leader key
vim.g.maplocalleader = ' '  -- Set space as the local leader key

map('v', '>', '>gv', opts) -- Indent right and reselect visual block
map('v', '<', '<gv', opts) -- Indent left and reselect visual block

map('n', 'vs', ':lua require("core.utils").open_vertical_split_netrw()<CR>', opts)
map('n', 'hs', ':lua require("core.utils").open_horizontal_split_netrw()<CR>', opts)
map('n', '<C-Up>', '<C-w>k', opts) -- Move focus to the upper window
map('n', '<C-Down>', '<C-w>j', opts) -- Move focus to the lower window
map('n', '<C-Left>', '<C-w>h', opts) -- Move focus to the left window
map('n', '<C-Right>', '<C-w>l', opts) -- Move focus to the right window
map('n', '<C-A-Left>', ':vertical resize -2<CR>', opts) -- Decrease window width
map('n', '<C-A-Right>', ':vertical resize +2<CR>', opts) -- Increase window width
map('n', '<C-A-Up>', ':resize +2<CR>', opts) -- Increase window height
map('n', '<C-A-Down>', ':resize -2<CR>', opts) -- Decrease window height
map('n', '<S-Right>', '<C-w>L', opts)
map('n', '<S-Down>', '<C-w>J', opts)
map('n', '<S-Left>', '<C-w>H', opts)
map('n', '<S-Up>', '<C-w>K', opts)

map('n', '<A-Up>', ':move .-2<CR>==', opts) -- Move line up in normal mode
map('n', '<A-Down>', ':move .+1<CR>==', opts) -- Move line down in normal mode
map('v', '<A-Up>', ":move '<-2<CR>gv=gv", opts) -- Move selected text up in visual mode
map('v', '<A-Down>', ":move '>+1<CR>gv=gv", opts) -- Move selected text down in visual mode
