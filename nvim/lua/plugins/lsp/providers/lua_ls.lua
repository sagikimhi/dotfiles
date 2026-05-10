return {
	{
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason.nvim",
            { "mason-org/mason-lspconfig.nvim", opts = {} },
        },
		ft = "lua",
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            codeLens = {
                                enable = true,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                            doc = {
                                privateName = { "^_" },
                            },
                            runtime = {
                                version = "LuaJIT",
                            },
                            diagnostics = {
                                globals = { "vim", "Snacks", "LazyVim" },
                            },
                            workspace = {
                                checkThirdParty = false,
                                library = { vim.env.VIMRUNTIME },
                            },
                            hint = {
                                enable = true,
                                setType = false,
                                paramType = true,
                                paramName = "Disable",
                                semicolon = "Disable",
                                arrayIndex = "Disable",
                            },
                        },
                    },
                },
            },
        }
	},
}
