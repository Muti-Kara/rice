require('core')
require('plugins')
require('lsp')

vim.api.nvim_exec_autocmds("FileType", {}) -- Fix for lsp server to start
