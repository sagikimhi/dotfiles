return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			columns = {
				"icon",
				"permissions",
				"mtime",
				"size",
				"type",
			},
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			win_options = {
				list = true,
				wrap = false,
				spell = false,
				foldcolumn = "0",
				signcolumn = "no",
				conceallevel = 3,
				cursorcolumn = true,
				concealcursor = "nvic",
			},
			extra_scp_args = {},
			delete_to_trash = true,
			constrain_cursor = "editable",
			cleanup_delay_ms = 2000,
			watch_for_changes = true,
			use_default_keymaps = true,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = true,
			git = {
				add = function(...)
					return false
				end,
				mv = function(...)
					return true
				end,
				rm = function(...)
					return false
				end,
			},
			lsp_file_methods = {
				enabled = true,
				timeout_ms = 2000,
				autosave_changes = false,
			},
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = { "actions.close", mode = "n" },
				["<C-l>"] = "actions.refresh",
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, ...)
					local m = name:match("^%.")
					return m ~= nil
				end,
				is_always_hidden = function(...)
					return false
				end,
				natural_order = "fast",
				case_insensitive = false,
				sort = {
					-- sort order can be "asc" or "desc"
					-- see :help oil-columns to see which columns are sortable
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
			float = {
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "none",
				win_options = {
					winblend = 0,
				},
				get_win_title = nil,
				preview_split = "auto",
				override = function(conf)
					return conf
				end,
			},
			preview_win = {
				update_on_cursor_moved = true,
				preview_method = "fast_scratch",
				disable_preview = function(...)
					return false
				end,
				win_options = {},
			},
			-- Configuration for the floating action confirmation window
			confirmation = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				width = nil,
				max_height = 0.9,
				min_height = { 5, 0.1 },
				height = nil,
				win_options = {
					winblend = 0,
				},
			},
			-- Configuration for the floating progress window
			progress = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				width = nil,
				max_height = { 10, 0.9 },
				min_height = { 5, 0.1 },
				height = nil,
				minimized_border = "none",
				win_options = {
					winblend = 0,
				},
			},
			lazy = false,
			keys = function()
				return {
					{ "<C-e>", "<cmd>Oil<cr>", mode = { "n" } },
				}
			end,
			dependencies = { { "echasnovski/mini.icons", opts = {} } },
		},
	},
}
