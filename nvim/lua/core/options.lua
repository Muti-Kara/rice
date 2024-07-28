local set = vim.opt  -- Alias to set options

-- User Interface
set.number = true              -- Show line numbers
set.relativenumber = true      -- Show relative line numbers
set.cursorline = true          -- Highlight the current line
set.cursorcolumn = false       -- Highlight the current column
set.textwidth = 80             -- Maximum width of text before wrapping
set.wrap = false               -- Disable wrapping of lines
set.scrolloff = 14              -- Minimal number of screen lines to keep above and below the cursor
set.sidescrolloff = 14          -- The minimal number of screen columns to keep to the left and right of the cursor

-- Tabs and Indentation
set.expandtab = true           -- Convert tabs to spaces
set.tabstop = 4                -- Number of spaces tabs count for
set.shiftwidth = 4             -- Size of an indent
set.smarttab = true            -- Smart tabbing
set.autoindent = true          -- Copy indent from current line when starting a new line
set.smartindent = true         -- Make indenting smarter again
set.shiftround = true          -- Round indent to multiple of 'shiftwidth'

-- Search
set.ignorecase = true          -- Case insensitive searching
set.smartcase = true           -- Case-sensitive if expression contains a capital letter
set.incsearch = true           -- Incremental search
set.hlsearch = true            -- Highlight search results

-- Files
set.backup = false             -- Do not make a backup before overwriting a file
set.writebackup = false        -- Do not backup the file while writing
set.swapfile = false           -- Do not use a swapfile for buffer

-- Performance
set.lazyredraw = true          -- Do not redraw while executing macros

-- Misc
set.clipboard = 'unnamedplus'  -- Access system clipboard
set.mouse = 'a'                -- Enable mouse mode
set.updatetime = 300           -- Faster completion
set.timeoutlen = 500           -- Time in ms to wait for a mapped sequence to complete
set.signcolumn = 'number'

-- Colors and Fonts
set.termguicolors = true       -- Enable 24-bit RGB colors
set.background = 'dark'        -- Tell Neovim to expect a dark background
set.showmode = false           -- Do not show mode since we use a statusline

-- Spell Checking
set.spell = false              -- Turn on spell checking
set.spelllang = 'en'           -- Set language for spell checking

-- Folding
set.foldmethod = 'marker'      -- Set fold method
set.foldlevel = 0              -- Start with all folds closed

vim.cmd [[
    syntax enable
    filetype plugin indent on
]]

vim.api.nvim_command('highlight YankUnderline gui=underline cterm=underline')
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = "YankUnderline", timeout = 150 })
    end,
})
