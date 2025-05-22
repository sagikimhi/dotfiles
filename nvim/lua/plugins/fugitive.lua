return {
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gg", vim.cmd.Git, mode = { "n" } },
		},
		config = function()
			require("fugitive").setup()
		end,
	},
}
