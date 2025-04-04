return {
  -- Solarized-Osaka Theme
  {
    "craftzdog/solarized-osaka.nvim",
    config = function()
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
      })
    end,
  },

  -- Catppuccin Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true,
        integrations = {
          treesitter = true,
          telescope = true,
          cmp = true,
          gitsigns = true,
        },
      })
    end,
  },

  -- Gruvbox Theme
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
  },

  -- LazyVim Configuration (Predeterminar gruvbox aquí si quieres)
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox", -- <- Puedes cambiarlo por "catppuccin" o "solarized-osaka"
    },
  },

  -- Toggle Theme Command
  {
    "nvim-lua/plenary.nvim",
    config = function()
      local themes = { "solarized-osaka", "catppuccin", "gruvbox" }
      local current_theme_index = 1

      function ToggleTheme()
        current_theme_index = current_theme_index % #themes + 1
        local new_theme = themes[current_theme_index]
        vim.cmd("colorscheme " .. new_theme)
        print("Theme changed to: " .. new_theme)
      end

      vim.api.nvim_create_user_command("ToggleTheme", ToggleTheme, {})
    end,
  },
}
