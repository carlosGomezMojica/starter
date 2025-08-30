return {
  {
    "nvzone/volt",
    lazy = true,
  },
  {
    "nvzone/floaterm",
    dependencies = { "nvzone/volt" },
    cmd = { "FloatermToggle" },
    keys = {
      { "<leader>t", "<cmd>FloatermToggle<cr>", desc = "Floaterm" },
    },
    opts = {
      border = true,
      size_h = 20,
    },
    config = function(_, opts)
      require("floaterm").setup(opts)
    end,
  },
}
