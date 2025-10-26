return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
		opts = {
			servers = {
				["*"] = {
					keys = {
						{ -- K: Hover
							"K",
							function()
								vim.lsp.buf.hover({
									-- wrap = true,
									-- focus = false,
									-- wrap_at = 78,
									-- focusable = true,
									-- max_width = 80,
									-- max_height = 40,
								})
							end,
							mode = { "n" },
							desc = "Hover",
						},
						{ -- F2: Rename
							"<F2>",
							function()
								vim.lsp.buf.rename()
							end,
							mode = { "n" },
							desc = "Rename Symbol",
						},
						{ -- gs: Goto Symbol
							"gs",
							function()
								Snacks.picker.lsp_symbols({
									filter = LazyVim.config.kind_filter,
								})
							end,
							mode = { "n" },
							desc = "LSP Symbols",
							has = "documentSymbols",
						},
						{
							"gd",
							function()
								Snacks.picker.lsp_definitions()
							end,
							mode = { "n" },
							desc = "Goto Definition",
							has = "definition",
						},
						{
							"gD",
							function()
								Snacks.picker.lsp_declarations()
							end,
							mode = { "n" },
							desc = "Go to declarations",
							has = "declaration",
						},
						{
							"gi",
							function()
								Snacks.picker.lsp_implementations()
							end,
							mode = { "n" },
							desc = "Go to implementations",
							has = "implementation",
						},
						{
							"gr",
							function()
								Snacks.picker.lsp_references()
							end,
							mode = { "n" },
							desc = "References",
						},
						{
							"<leader>wd",
							function()
								Snacks.picker.lsp_workspace_symbols()
							end,
							mode = { "n" },
							desc = "Dynamic workspace symbols",
						},
					},
				},
			},
		},
	},
}
