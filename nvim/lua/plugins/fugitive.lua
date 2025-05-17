return {
	{
		"tpope/vim-fugitive",
		keys = function()
			return {
				{ "<leader>gg", vim.cmd.Git, mode = { "n" }, desc = "toggle fugitive" },
			}
		end,
	},
}
