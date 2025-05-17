return {
	{ "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"pyright",
					"ruff",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,

					lua_ls = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								Lua = {
									runtime = { version = "LuaJIT" },
									diagnostics = { globals = { "vim" } },
									workspace = { library = { vim.env.VIMRUNTIME } },
								},
							},
						})
					end,
				},
			})
		end,
	},
	-- {
	--     "williamboman/mason.nvim",
	-- },
	-- {
	--     "williamboman/mason-lspconfig.nvim",
	--     config = function()
	--         require("mason-lspconfig").setup({
	--             automatic_enable = true,
	--             ensure_installed = {
	--                 "lua_ls",
	--                 "rust_analyzer",
	--                 "pyright",
	--                 "ruff",
	--             },
	--             handlers = {
	--                 function(server_name)
	--                     require("lspconfig")[server_name].setup({})
	--                 end,

	--                 lua_ls = function()
	--                     require("lspconfig").lua_ls.setup({
	--                         settings = {
	--                             Lua = {
	--                                 runtime = { version = "LuaJIT" },
	--                                 diagnostics = { globals = { "vim" } },
	--                                 workspace = { library = { vim.env.VIMRUNTIME } },
	--                             },
	--                         },
	--                     })
	--                 end,

	--                 pyright = function()
	--                     require("lspconfig").pyright.setup({
	--                         settings = {
	--                             python = {
	--                                 analysis = {
	--                                     autoSearchPaths = true,
	--                                     diagnosticMode = "workspace",
	--                                     typeCheckingMode = "off",
	--                                     useLibraryCodeForTypes = true,
	--                                     disableOrganizeImports = true,
	--                                 },
	--                             },
	--                         },
	--                     })
	--                 end,

	--                 ruff = function()
	--                     require("lspconfig").ruff.setup({
	--                         init_options = {
	--                             settings = {
	--                                 enable = true,
	--                                 fixAll = true,
	--                                 lineLength = 79,
	--                                 organizeImports = false,
	--                                 showSyntaxErrors = true,
	--                                 configurationPreference = "filesystemFirst",
	--                                 codeAction = {
	--                                     fixViolation = { enable = true },
	--                                     disableRuleComment = { enable = true },
	--                                 },
	--                                 lint = {
	--                                     select = {
	--                                         "A",
	--                                         "B",
	--                                         "C4",
	--                                         "D",
	--                                         "E",
	--                                         "F",
	--                                         "N",
	--                                         "W",
	--                                         "DJ",
	--                                         "PT",
	--                                         "EM",
	--                                         "UP",
	--                                         "NPY",
	--                                         "ISC",
	--                                         "ICN",
	--                                         "SIM",
	--                                         "RUF",
	--                                         "PERF",
	--                                         "ASYNC",
	--                                     },
	--                                     ignore = {
	--                                         "C408",
	--                                         "D100",
	--                                         "D101",
	--                                         "D102",
	--                                         "D103",
	--                                         "D104",
	--                                         "D105",
	--                                         "D205",
	--                                         "UP031",
	--                                         "RUF022",
	--                                         "ASYNC110",
	--                                     },
	--                                 },
	--                             },
	--                         },
	--                     })
	--                 end,
	--             },
	--         })
	--     end,
	-- },
}
