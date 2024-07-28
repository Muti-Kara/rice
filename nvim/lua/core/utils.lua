local M = {}

function M.open_vertical_split_netrw()
    local current_dir = vim.fn.expand('%:p:h')
    vim.cmd('rightbelow vsplit')
    vim.cmd('lcd ' .. vim.fn.escape(current_dir, ' '))
    vim.cmd('Explore')
end

function M.open_horizontal_split_netrw()
    local current_dir = vim.fn.expand('%:p:h')
    vim.cmd('rightbelow split')  -- Ensure the split opens below
    vim.cmd('lcd ' .. vim.fn.escape(current_dir, ' '))
    vim.cmd('Explore')
end

return M
