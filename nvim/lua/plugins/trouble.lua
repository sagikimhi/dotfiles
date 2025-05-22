return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
		opts = { use_diagnostic_signs = true },
	},
}
