return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {--[[ things you want to change go here]]
    },

    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true }),
  },
}
