-- ============================================================================
-- PLUGINS (vim.pack)
-- ============================================================================
vim.pack.add({
	"https://www.github.com/echasnovski/mini.nvim",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/folke/which-key.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	-- Language Server Protocols
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/obsidian-nvim/obsidian.nvim",
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/lastbyte/topology.nvim",
	"https://github.com/numtostr/comment.nvim",
})

-- ============================================================================
-- PLUGIN CONFIGS
-- ============================================================================
require("plugins.misc")
require("plugins.treesitter")
require("plugins.obsidian")
require("plugins.nvim-tree")
require("plugins.fzf-lua")
require("plugins.mini")
require("plugins.lsp")
