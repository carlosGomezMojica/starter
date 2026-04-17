return {
  "jakewvincent/mkdnflow.nvim",
  ft = { "markdown" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.schedule(function()
          vim.opt_local.foldmethod = "manual"
        end)
      end,
    })
  end,
  opts = {
    mappings = {
      MkdnDecreaseHeading = false,           -- conflicts with Oil's -
      MkdnNewListItemBelowInsert = false,    -- conflicts with vim's o
      MkdnNewListItemAboveInsert = false,    -- conflicts with vim's O
      MkdnFoldSection = { "n", "<leader>mf" },
      MkdnUnfoldSection = { "n", "<leader>mF" },
      MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>mp" },
    },
  },
}
