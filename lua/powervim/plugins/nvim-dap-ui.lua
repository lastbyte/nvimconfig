return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "folke/neodev.nvim" },
  config = function()
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    -- dap.listeners.before.event_terminated.dapui_config = function()
    --   dapui.close()
    -- end
    -- dap.listeners.before.event_exited.dapui_config = function()
    --   dapui.close()
    -- end

    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "", texthl = "Error", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapLogPoint",
      { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
    )
    vim.fn.sign_define(
      "DapStopped",
      { text = "", texthl = "Constant", linehl = "DapStopped", numhl = "DapStopped" }
    )
  end,
}
