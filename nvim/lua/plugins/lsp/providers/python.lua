return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", opts = {} },
		ft = "python",
		opts = {},
		keys = {
			{ "<leader>-", [[mzyyp^v$r-`zzzzv]], mode = { "n", "x" } },
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = { inlay_hints = { enabled = false } },
	},
}
