require('lsp.keymaps')

require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = { 'pyright' },
    automatic_installation = true
})

local lspconfig = require('lspconfig')

local servers = { 'pyright' }

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
end
