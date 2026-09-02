-- Configure and initialize the plugin
require("which-key").setup({
	-- Leave empty to use the default settings
})

-- Optional manual keymap to search your current buffer's active maps
vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

require("Comment").setup()
-- Normal mode: Toggle current line
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })

-- Visual mode: Toggle selection
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

require("lazygit")

vim.keymap.set("n", "<leader>gg", "<Esc>:LazyGit<CR>", { desc = "open lazygit interface" })
