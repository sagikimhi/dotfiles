return {
	-- CamelCase and snake_case motion
	{
		"chrisgrieser/nvim-spider",
		opts = {
			lazy = true,
			customPatterns = {},
			subwordMovement = true,
			consistentOperatorPending = true, -- see "Consistent Operator-pending Mode" in the README
			skipInsignificantPunctuation = true,
		},
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
