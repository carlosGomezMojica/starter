-- This file contains the configuration for various UI-related plugins in Neovim.
return {
  -- Plugin: folke/todo-comments.nvim
  -- URL: https://github.com/folke/todo-comments.nvim
  -- Description: Plugin to highlight and search for TODO, FIX, HACK, etc. comments in your code.
  -- IMPORTANT: using version "*" to fix a bug
  { "folke/todo-comments.nvim", version = "*" },

  -- Plugin: folke/which-key.nvim
  -- URL: https://github.com/folke/which-key.nvim
  -- Description: Plugin to show a popup with available keybindings.
  -- IMPORTANT: using event "VeryLazy" to optimize loading time
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "classic",
      win = { border = "single" },
    },
  },
  -- Plugin: nvim-docs-view
  -- URL: https://github.com/amrbashir/nvim-docs-view
  -- Description: A Neovim plugin for viewing documentation.
  {
    "amrbashir/nvim-docs-view",
    lazy = true, -- Load this plugin lazily
    cmd = "DocsViewToggle", -- Command to toggle the documentation view
    opts = {
      position = "right", -- Position the documentation view on the right
      width = 60, -- Set the width of the documentation view
    },
  },

  -- Plugin: lualine.nvim
  -- URL: https://github.com/nvim-lualine/lualine.nvim
  -- Description: A blazing fast and easy to configure Neovim statusline plugin.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
    requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency for icons
    opts = {
      options = {
        theme = "oldworld", -- Set the theme for lualine
        icons_enabled = true, -- Enable icons in the statusline
      },
      sections = {
        lualine_a = {
          {
            "mode", -- Display the current mode
            icon = "󱗞", -- Set the icon for the mode
          },
        },
      },
    },
  },

  -- Plugin: incline.nvim
  -- URL: https://github.com/b0o/incline.nvim
  -- Description: A Neovim plugin for showing the current filename in a floating window.
  {
    "b0o/incline.nvim",
    event = "BufReadPre", -- Load this plugin before reading a buffer
    priority = 1200, -- Set the priority for loading this plugin
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } }, -- Set the window margin
        hide = {
          cursorline = true, -- Hide the incline window when the cursorline is active
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t") -- Get the filename
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename -- Indicate if the file is modified
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename) -- Get the icon and color for the file
          return { { icon, guifg = color }, { " " }, { filename } } -- Return the rendered content
        end,
      })
    end,
  },

  -- Plugin: mini.nvim
  -- URL: https://github.com/echasnovski/mini.nvim
  -- Description: A collection of minimal, fast, and modular Lua plugins for Neovim.
  {
    "echasnovski/mini.nvim",
    version = false, -- Use the latest version
    config = function()
      require("mini.animate").setup({
        resize = {
          enable = false, -- Disable resize animations
        },
        open = {
          enable = false, -- Disable open animations
        },
        close = {
          enable = false, -- Disable close animations
        },
        scroll = {
          enable = false, -- Disable scroll animations
        },
      })
    end,
  },

  -- Plugin: zen-mode.nvim
  -- URL: https://github.com/folke/zen-mode.nvim
  -- Description: A Neovim plugin for distraction-free coding.
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode", -- Command to toggle Zen Mode
    opts = {
      plugins = {
        gitsigns = true, -- Enable gitsigns integration
        tmux = true, -- Enable tmux integration
        kitty = { enabled = false, font = "+2" }, -- Disable kitty integration and set font size
        twilight = { enabled = true }, -- Enable twilight integration
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } }, -- Keybinding to toggle Zen Mode
  },

  -- Plugin: snacks.nvim
  -- URL: https://github.com/folke/snacks.nvim/tree/main
  -- Description: A Neovim plugin for creating a customizable dashboard.
  {
    "folke/snacks.nvim",
    opts = {
      image = {},
      picker = {
        matcher = {
          fuzzy = true,
          smartcase = true,
          ignorecase = true,
          filename_bonus = true,
        },
        sources = {
          explorer = {
            matcher = {
              fuzzy = true, -- Enables fuzzy matching, so you can be a bit imprecise with your search terms
              smartcase = true, -- If your search term has uppercase letters, the search becomes case-sensitive
              ignorecase = true, -- Ignores case when searching, unless smartcase is triggered
              filename_bonus = true, -- Gives a higher priority to matches in filenames
              sort_empty = false, -- If no matches are found, it won't sort the results
            },
          },
        },
      },
      dashboard = {

        sections = {
          {
            section = "header",

            {
              pane = 2,
              section = "terminal",
              cmd = "colorscript -e square",
              height = 5,
              padding = 1,
            },
            { section = "keys", gap = 1, padding = 1 },
            {
              pane = 2,
              icon = " ",
              desc = "Browse Repo",
              padding = 1,
              key = "b",
              action = function()
                Snacks.gitbrowse()
              end,
            },
            function()
              local in_git = Snacks.git.get_root() ~= nil
              local cmds = {
                {
                  title = "Notifications",
                  cmd = "gh notify -s -a -n5",
                  action = function()
                    vim.ui.open("https://github.com/notifications")
                  end,
                  key = "n",
                  icon = " ",
                  height = 5,
                  enabled = true,
                },
                {
                  title = "Open Issues",
                  cmd = "gh issue list -L 3",
                  key = "i",
                  action = function()
                    vim.fn.jobstart("gh issue list --web", { detach = true })
                  end,
                  icon = " ",
                  height = 7,
                },
                {
                  icon = " ",
                  title = "Open PRs",
                  cmd = "gh pr list -L 3",
                  key = "P",
                  action = function()
                    vim.fn.jobstart("gh pr list --web", { detach = true })
                  end,
                  height = 7,
                },
                {
                  icon = " ",
                  title = "Git Status",
                  cmd = "git --no-pager diff --stat -B -M -C",
                  height = 10,
                },
              }
              return vim.tbl_map(function(cmd)
                return vim.tbl_extend("force", {
                  pane = 2,
                  section = "terminal",
                  enabled = in_git,
                  padding = 1,
                  ttl = 5 * 60,
                  indent = 3,
                }, cmd)
              end, cmds)
            end,
            { section = "startup" },
          },
        },

        preset = {
          header = [[
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢠⡏⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡞⣟⣿⣿⢸⠐⢻⡿⡿⡏⣝⢿⡜⣧⢻⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⡽⣮⢿⢸⡀⣯⢷⣕⣻⠘⠯⠻⣀⢎⡻⣿⡅⣛⡿⡏⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢛⠿⣿⣮⡙⢛⡛⠚⢓⡘⣃⡘⣓⣐⢦⠈⠩⣘⢦⠭⠘⣊⠿⣖⠝⡀⠳⡬⡻⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡻⣌⢳⣦⣞⠲⢬⣙⠳⣒⡓⠛⠞⣯⡱⡃⣈⡡⠃⠓⠎⠂⠍⡔⡄⡪⠲⣜⢎⢂⢍⢟⠿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⢿⡪⢝⡷⣜⢁⡳⢼⣟⡧⠘⠴⣦⣙⢒⡒⢢⣉⠌⣈⡑⠂⠉⠈⠒⠆⡈⢈⠀⠐⠈⢗⡉⠀⠊⡳⢙⢿⣿⣿
⣿⣿⣿⣿⣿⡿⡷⣝⠆⠝⠗⣩⡲⢭⣉⣗⠞⠭⠈⠉⠒⢨⠥⣥⢒⣢⣋⣙⠛⣲⠤⠬⡐⠓⠀⠂⠂⢀⠀⠀⠑⠁⢂⡈⠍⡎⢿⡿
⣿⣿⣿⣿⣿⣷⡴⡃⡂⡐⡙⢦⠬⣡⢤⠌⠦⠁⠒⠘⠻⠿⣛⣯⣭⣶⣵⣦⡤⠀⠠⠐⠁⠒⠄⠑⠄⠀⠀⠀⠀⠀⠙⣧⠡⢳⢀⠃
⣿⣿⣿⣿⣿⣿⣿⠎⡄⢫⡛⠶⠯⠛⠴⠚⢛⠂⢈⣭⣳⢿⡿⠟⢛⣥⡷⠶⢋⣐⣤⣄⡼⡤⠄⠀⠈⠀⠀⢀⠀⠀⠀⠘⠀⠉⠍⡄
⣿⣿⣿⣿⣿⣿⣿⣿⣮⣅⡺⠢⠤⠚⠲⢾⡿⠶⠟⠋⣡⠴⠂⣞⡋⣁⠴⢞⡻⠍⠷⣒⣦⣤⠄⠀⠀⠈⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣭⢛⡛⡉⣥⠴⢖⡛⠩⠲⠶⠁⡴⠓⠤⠈⢀⣴⠗⠪⠙⣬⣾⣿⠿⣋⡱⠶⣊⡤⠄⠖⠂⠀⠀⠀⠀⠀⠀⠴⠠
⣿⣿⣿⣿⣿⣿⣿⣿⠋⠦⢂⠐⢢⠴⠞⠋⠛⡀⡞⠀⠀⢀⡵⠛⣁⣴⢖⣽⡿⠋⢔⣪⠵⣪⡾⣫⡾⢃⣴⣾⢾⠇⠀⠀⠀⠀⠤⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⢸⣿⣿⣿⡟⢿⡇⢄⢋⠈⠖⢠⣖⢟⡵⢟⠏⣠⡾⣻⣵⡿⢋⣴⣫⣶⣿⢧⡏⡿⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡞⡟⢻⣿⣿⢧⡖⣨⡕⡴⢠⠯⣚⣉⠆⣃⣮⡷⠿⠋⣣⡾⣿⣿⡟⢪⠂⣿⠠⠁⠀⡄⡄⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣥⢾⣴⣿⣟⢙⣝⣋⡚⠱⠣⠞⠉⠁⠉⠁⠀⠒⠂⠟⣋⡼⠫⠕⢡⠎⠈⣇⠃⠠⠘⠠⠃⠠⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢠⠈⢿⣿⣿⣿⠘⡟⢫⡴⠞⠁⠀⠀⡄⢰⣤⡄⠀⢠⡾⠋⠔⡄⠀⠍⠀⠁⢿⠈⠤⢠⠓⠀⡆⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⢁⠤⣄⡀⠙⣿⣿⣷⣷⡞⢣⠀⢀⣠⢀⣼⣿⠻⡌⠀⢀⠀⡀⢀⠀⠂⠀⠀⢀⠘⠀⠀⠈⠀⣤⡇⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠞⣄⢈⠙⢀⣹⣿⣿⡟⠙⣿⡇⢺⣏⣼⣧⠙⢁⠘⢰⢻⡜⢻⠿⠀⠤⠓⢺⠉⠀⠀⠀⠀⡆⢻⠄⠀⠐⠀
⣿⣿⣿⣿⣿⣿⣿⣿⢟⣼⣿⡘⣿⠌⢿⣿⡟⠁⢀⣹⡷⠜⣿⣿⣿⢡⣼⣄⡿⣿⡁⠘⠶⠤⠶⠛⠉⠀⢠⣇⢳⡁⣿⠜⠀⢰⡔⢀
⣿⣿⣿⣿⣿⣿⣿⠁⠿⣿⣿⣦⣼⣧⣼⣟⠃⢸⣿⣿⡗⢩⣿⣿⣿⣾⣿⣿⣷⣾⣷⣄⡀⠀⠀⠀⣠⢆⣉⣾⢬⢧⠹⣀⣞⡟⢰⢀
⣿⣿⣿⣿⣿⣿⣿⣷⣅⡨⠙⠻⠿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣛⣿⣿⣿⣿⠔⠀⠀⠀⣿⡘⡇⣿⢀⡏⡜⡇⢸⢣⠇⠃
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⡑⠀⢠⢀⠀⢀⠀⢀⠀⣀⡄⢀⣠⡶⣿⣫⣾⣿⣿⣿⡀⠆⢠⠀⢻⠂⠀⡼⡜⡇⠑⡀⡃⡞⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠘⠊⠁⠁⠀⣀⡄⣸⡿⣫⣾⣿⢣⣯⣿⣻⡯⠀⠱⠀⢆⡈⢻⠀⠀⠃⡀⢠⡆⡿⠞⢂⠂
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⠟⢁⡾⠋⠰⢟⣵⣿⢟⣵⣿⣿⠻⠿⠃⠸⣔⡝⢘⡧⠘⢂⠓⡈⢡⢈⢟⡌⡁⣜⢃
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣩⣾⣿⡿⣠⢆⣴⣾⠋⣾⣿⣿⣿⠇⢠⣿⡙⠾⠓⡞⣈⠔⡊⢧⣇⣸⢈⣐⢲⣇⢫⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⢻⣿⣿⠃⠥⠾⠿⠡⠶⠿⠿⠋⠐⠁⠘⠋⠁⠀⠀⣵⣿⣷⣼⣆⣼⣿⣜⣿⣿⣿⡈⣛
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿
⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿
]],
        },
      },
    },
  },
}
