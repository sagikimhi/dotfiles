return {
	-- CamelCase and snake_case motion
	{
		"chrisgrieser/nvim-spider",
		config = function()
			require("spider").setup({
				lazy = true,
				dependencies = {
					"theHamsta/nvim_rocks",
					build = "uv tool install hererocks && hererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
					config = function()
						require("nvim_rocks").ensure_installed("luautf8")
					end,
				},
				customPatterns = {},
				subwordMovement = true,
				consistentOperatorPending = true, -- see "Consistent Operator-pending Mode" in the README
				skipInsignificantPunctuation = true,
			})
		end,
		keys = function()
			local spider = require("spider")
			return {
				{
					"w",
					function()
						spider.motion("w")
					end,
					mode = { "n", "o", "x" },
					desc = "Spider-w",
				},
				{
					"e",
					function()
						spider.motion("e")
					end,
					mode = { "n", "o", "x" },
					desc = "Spider-e",
				},
				{
					"b",
					function()
						spider.motion("b")
					end,
					mode = { "n", "o", "x" },
					desc = "Spider-b",
				},
			}
		end,
	},
}
