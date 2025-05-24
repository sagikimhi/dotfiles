return {
	{
		"neovim/nvim-lspconfig",
		opts = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			local telescope = {
				cmd = function(command)
					command = "Telescope " .. command
					vim.api.nvim_command(command)
				end,
			}

			vim.list_extend(keys, {

				{
					"<F2>",
					function()
						vim.lsp.buf.rename()
					end,
					mode = { "n" },
				},

				{
					"<leader>gt",
					function()
						vim.lsp.buf.typehierarchy("subtypes")
					end,
					mode = { "n" },
				},

				{
					"<leader>gT",
					function()
						vim.lsp.buf.typehierarchy("supertypes")
					end,
					mode = { "n" },
				},

				{
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
					"gS",
					function()
						telescope.cmd("symbols")
					end,
					mode = { "n" },
					desc = "LSP Symbols",
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
					"gD",
					function()
						telescope.cmd("lsp_definitions")
					end,
					mode = { "n" },
					desc = "Goto Definition",
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
					"gR",
					function()
						telescope.cmd("lsp_references")
					end,
					mode = { "n" },
					desc = "References",
				},

				{
					"<leader>vd",
					function()
						Snacks.picker.diagnostics()
					end,
					mode = { "n" },
					desc = "Diagnostics",
					has = "diagnostics",
				},

				{
					"<leader>vD",
					function()
						telescope.cmd("diagnostics")
					end,
					mode = { "n" },
					desc = "Diagnostics",
				},

				{
					"<leader>t",
					function()
						telescope.cmd("lsp_type_definitions")
					end,
					mode = { "n" },
					desc = "Type definitions",
				},

				{
					"<leader>vs",
					function()
						telescope.cmd("lsp_document_symbols")
					end,
					mode = { "n" },
					desc = "Document Symbols",
				},

				{
					"<leader>ws",
					function()
						telescope.cmd("lsp_workspace_symbols")
					end,
					mode = { "n" },
					desc = "Workspace Symbols",
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
		end,
	},
}
