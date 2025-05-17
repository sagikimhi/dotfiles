return {
	{
		"justinmk/vim-sneak",

		config = function()
			require("sneak").setup({})
		end,

		keys = function()
			return {
				{ "f", "<Plug>Sneak_f", mode = { "n" } },
				{ "F", "<Plug>Sneak_F", mode = { "n" } },
			}
		end,
	},
}
