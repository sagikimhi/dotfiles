return {
	{
		"saghen/blink.cmp",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local trouble = {
				cmd = function(command)
					local panel = " toggle win.position=left"
					command = "Trouble " .. command .. panel
					vim.api.nvim_command(command)
				end,
			}

			local telescope = {
				cmd = function(command)
					command = "Telescope " .. command
					vim.api.nvim_command(command)
				end,
			}
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("lspconfig").lua_ls.setup({ capabilities = capabilities })
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					if vim.bo.ft == "verilog" or vim.bo.ft == "systemverilog" then
						vim.opt.tabstop = 3
						vim.opt.shiftwidth = 3
						vim.opt.softtabstop = 3
						vim.opt.commentstring = "/*%s*/://%s"
					end

					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, opts)
					vim.keymap.set({ "n", "x" }, "<leader>f", function()
						local tmp = vim.opt.fo
						vim.opt.fo = ""
						vim.lsp.buf.format()
						vim.opt.fo = tmp
					end, opts)

					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, opts)

					vim.keymap.set("n", "H", function()
						vim.lsp.buf.signature_help()
					end, opts)

					vim.keymap.set("n", "d]", function()
						vim.diagnostic.goto_diagnostic(vim.diagnostic.get_next({ float = true }))
					end, opts)

					vim.keymap.set("n", "d[", function()
						vim.diagnostic.goto_diagnostic(vim.diagnostic.get_prev({ float = true }))
					end, opts)

					vim.keymap.set("n", "<F2>", function()
						vim.lsp.buf.rename()
					end, opts)

					vim.keymap.set("n", "<F3>", function()
						vim.lsp.buf.code_action()
					end, opts)

					vim.keymap.set("n", "<leader>ca", function()
						vim.lsp.buf.code_action()
					end, opts)

					vim.keymap.set("n", "<leader>%", function()
						vim.lsp.buf.add_workspace_folder()
					end, opts)

					vim.keymap.set("n", "<leader>rm", function()
						vim.lsp.buf.remove_workspace_folder()
					end, opts)

					vim.keymap.set("n", "<leader>ls", function()
						vim.lsp.buf.list_workspace_folders()
					end, opts)

					vim.keymap.set("n", "<leader>gt", function()
						vim.lsp.buf.typehierarchy("subtypes")
					end, opts)

					vim.keymap.set("n", "<leader>gT", function()
						vim.lsp.buf.typehierarchy("supertypes")
					end, opts)

					vim.keymap.set("n", "gs", function()
						trouble.cmd("symbols")
					end, opts)

					vim.keymap.set("n", "gS", function()
						telescope.cmd("symbols")
					end, opts)
					vim.keymap.set("n", "gd", function()
						trouble.cmd("lsp_definitions")
					end, opts)

					vim.keymap.set("n", "gD", function()
						telescope.cmd("lsp_definitions")
					end, opts)

					vim.keymap.set("n", "gr", function()
						trouble.cmd("lsp_references")
					end, opts)

					vim.keymap.set("n", "gR", function()
						telescope.cmd("lsp_references")
					end, opts)

					vim.keymap.set("n", "<leader>vd", function()
						trouble.cmd("diagnostics")
					end, opts)

					vim.keymap.set("n", "<leader>vD", function()
						telescope.cmd("diagnostics")
					end, opts)

					vim.keymap.set("n", "<leader>t", function()
						telescope.cmd("lsp_type_definitions")
					end, opts)

					vim.keymap.set("n", "<leader>gd", function()
						telescope.cmd("lsp_definitions")
					end, opts)

					vim.keymap.set("n", "<leader>gr", function()
						telescope.cmd("lsp_references")
					end, opts)

					vim.keymap.set("n", "<leader>vs", function()
						telescope.cmd("lsp_document_symbols")
					end, opts)

					vim.keymap.set("n", "<leader>ws", function()
						telescope.cmd("lsp_workspace_symbols")
					end, opts)

					vim.keymap.set("n", "<leader>wd", function()
						telescope.cmd("lsp_dynamic_workspace_symbols")
					end, opts)
				end,
			})
		end,
		opts = {
			enabled = true,

			fuzzy = { implementation = "prefer_rust" },

			keymap = {
				preset = "default",
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Left>"] = { "cancel", "fallback" },
				["<Right>"] = { "accept", "fallback" },
				["<Enter>"] = { "accept", "fallback" },
				["<C-h>"] = { "show_signature", "hide_signature", "fallback" },
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
			},

			cmdline = {
				keymap = {
					preset = "default",
					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },
					["<Left>"] = { "cancel", "fallback" },
					["<Right>"] = { "accept", "fallback" },
					["<Enter>"] = { "accept", "fallback" },
				},
				completion = { menu = { auto_show = true } },
			},

			completion = {
				keyword = { range = "full" },
				list = { selection = { preselect = false, auto_insert = true } },
				trigger = {
					-- When true, will prefetch the completion items when entering insert mode
					prefetch_on_insert = true,

					-- When false, will not show the completion window automatically when in a snippet
					show_in_snippet = true,

					-- When true, will show the completion window after typing any of alphanumerics, `-` or `_`
					show_on_keyword = true,

					-- When true, will show the completion window after typing a trigger character
					show_on_trigger_character = true,

					-- LSPs can indicate when to show the completion window via trigger characters
					-- however, some LSPs (i.e. tsserver) return characters that would essentially
					-- always show the window. We block these by default.
					show_on_blocked_trigger_characters = { " ", "\n", "\t" },
					-- You can also block per filetype with a function:
					-- show_on_blocked_trigger_characters = function(ctx)
					--   if vim.bo.filetype == 'markdown' then return { ' ', '\n', '\t', '.', '/', '(', '[' } end
					--   return { ' ', '\n', '\t' }
					-- end,

					-- When both this and show_on_trigger_character are true, will show the completion window
					-- when the cursor comes after a trigger character when entering insert mode
					show_on_insert_on_trigger_character = true,

					-- When both this and show_on_trigger_character are true, will show the completion window
					-- when the cursor comes after a trigger character after accepting an item
					show_on_accept_on_trigger_character = true,

					-- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
					-- the completion window when the cursor comes after a trigger character when
					-- entering insert mode/accepting an item
					show_on_x_blocked_trigger_characters = { "'", '"', "(" },
					-- or a function, similar to show_on_blocked_trigger_character
				},
				accept = {
					auto_brackets = { enabled = true },
					resolve_timeout_ms = 100,
					create_undo_point = true,
					dot_repeat = true,
					timeout_ms = 400,
				},
			},

			menu = {
				auto_show = true,
				ghost_text = { enabled = true },
				documentation = { auto_show = true, auto_show_delay_ms = 100 },
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},

			sources = {
				default = {
					"lazydev",
					"lsp",
					"snippet",
					"path",
					"buffer",
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},

			snippets = { preset = "luasnip" },

			signature = { enabled = true },

			appearance = {
				nerd_font_variant = "normal",
				use_nvim_cmp_as_default = true,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "saghen/blink.cmp" },
			{ "folke/lazydev.nvim" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "kevinhwang91/promise-async" },
			{ "kevinhwang91/nvim-ufo" },
		},
	},
	{ "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
	-- { "hrsh7th/cmp-emoji" },
	-- { "hrsh7th/cmp-path" },
	-- { "hrsh7th/cmp-buffer" },
	-- { "hrsh7th/cmp-cmdline" },
	-- { "hrsh7th/cmp-nvim-lua" },
	-- { "hrsh7th/cmp-nvim-lsp" },
	-- { "saadparwaiz1/cmp_luasnip" },
}
