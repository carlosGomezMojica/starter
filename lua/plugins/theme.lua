-- Primero, asegurate de que lazy.nvim cargue el tema correctamente
return {
  {
    "craftzdog/solarized-osaka.nvim", -- Reemplaza con el nombre correcto del repositorio del tema
    config = function()
      -- Configuración del tema solarized-osaka
      require("solarized-osaka").setup({
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
        on_colors = function(colors) end,
        on_highlights = function(highlights, colors) end,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = { "solarized-osaka" },
    },
  },
}
