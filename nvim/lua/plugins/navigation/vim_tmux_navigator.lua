return {
	{
		"christoomey/vim-tmux-navigator",
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", mode = { "n" } },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", mode = { "n" } },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", mode = { "n" } },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", mode = { "n" } },
			-- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", mode = { "n" } },
		},
	},
}
