-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options her
--
-- Configuración específica para COSMIC/Wayland
vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste",
    ["*"] = "wl-paste",
  },
  cache_enabled = 0,
}

-- Activar el portapapeles del sistema
vim.opt.clipboard:append("unnamedplus")
