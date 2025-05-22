return {
	{
		"williamboman/mason.nvim",
        dependencies = {
            { "saghen/blink.cmp" },
            { "neovim/nvim-lspconfig" },
        },
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
		"williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "saghen/blink.cmp" },
            { "neovim/nvim-lspconfig" },
        },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.tbl_deep_extend("force", capabilities, {
				general = { positionEncodings = { "utf-16" } },
			})

			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = { "lua_ls", "rust_analyzer" },
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,
				},
			})
		end,
	},
}
