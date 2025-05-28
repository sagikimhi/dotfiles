return {
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = {
				require("nvim-treesitter.install").update({ with_sync = true }),
			}
			ts_update()
		end,

		opts = {
			ensure_installed = {
				"c",
				"go",
				"rust",
				"vimdoc",
				"vim",
				"bash",
				"html",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"yaml",
				"css",
				"latex",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
		},
	},
	{ "nvim-treesitter/playground" },
	{ "nvim-treesitter/nvim-treesitter-context" },
}
