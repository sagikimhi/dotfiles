return {
	{
		"preservim/nerdtree",
		keys = function()
			return {
				{ "<leader>pf", vim.cmd.NERDTreeFind, mode = { "n" } },
				{ "<leader>pv", vim.cmd.NERDTreeToggle, mode = { "n" } },
			}
		end,
	},
}
