return {
  "hakonharnes/img-clip.nvim",
  opts = {
    default = {
      dir_path = vim.fn.expand("~/Pictures/assetsAgents"),
      file_name = "%Y-%m-%d-%H-%M-%S",
    },
    filetypes = {
      markdown = {
        dir_path = vim.fn.expand("~/Documents/braind/imagenesNotas"),
        file_name = "%Y-%m-%d-%H-%M-%S",
        -- cursor lands on alt text so you can describe the image immediately
        -- markview renders it inline; mkdnflow puede seguirlo con <CR>
        template = "![$CURSOR]($FILE_PATH)",
      },
    },
  },
  keys = {
    { "<leader>mi", "<cmd>PasteImage<cr>", desc = "Paste Image" },
  },
}
