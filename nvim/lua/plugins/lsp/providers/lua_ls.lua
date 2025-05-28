return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", opts = {} },
		ft = "lua",
		opts = {
			handlers = {
				lua_ls = function(_)
					local capabilities = require("blink.cmp").get_lsp_capabilities()

					vim.tbl_deep_extend("force", capabilities, {
						general = { positionEncodings = { "utf-16" } },
					})

					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim", "Snacks", "LazyVim" },
								},
								workspace = {
									library = { vim.env.VIMRUNTIME },
								},
							},
						},
					})
				end,
			},
		},
	},
}
