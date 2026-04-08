-- PLUGINS

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim",  version = "main", name = "mini" },
    { src = "https://github.com/folke/which-key.nvim", version = "main", name = "which-key" },
})

-- GLOBALS

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.clipboard = "osc52"

-- OPTIONS

vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true                          -- Enable break indent
vim.opt.undofile = true                             -- Save undo history
vim.opt.ignorecase = true                           -- Case-insensitive searching
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'                          -- Keep signcolumn on by default
vim.opt.updatetime = 250                            -- Decrease update time
vim.opt.timeoutlen = 300                            -- Decrease mapped sequence wait time
vim.opt.splitright = true                           -- Configure how new splits should be opened
vim.opt.splitbelow = true
vim.opt.list = true                                 -- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'                        -- Preview substitutions live, as you type!
vim.opt.cursorline = true                           -- Show which line your cursor is on
vim.opt.scrolloff = 10                              -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.confirm = true                              -- Confirmation Box
vim.opt.winborder = 'rounded'                       -- default border for all floating windows
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }    -- clipboard settings
vim.opt.completeopt = 'menu,menuone,fuzzy,noinsert' -- Options for insert mode completion

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

--  KEYMAPS

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights on search' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


-- ACTIVATE PLUGINS

local statusline = require 'mini.statusline'
statusline.setup { use_icons = true }
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '%2l:%-2v' end

require('which-key').setup({ delay = 0, preset = "classic" })
