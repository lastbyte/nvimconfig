vim.g.quickrun_config = {
	["_"] = {
		runner = "system",
		outputter = "buffer",
		["outputter/buffer/split"] = ":botright 15sp",
		["outputter/buffer/close_on_empty"] = 1,
	},
}

vim.keymap.set("n", "<leader>r", "<cmd>QuickRun<cr>", { desc = "QuickRun current file" })
vim.keymap.set("v", "<leader>r", ":QuickRun<cr>", { desc = "QuickRun selection" })
