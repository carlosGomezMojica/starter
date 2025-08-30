return {
  -- 1) Repositorio del plugin
  "gbprod/substitute.nvim",

  -- 2) Carga perezosa (cuando ya está “todo listo”)
  event = "VeryLazy",

  -- 3) Opciones del plugin
  opts = {
    -- Se ejecuta tras cada sustitución (por defecto: nil). Útil para integrar con yanky.nvim
    on_substitute = nil,

    -- Empuja el texto sustituido al registro por defecto
    yank_substituted_text = true,

    -- Mantiene el cursor donde estaba tras sustituir
    preserve_cursor_position = true,

    -- Resaltado temporal de lo sustituido
    highlight_substituted_text = { enabled = true, timer = 300 },

    -- Config del operador “range”
    range = {
      prefix = "s",
      prompt_current_text = false,
      confirm = false,
      complete_word = false,
      subject = nil,
      range = nil,
      suffix = "",
      auto_apply = false,
      cursor_position = "end",
    },

    -- Config del operador “exchange”
    exchange = {
      motion = false,
      use_esc_to_cancel = true,
      preserve_cursor_position = false,
    },
  },

  -- 4) Atajos de teclado
  keys = {
    -- RANGE SUBSTITUTE (dos motions: qué + dónde)
    {
      "<leader>r",
      function()
        require("substitute.range").operator()
      end,
      mode = "n",
      desc = "Range substitute (operador)",
    },
    {
      "<leader>r",
      function()
        require("substitute.range").visual()
      end,
      mode = "x",
      desc = "Range substitute (visual subject)",
    },
  },
}
