return {
	{
		"saghen/blink.cmp",

		version = "1.*",

		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				opts = function(opts)
					require("luasnip.loaders.from_vscode").load({
						paths = {
							-- vim.fn.stdpath("config"),
							vim.fn.stdpath("config") .. "/snippets",
						},
					})
					return opts
				end,
			},
		},

		opts_extend = {
			"sources.default",
		},

		-- @module blink.cmp
		-- @type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<C-h>"] = { "show_signature", "hide_signature" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Left>"] = { "hide", "fallback" },
				["<Right>"] = { "accept", "fallback" },
				["<Enter>"] = { "accept", "fallback" },
				["<S-Enter>"] = { "accept_and_enter", "fallback_to_mappings" },
				["<C-Space>"] = {
					function(cmp)
						cmp.show({ providers = { "snippets", "lsp" } })
					end,
					"show_documentation",
					"hide_documentation",
				},
				["<S-Space>"] = {
					function(cmp)
						cmp.show({ providers = { "snippets", "lsp", "path", "buffer" } })
					end,
				},
			},

			snippets = { preset = "luasnip" },

			completion = {
				keyword = { range = "full" },
				trigger = {
					show_in_snippet = true,
					show_on_keyword = true,
					prefetch_on_insert = true,
					show_on_trigger_character = true,
					show_on_accept_on_trigger_character = true,
					show_on_insert_on_trigger_character = true,
				},
				list = {
					max_items = 500,
					selection = {
						preselect = false,
						auto_insert = false,
					},
					cycle = {
						from_bottom = true,
						from_top = true,
					},
				},
				accept = {
					dot_repeat = true,
					create_undo_point = true,
					resolve_timeout_ms = 200,
					auto_brackets = {
						enabled = true,
						default_brackets = { "(", ")" },
						override_brackets_for_filetypes = {},
						kind_resolution = {
							enabled = true,
							blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
						},
						semantic_token_resolution = {
							enabled = true,
							blocked_filetypes = { "java" },
							timeout_ms = 400,
						},
					},
				},
				ghost_text = {
					enabled = true,
					show_with_menu = true,
					show_without_menu = true,
					show_with_selection = true,
					show_without_selection = false,
				},
				documentation = {
					auto_show = true,
					update_delay_ms = 50,
					auto_show_delay_ms = 150,
					treesitter_highlighting = true,
					draw = function(opts)
						opts.default_implementation()
					end,
					window = {
						border = "rounded",
						scrollbar = false,
						min_width = 30,
						max_width = 80,
						max_height = 20,
						direction_priority = {
							menu_north = { "e", "w", "n", "s" },
							menu_south = { "e", "w", "s", "n" },
						},
					},
				},
				menu = {
					enabled = true,
					border = "rounded",
					scrolloff = 2,
					scrollbar = true,
					min_width = 15,
					max_height = 10,
					auto_show = true,
					direction_priority = { "s", "n" },
					cmdline_position = function()
						local pos
						local height

						if vim.g.ui_cmdline_pos ~= nil then
							pos = vim.g.ui_cmdline_pos
							return { pos[1] - 1, pos[2] }
						end

						if vim.o.cmdheight == 0 then
							height = 1
						else
							height = vim.o.cmdheight
						end

						return { vim.o.lines - height, 0 }
					end,
					draw = {
						align_to = "label",
						padding = 1,
						gap = 1,
						cursorline_priority = 10000,
						treesitter = { "lsp" },
						columns = {
							{ "item_idx" },
							{ "label" },
							{ "kind_icon" },
							{ "kind" },
							{ "source_name" },
						},
						components = {
							item_idx = {
								text = function(ctx)
									return tostring(ctx.idx)
								end,
								-- highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
							},
						},
					},
				},
			},

			cmdline = {
				keymap = {
					["<Tab>"] = { "show", "accept" },
					["<Enter>"] = { "accept", "fallback" },
				},
				completion = {
					menu = {
						auto_show = function(ctx)
							return vim.fn.getcmdtype() == ":" or vim.fn.getcmdtype() == "@"
						end,
					},
				},
			},

			sources = {
				transform_items = function(_, items)
					return items
				end,
				min_keyword_length = 0,
				per_filetype = {
					sql = { "dadbod" },
					lua = { inherit_defaults = true, "lazydev" },
				},
				providers = {
					lsp = {
						name = "LSP",
						module = "blink.cmp.sources.lsp",
						fallbacks = { "buffer" },
						transform_items = function(_, items)
							return vim.tbl_filter(function(item)
								return item.kind ~= require("blink.cmp.types").CompletionItemKind.Text
							end, items)
						end, -- Function to transform the items before they're returned
						opts = {},
						-- NOTE: All of these options may be functions to get dynamic behavior
						--- See the type definitions for more information
						async = false, -- Whether we should show the completions before this provider returns, without waiting for it
						enabled = true, -- Whether or not to enable the provider
						max_items = nil, -- Maximum number of items to display in the menu
						timeout_ms = 1000, -- How long to wait for the provider to return before showing completions and treating it as asynchronous
						should_show_items = true, -- Whether or not to show the items
						min_keyword_length = 0, -- Minimum number of characters in the keyword to trigger the provider
						-- If this provider returns 0 items, it will fallback to these providers.
						-- If multiple providers fallback to the same provider, all of the providers must return 0 items for it to fallback
						score_offset = 3, -- Boost/penalize the score of the items
						override = nil, -- Override the source's functions
					},

					dadbod = { module = "vim_dadbod_completion.blink" },

					lazydev = { ... },

					snippets = {
						module = "blink.cmp.sources.snippets",
						score_offset = -1,
						opts = {
							use_show_condition = true,
							show_autosnippets = true,
							-- friendly_snippets = true,
							-- global_snippets = { "all" },
							-- extended_filetypes = {},
							-- ignored_filetypes = {},
							-- get_filetype = function(_)
							-- 	return vim.bo.filetype
							-- end,
							-- -- Set to '+' to use the system clipboard, or '"' to use the unnamed register
							-- clipboard_register = '"',
						},
					},

					path = {
						module = "blink.cmp.sources.path",
						score_offset = 3,
						fallbacks = { "buffer" },
						opts = {
							trailing_slash = true,
							label_trailing_slash = true,
							get_cwd = function(context)
								return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
							end,
							show_hidden_files_by_default = false,
							-- Treat `/path` as starting from the current working directory (cwd) instead of the root of your filesystem
							ignore_root_slash = false,
						},
					},

					buffer = {
						module = "blink.cmp.sources.buffer",
						score_offset = -5,
						opts = {
							-- default to all visible buffers
							get_bufnrs = function()
								return vim.iter(vim.api.nvim_list_wins())
									:map(function(win)
										return vim.api.nvim_win_get_buf(win)
									end)
									:filter(function(buf)
										return vim.bo[buf].buftype ~= "nofile"
									end)
									:totable()
							end,
							-- buffers when searching with `/` or `?`
							get_search_bufnrs = function()
								return { vim.api.nvim_get_current_buf() }
							end,
						},
					},

					cmdline = {
						module = "blink.cmp.sources.cmdline",
						-- Disable shell commands on windows, since they cause neovim to hang
						enabled = function()
							return vim.fn.has("win32") == 0
								or vim.fn.getcmdtype() ~= ":"
								or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
						end,
					},
					omni = {
						module = "blink.cmp.sources.complete_func",
						enabled = function()
							return vim.bo.omnifunc ~= "v:lua.vim.lsp.omnifunc"
						end,
						---@type blink.cmp.CompleteFuncOpts
						opts = {
							complete_func = function()
								return vim.bo.omnifunc
							end,
						},
					},
				},
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
				use_frecency = true,
				use_proximity = true,
				sorts = {
					"exact",
					"score",
					"sort_text",
				},
				prebuilt_binaries = {
					download = true,
				},
			},

			signature = {
				enabled = true,
				trigger = {
					enabled = true,
					show_on_insert = false,
					show_on_keyword = false,
					show_on_trigger_character = true,
					show_on_insert_on_trigger_character = false,
				},
				window = {
					border = "rounded",
					scrollbar = false,
					min_width = 10,
					max_width = 80,
					max_height = 20,
					show_documentation = true,
					treesitter_highlighting = true,
				},
			},

			appearance = {
				highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				-- use_nvim_cmp_as_default = false,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
				kind_icons = {
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",
					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",
					Class = "󱡠",
					Interface = "󱡠",
					Struct = "󱡠",
					Module = "󰅩",
					Unit = "󰪚",
					Value = "󰦨",
					Enum = "󰦨",
					EnumMember = "󰦨",
					Keyword = "󰻾",
					Constant = "󰏿",
					Snippet = "󱄽",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "󰉋",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
				},
			},
		},
	},
}
