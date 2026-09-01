require("catppuccin").setup({
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	transparent_background = true,
	integrations = {
		mini = { enabled = true },
		native_lsp = { enabled = true },
		treesitter = true,
		which_key = true,
	},
})

vim.cmd.colorscheme("catppuccin")
