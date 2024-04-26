return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")
    local function restore_nvim_tree()
      local nvim_tree = require('neo-tree')
      nvim_tree.change_dir(vim.fn.getcwd())
      nvim_tree.refresh()
    end

    auto_session.setup {
      post_restore_cmds = { restore_nvim_tree },
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/Downloads", "~/Documents", "~/Desktop" },
      auto_save_enabled = true,
    }
  end,
}
