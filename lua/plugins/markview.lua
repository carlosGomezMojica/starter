return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
  keys = {
    { "<leader>mv", "<cmd>Markview toggle<cr>",     desc = "Toggle Markview" },
    { "<leader>mh", "<cmd>Markview hybridMode<cr>", desc = "Toggle Hybrid Mode" },
    { "<leader>ms", "<cmd>Markview splitView<cr>",  desc = "Toggle Split View" },
  },
}
