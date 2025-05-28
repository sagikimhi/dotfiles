return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
		opts = {
			automatic_installation = true,
			ensure_installed = { "lua_ls", "rust_analyzer" },
			handlers = {
				function(server_name)
					local capabilities = require("blink.cmp").get_lsp_capabilities()
					vim.tbl_deep_extend("force", capabilities, {
						general = { positionEncodings = { "utf-16" } },
					})
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		},
	},
	{ import = "plugins.lsp" },
}
