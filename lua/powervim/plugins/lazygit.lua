return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  requires = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  },
}
