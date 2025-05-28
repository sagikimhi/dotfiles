return {
	{
		"nvim-telescope/telescope.nvim",

		lazy = false,

		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},

		opts = {
			pickers = {
				find_files = {
					theme = "ivy",
				},
			},
			extensions = {
				fzf = {},
			},
		},

		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "ivy",
					},
				},
				extensions = {
					fzf = {},
				},
			})
			require("telescope").load_extension("fzf")
		end,
	},
}
