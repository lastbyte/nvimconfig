return {
	{
		"lewis6991/hover.nvim",
		keys = {
			{
				"K",
				function()
					require("hover").hover()
				end,
				desc = "hover.nvim",
			},
			{
				"gK",
				function()
					require("hover").hover_select({})
				end,
				desc = "hover.nvim (select)",
			},
			{
				"<C-f>",
				function()
					require("hover").hover_switch("next")
				end,
				desc = "hover.nvim (next source)",
			},
			{
				"<C-b>",
				function()
					require("hover").hover_switch("previous")
				end,
				desc = "hover.nvim (previous source)",
			},
		},
		config = function()
			require("hover").setup({
				init = function()
					-- Require the providers you want to use
					require("hover.providers.lsp")
					require("hover.providers.diagnostic")
					require("hover.providers.man")
					require("hover.providers.dictionary")
					-- Optional providers depending on your setup:
					-- require("hover.providers.gh")
					-- require("hover.providers.gh_user")
					-- require("hover.providers.dap")
					-- require("hover.providers.fold_preview")
				end,
				preview_opts = {
					border = "rounded",
				},
				-- Whether the hover window should follow the cursor
				title = true,
				mouse_providers = {
					"LSP",
				},
				mouse_delay = 1000,
			})
		end,
	},
}
