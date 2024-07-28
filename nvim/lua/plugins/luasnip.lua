local luasnip = require('luasnip')

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})

luasnip.add_snippets('all', {
    luasnip.snippet("date", {
        luasnip.insert_node(1),
        luasnip.text_node(os.date('%Y-%m-%d')),
    }),
})

vim.keymap.set({'i', 's'}, '<C-k>', function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, {silent = true})

vim.keymap.set({'i', 's'}, '<C-j>', function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, {silent = true})
