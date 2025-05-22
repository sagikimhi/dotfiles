return {
	{
		"williamboman/mason-lspconfig.nvim",
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
									globals = { "vim" },
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
