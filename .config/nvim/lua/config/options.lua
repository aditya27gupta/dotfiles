-- OPTIONS

vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true    -- Enable break indent
vim.opt.undofile = true       -- Save undo history
vim.opt.ignorecase = true     -- Case-insensitive searching
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'    -- Keep signcolumn on by default
vim.opt.updatetime = 250      -- Decrease update time
vim.opt.timeoutlen = 300      -- Decrease mapped sequence wait time
vim.opt.splitright = true     -- Configure how new splits should be opened
vim.opt.splitbelow = true
vim.opt.list = true           -- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'  -- Preview substitutions live, as you type!
vim.opt.cursorline = true     -- Show which line your cursor is on
vim.opt.scrolloff = 10        -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.confirm = true        -- Confirmation Box
vim.opt.winborder = 'rounded' -- default border for all floating windows
