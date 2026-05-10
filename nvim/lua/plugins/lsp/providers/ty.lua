return {
	{
		"neovim/nvim-lspconfig",
		ft = "python",
		dependencies = {
			"mason.nvim",
			{ "mason-org/mason-lspconfig.nvim", opts = {} },
		},
		opts = {
			servers = {
				ty = {
					settings = {
						ty = {
                            diagnosticMode = "workspace",
                        },
					},
				},
			},
		},
	},
}
