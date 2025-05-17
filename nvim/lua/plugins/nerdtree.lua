return {
	{
		"preservim/nerdtree",
		keys = function()
			return {
				{ mode = { "n" }, "<leader>pf", vim.cmd.NERDTreeFind },
				{ mode = { "n" }, "<leader>pv", vim.cmd.NERDTreeToggle },
			}
		end,
	},
}
