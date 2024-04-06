return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        swift = { "swiftformat" },
      },
      format_on_save = function()
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      log_level = vim.log.levels.ERROR,
    })

    -- format on save
    vim.api.nvim_exec(
      [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre * silent! :ConformFormat
  augroup END
]],
      true
    )

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
