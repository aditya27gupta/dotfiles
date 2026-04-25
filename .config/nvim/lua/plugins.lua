-- PLUGINS

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim",         version = "main",   name = "mini" },
    { src = "https://github.com/folke/which-key.nvim",        version = "main",   name = "which-key" },
    { src = "https://github.com/catgoose/nvim-colorizer.lua", version = "master", name = "colorizer" }
})


-- ACTIVATE PLUGINS

-- Statusline
local statusline = require 'mini.statusline'
statusline.setup { use_icons = true }
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '%2l:%-2v' end

-- Which Key popup
require('which-key').setup({ delay = 0, preset = "modern", icons = { mappings = false } })

-- Auto-Completions
require "mini.completion".setup()

-- Colorizer
require("colorizer").setup({ options = { parsers = { css = true } }, })
