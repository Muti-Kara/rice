local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

map('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', 'd]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
map('n', '<leader>fm', '<cmd>lua if vim.lsp.buf.format then vim.lsp.buf.format() else vim.lsp.buf.formatting() end<CR>', opts)
