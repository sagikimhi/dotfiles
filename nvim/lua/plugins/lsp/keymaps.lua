return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
		opts = function(opts)
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			local telescope = {
				cmd = function(command)
					command = "Telescope " .. command
					vim.api.nvim_command(command)
				end,
			}
			vim.list_extend(keys, {
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
						telescope.cmd("lsp_dynamic_workspace_symbols")
					end,
					mode = { "n" },
					desc = "Dynamic workspace symbols",
				},
			})
			return opts
		end,
	},
}
