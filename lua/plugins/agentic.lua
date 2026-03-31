return {
  "carlos-algms/agentic.nvim",
  keys = {
    -- abrir/cerrar chat
    {
      "<leader>aa",
      function()
        require("agentic").toggle()
      end,
      desc = "Agentic Toggle",
    },

    -- nueva sesión
    {
      "<leader>an",
      function()
        require("agentic").new_session()
      end,
      desc = "Agentic New Session",
    },

    -- restaurar sesión
    {
      "<leader>ar",
      function()
        require("agentic").restore_session()
      end,
      desc = "Agentic Restore",
    },

    -- enviar archivo actual
    {
      "<leader>af",
      function()
        require("agentic").add_file()
      end,
      desc = "Send File to Agent",
    },

    -- enviar selección visual
    {
      "<leader>as",
      function()
        require("agentic").add_selection()
      end,
      mode = "v",
      desc = "Send Selection",
    },

    -- enviar diagnósticos del buffer
    {
      "<leader>ad",
      function()
        require("agentic").add_buffer_diagnostics()
      end,
      desc = "Send Diagnostics",
    },
    -- change agent
    {
      "<leader>ap",
      function()
        require("agentic").switch_provider()
      end,
      desc = "Swithch ACP Provider",
    },
  },
  opts = {
    provider = "claude-agent-acp",
    acp_providers = {
      ["claude-agent-acp"] = {
        name = "Claude Agent ACP",
        command = "claude-agent-acp",
        env = {},
      },
      ["codex-acp"] = {
        name = "Codex ACP",
      },
    },
  },
}
