return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "NeoTree",
            text = "NeoTree",
            text_align = "left",
            separator = true,
          },
        },
      },
    })
  end,
}
