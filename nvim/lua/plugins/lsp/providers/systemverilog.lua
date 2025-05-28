return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", opts = {} },
		ft = "systemverilog",
		opts = {
			handlers = {
				veridian = function(_)
					local uv = vim.uv or vim.loop
					local util = require("lspconfig.util")
					local capabilities = require("blink.cmp").get_lsp_capabilities()

					table.insert(capabilities, {
						general = { positionEncodings = { "utf-16" } },
					})

					require("lspconfig").veridian.setup({
						cmd = { "veridian" },
						filetype = { "systemverilog", "verilog" },
						capabilities = capabilities,
						root_dir = function(fname)
							local cwd = uv.cwd() or "./"
							local filename = ((util.path.is_absolute(fname) and fname) or table.concat({ cwd, fname }))
							return (util.root_pattern(filename) or vim.fs.dirname(filename))
						end,
					})
				end,
			},
		},
	},
}
