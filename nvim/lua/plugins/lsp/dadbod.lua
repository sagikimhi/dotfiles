return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{
			"kristijanhusak/vim-dadbod-completion",
			ft = { "sql", "mysql", "plsql", "pgsql", "plpgsql" },
			lazy = true,
		}, -- Optional
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIFindBuffer",
		"DBUIAddConnection",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
	end,
}
