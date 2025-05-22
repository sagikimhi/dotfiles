return {
	"ThePrimeagen/harpoon",
	keys = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		return {
			{ "<leader>a", mark.add_file, mode = { "n" } },
			{ "<C-q>", ui.toggle_quick_menu, mode = { "n" } },
			{
				"<leader>1",
				function()
					ui.nav_file(1)
				end,
				mode = { "n" },
			},
			{
				"<leader>2",
				function()
					ui.nav_file(2)
				end,
				mode = { "n" },
			},
			{
				"<leader>3",
				function()
					ui.nav_file(3)
				end,
				mode = { "n" },
			},
			{
				"<leader>4",
				function()
					ui.nav_file(4)
				end,
				mode = { "n" },
			},
			{
				"<leader>5",
				function()
					ui.nav_file(5)
				end,
				mode = { "n" },
			},
			{
				"<leader>6",
				function()
					ui.nav_file(6)
				end,
				mode = { "n" },
			},
			{
				"<leader>7",
				function()
					ui.nav_file(7)
				end,
				mode = { "n" },
			},
			{
				"<leader>8",
				function()
					ui.nav_file(8)
				end,
				mode = { "n" },
			},
			{
				"<leader>9",
				function()
					ui.nav_file(9)
				end,
				mode = { "n" },
			},
		}
	end,
}
