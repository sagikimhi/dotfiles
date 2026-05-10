return {
	{
		"catppuccin/nvim",
		opts = {
			term_colors = true,
		},
	},
	{ "dracula/vim" },
	{ "shaunsingh/nord.nvim" },
	{ "alexvzyl/nordic.nvim" },
	{ "rmehri01/onenord.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "folke/tokyonight.nvim" },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			if vim.fn.has("termguicolors") then
				vim.o.termguicolors = true
			end
			vim.g.gruvbox_material_background = "soft"
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_cursor = "purple"
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_transparent_background = false
		end,
		opts = {},
	},
	{ "eldritch-theme/eldritch.nvim" },
	{ "olivercederborg/poimandres.nvim" },
	{ "marko-cerovac/material.nvim" },
	{ "bluz71/vim-nightfly-colors" },
	{ "projekt0n/github-nvim-theme" },
	{ "sainnhe/everforest" },
	{ "scottmckendry/cyberdream.nvim" },
	{ "olimorris/onedarkpro.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine",
		},
	},
}
