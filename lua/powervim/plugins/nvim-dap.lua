return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    dap.adapters.go = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }

    dap.adapters.python = {
      type = "executable",
      command = "/usr/bin/python3",
      args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.go = {

      {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
    }

    dap.configurations.python = {
      {
        type = "python",
        name = "debug",
        request = "launch",
        program = "${file}",
        pythonPath = function()
          return "/usr/bin/python"
        end,
      },
    }
  end,
}
