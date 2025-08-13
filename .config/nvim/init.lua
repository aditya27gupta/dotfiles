-- GLOBALS

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- OPTIONS

vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true   -- Enable break indent
vim.o.undofile = true      -- Save undo history
vim.o.ignorecase = true    -- Case-insensitive searching
vim.o.smartcase = true
vim.o.signcolumn = 'yes'   -- Keep signcolumn on by default
vim.o.updatetime = 250     -- Decrease update time
vim.o.timeoutlen = 300     -- Decrease mapped sequence wait time
vim.o.splitright = true    -- Configure how new splits should be opened
vim.o.splitbelow = true
vim.o.list = true          -- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split' -- Preview substitutions live, as you type!
vim.o.cursorline = true    -- Show which line your cursor is on
vim.o.scrolloff = 10       -- Minimal number of screen lines to keep above and below the cursor.
vim.o.confirm = true       -- Confirmation Box


--  KEYMAPS

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights on search' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })



-- FUNCTIONS

vim.schedule(function() -- Sync clipboard between OS and Neovim.
    vim.o.clipboard = 'unnamedplus'
end)
