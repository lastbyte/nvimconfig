return {
  "simrat39/symbols-outline.nvim",
  config = function()
    require("symbols-outline").setup()
    vim.api.nvim_create_autocmd("VimLeave", {
      pattern = "*",
      command = "SymbolsOutlineClose",
    })
  end,
}
