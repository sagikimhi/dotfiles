return {
	{
		"folke/zen-mode.nvim",
		keys = function()
			return {
				{ "<leader>z", vim.cmd.ZenMode, mode = { "n" } },
			}
		end,
	},
}
