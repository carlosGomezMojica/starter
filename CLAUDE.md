# CONFIGURACIÓN DE NEOVIM

## OBJETIVO
Ayudante para integrar plugins, ajustar keymaps y modificar la configuración de Neovim basada en LazyVim.

## Base
- **Framework**: [LazyVim](https://www.lazyvim.org/) — toda configuración extiende o sobrescribe sus defaults.
- **Lenguaje**: Lua
- **Gestor de plugins**: lazy.nvim (via LazyVim)
- **Entorno**: Linux / Wayland (wl-clipboard para el portapapeles)

## Herramientas habilitadas
Fetch

## Estructura de archivos

```
lua/
  config/
    autocmds.lua   # Autocomandos personalizados
    keymaps.lua    # Keymaps globales (extiende los de LazyVim)
    lazy.lua       # Inicialización de lazy.nvim
    options.lua    # Opciones de vim (portapapeles Wayland, etc.)
  plugins/
    agentic.lua        # agentic.nvim — integración con agentes IA (Claude, Codex)
    cmp.lua            # Autocompletado
    floaterm.lua       # Terminal flotante
    fluoride.lua       # Plugin personalizado
    lazygit.lua        # Integración con lazygit
    luasnip.lua        # Snippets
    oil.lua            # Explorador de archivos (oil.nvim), muestra hidden files
    quick-todo.lua     # TODOs rápidos
    render-markdown.lua # Render de markdown en buffer
    sustitute.lua      # Plugin de sustitución
    theme.lua          # theme-hub.nvim — selector de temas con persistencia
    time-bomb.lua      # Plugin personalizado
    ui.lua             # UI: which-key, lualine, incline, snacks, zen-mode, todo-comments
    vim-coach.lua      # Entrenador de comandos vim
    vim-nomr-trainer.lua
    which-key.lua      # Configuración adicional de which-key
```

## Plugins clave y su configuración

| Plugin | Archivo | Notas |
|--------|---------|-------|
| oil.nvim | `plugins/oil.lua` | `-` abre directorio padre; hidden files activados; keymaps custom |
| snacks.nvim | `plugins/ui.lua` | Dashboard, picker de proyectos, fuzzy finder |
| agentic.nvim | `plugins/agentic.lua` | `<leader>a*`; provider: claude-agent-acp |
| lualine.nvim | `plugins/ui.lua` | Tema auto (adapta al colorscheme activo) |
| which-key.nvim | `plugins/ui.lua` | Preset classic, border single |
| theme-hub.nvim | `plugins/theme.lua` | Auto-install, persistente |
| zen-mode.nvim | `plugins/ui.lua` | `<leader>z` |

## Keymaps personalizados destacados

- `-` → `Oil` (explorador)
- `<C-s>` → Guardar con notificación custom (`SaveFile()`)
- `<leader>fp` → `snacks.picker.projects()`
- `<leader>aa/an/ar/af/as/ad/ap` → Agentic (IA)
- `<leader>z` → Zen Mode

## Proyectos registrados en snacks picker

- `~/Work/fullcolombia/full_suit_back_end_node_js`
- `~/.config/nvim`
- `~/Documents/braind`

## Convenciones al hacer cambios

- Cada archivo en `plugins/` retorna una tabla de lazy.nvim (`return { ... }`).
- Para deshabilitar un plugin de LazyVim: `{ "plugin/name", enabled = false }`.
- Los keymaps globales van en `config/keymaps.lua`; los de un plugin van dentro de su archivo en `keys = { ... }`.
- No agregar comentarios redundantes que repitan lo que el código ya dice.
