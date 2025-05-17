return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
			vim.keymap.set({ "n" }, "?", function()
				require("telescope.builtin").live_grep()
			end, {})
			vim.keymap.set({ "n" }, "<C-p>", function()
				require("telescope.builtin").git_files()
			end, {})
			vim.keymap.set({ "n" }, "<C-f>", function()
				require("telescope.builtin").find_files()
			end, {})
			vim.keymap.set({ "n" }, "\\", function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end, {})
		end,
		keys = function()
			local builtin = require("telescope.builtin")
			return {
				{ "?", builtin.live_grep, mode = { "n" } },
				{ "<C-p>", builtin.git_files, mode = { "n" } },
				{ "<C-f>", builtin.find_files, mode = { "n" } },
				{ "\\", builtin.current_buffer_fuzzy_find, mode = { "n" } },
			}
		end,
	},
}
