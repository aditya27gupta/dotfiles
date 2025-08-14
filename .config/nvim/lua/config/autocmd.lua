-- AUTOCMD

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
}
)

vim.schedule(function() -- Sync clipboard between OS and Neovim.
    vim.o.clipboard = 'unnamedplus'
end)
