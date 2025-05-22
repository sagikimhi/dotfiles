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

		keys = {
			{
				"?",
				function()
					require("telescope.builtin").live_grep()
				end,
				mode = { "n" },
			},
			{
				"<C-p>",
				function()
					require("telescope.builtin").git_files()
				end,
				mode = { "n" },
			},
			{
				"\\",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				mode = { "n" },
			},
		},
	},
}
