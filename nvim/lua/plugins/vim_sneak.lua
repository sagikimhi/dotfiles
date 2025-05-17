return {
	{
		"justinmk/vim-sneak",
		keys = function()
			return {
				{ "f", "<Plug>Sneak_f", mode = { "n" } },
				{ "F", "<Plug>Sneak_F", mode = { "n" } },
			}
		end,
		config = function()
			require("sneak").setup({})
		end,
	},
}
