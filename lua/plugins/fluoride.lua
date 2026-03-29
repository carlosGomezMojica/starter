return {
  "Sang-it/fluoride",
  keys = {
    { "<leader>cv", "<cmd>Fluoride vsplit<cr>", desc = "Fluoride (vertical split)" },
  },
  config = function()
    require("fluoride").setup()
  end,
}
