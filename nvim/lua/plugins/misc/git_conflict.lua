return {
	"akinsho/git-conflict.nvim",
	lazy = false,
	opts = {
		default_mappings = {
			ours = "<leader>Go",
			theirs = "<leader>Gt",
			none = "<leader>G0",
			both = "<leader>Gb",
			next = "]x",
			prev = "[x",
		},
	},
	keys = {
		{
			"<leader>gx",
			"<cmd>GitConflictListQf<cr>",
			desc = "List Conflicts",
		},
		{
			"<leader>gr",
			"<cmd>GitConflictRefresh<cr>",
			desc = "Refresh Conflicts",
		},
	},
}
