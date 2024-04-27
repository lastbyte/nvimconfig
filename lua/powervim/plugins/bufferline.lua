return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = { { filetype = "neo-tree", text = "Explorer", padding = 1, text_align = "left" } },
        separator_style = "slope",
      },
    })
  end,
}
