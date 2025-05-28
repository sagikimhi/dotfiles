return {
	{
		"mbbill/undotree",
		keys = function()
			return {
				{ "<leader>u", vim.cmd.UndotreeToggle, mode = { "n" } },
			}
		end,
	},
}
