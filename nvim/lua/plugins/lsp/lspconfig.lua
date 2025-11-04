local default_capabilities = require("blink.cmp").get_lsp_capabilities({}, true)
default_capabilities.general.positionEncodings = { "utf-16" }

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			{ "mason-org/mason-lspconfig.nvim", opts = {} },
		},
		opts = {
			inlay_hints = {
				enabled = true,
				exclude = { "python" },
			},
			diagnostics = {
				underline = true,
				update_in_insert = true,
				float = {
					source = true,
					style = "minimal",
					border = "rounded",
					severity_sort = true,
				},
				virtual_text = {
					enabled = true,
					spacing = 4,
					style = "minimal",
					source = true,
					severity = vim.diagnostic.severity.ERROR,
				},
				severity_sort = true,
			},
			servers = {
				["*"] = {
					capabilities = default_capabilities,
				},
			},
		},
	},
}
