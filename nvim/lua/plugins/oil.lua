return {
	{
		"stevearc/oil.nvim",

		opts = {},
		lazy = false,
		keys = function()
			return {
				{ "<C-e>", "<cmd>Oil<cr>", mode = { "n" } },
			}
		end,
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
}
