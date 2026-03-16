return {
  "Lachignol/time-bomb.nvim",
  config = function()
    require("time-bomb").setup({
      enable_default_keymaps = true,
      timer_color = "lime",
      pomodoro_cycles = {
        { title = "Trabajando ando...", time = "40", style = "casino" },
        { title = "Un descansito", time = "10", style = "gta" },
        { title = "Trabajando ando...", time = "40", style = "casino" },
        { title = "Un descansito", time = "10", style = "gta" },
        { title = "Trabajando ando...", time = "40", style = "casino" },
        { title = "Un descansooooo", time = "25", style = "gta" },
      },
    })
  end,
}
