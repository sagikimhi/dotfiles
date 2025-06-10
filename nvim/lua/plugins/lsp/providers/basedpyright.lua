local util = require("lspconfig.util")

local root_files = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
	".git",
}

vim.api.nvim_create_autocmd({ "LspAttach" }, {
	pattern = { "*" },
	callback = function(_)
		vim.diagnostic.config({ virtual_text = false })
	end,
})

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
				basedpyright = {
					cmd = { "basedpyright-langserver", "--stdio" },
					filetypes = { "python" },
					root_dir = function(fname)
						return util.root_pattern(unpack(root_files))(fname)
					end,
					settings = {
						basedpyright = {
							analysis = {
								diagnosticMode = "openFilesOnly",
								typeCheckingMode = "standard",
								reportMissingImports = "error",
								reportMissingTypeStubs = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
			},
		},
	},
}
