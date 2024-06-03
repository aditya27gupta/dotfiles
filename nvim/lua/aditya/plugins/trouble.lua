return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {},
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Open/close trouble list" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Open trouble quickfix list" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
  },
}
