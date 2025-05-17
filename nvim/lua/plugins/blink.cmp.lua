return {
	{
		"saghen/blink.cmp",

		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},

		-- @module blink.cmp
		-- @type blink.cmp.Config
		opts = {

			keymap = {
				preset = "default",
				["<C-h>"] = { "show_signature", "hide_signature" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Left>"] = { "hide", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<Right>"] = { "accept", "fallback" },
				["<Enter>"] = { "accept", "fallback" },
				["<C-space>"] = {
					"show",
					"show_documentation",
					"hide_documentation",
				},
			},

			completion = {
				trigger = {
					prefetch_on_insert = true,
					show_in_snippet = true,
					show_on_keyword = true,
					show_on_trigger_character = true,
					show_on_accept_on_trigger_character = true,
					show_on_insert_on_trigger_character = true,
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
					cycle = {
						from_top = true,
						from_bottom = true,
					},
				},
				accept = {
					dot_repeat = true,
					create_undo_point = true,
					resolve_timeout_ms = 200,
					auto_brackets = { enabled = false },
					timeout_ms = 600,
				},
				ghost_text = {
					enabled = false,
					show_with_menu = false,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					update_delay_ms = 150,
					treesitter_highlighting = true,
					window = {
						min_width = 10,
						max_width = 80,
						max_height = 20,
						border = nil,
						winblend = 0,
						scrollbar = true,
					},
				},
				menu = {
					auto_show = true,
					draw = {
						treesitter = {
							"lsp",
						},
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
							{ "source_name" },
						},
					},
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					sql = { "dadbod" },
					lua = { inherit_defaults = true, "lazydev" },
				},
			},

			providers = {
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
					async = false,
					enabled = true,
					timeout_ms = 2000,
					max_items = nil,
					transform_items = nil,
					should_show_items = true,
					min_keyword_length = 0,
					score_offset = 0,
					override = nil,
				},
				dadbod = { module = "vim_dadbod_completion.blink" },
				lazydev = { ... },
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
					show_on_insert = true,
					show_on_keyword = false,
					show_on_trigger_character = true,
					show_on_insert_on_trigger_character = true,
				},
				window = {
					min_width = 10,
					max_width = 80,
					max_height = 10,
					border = nil,
					winblend = 0,
					scrollbar = true,
					show_documentation = true,
					treesitter_highlighting = true,
				},
			},

			appearance = {
				highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = false,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
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

		opts_extend = {
			"sources.default",
		},
	},
}
