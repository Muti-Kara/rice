local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {'Mofiqul/dracula.nvim', config = function() require('plugins.dracula') end},
    {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }, config = function() require('plugins.telescope') end},
    {'nvim-lualine/lualine.nvim', requires = { {'nvim-tree/nvim-web-devicons'} }, config = function() require('plugins.lualine') end},
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('plugins.treesitter') end},
    {'windwp/nvim-autopairs', config = function() require('plugins.autopairs') end},
    {'akinsho/toggleterm.nvim', config = function() require('plugins.toggleterm') end},

    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp', config = function() require('plugins.cmp') end},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'L3MON4D3/LuaSnip', config = function() require('plugins.luasnip') end},
    {'saadparwaiz1/cmp_luasnip'},
})
