return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		opt = { enable_get_fold_virt_text = true },
		-- keys = function()
		-- 	local function openAllFolds()
		-- 		require("ufo").openAllFolds()
		-- 	end

		-- 	local function closeAllFolds()
		-- 		require("ufo").closeAllFolds()
		-- 	end

		-- 	local function goNextClosedFold()
		-- 		require("ufo").goNextClosedFold()
		-- 	end

		-- 	local function goPreviousClosedFold()
		-- 		require("ufo").goPreviousClosedFold()
		-- 	end

		-- 	local function goNextClosedAndPeek()
		-- 		require("ufo").goNextClosedFold()
		-- 		require("ufo").peekFoldedLinesUnderCursor()
		-- 	end

		-- 	local function goPreviousClosedAndPeek()
		-- 		require("ufo").goPreviousClosedFold()
		-- 		require("ufo").peekFoldedLinesUnderCursor()
		-- 	end

		-- 	local function peekOrHover()
		-- 		local winid = require("ufo").peekFoldedLinesUnderCursor()
		-- 		if winid then
		-- 			local bufnr = vim.api.nvim_win_get_buf(winid)
		-- 			local keys = { "a", "i", "o", "A", "I", "O", "gd", "gr" }
		-- 			for _, k in ipairs(keys) do
		-- 				-- Add a prefix key to fire `trace` action,
		-- 				-- if Neovim is 0.8.0 before, remap yourself
		-- 			end
		-- 		else
		-- 			-- nvimlsp
		-- 			vim.lsp.buf.hover()
		-- 		end
		-- 	end

		-- 	return {
		-- 		{
		-- 			"]]",
		-- 			goNextClosedFold(),
		-- 			mode = { "n" },
		-- 		},
		-- 		{
		-- 			"z]",
		-- 			goNextClosedAndPeek(),
		-- 			mode = { "n" },
		-- 		},
		-- 		{
		-- 			"<C-]>",
		-- 			goNextClosedAndPeek(),
		-- 			mode = { "n" },
		-- 		},
		-- 		{
		-- 			"[[",
		-- 			goPreviousClosedFold(),
		-- 			mode = { "n" },
		-- 		},
		-- 		{
		-- 			"z[",
		-- 			goPreviousClosedAndPeek(),
		-- 			mode = { "n" },
		-- 		},
		-- 		{
		-- 			"<C-[>",
		-- 			goPreviousClosedAndPeek(),
		-- 			mode = { "n" },
		-- 		},
		-- 		{
		-- 			"zK",
		-- 			peekOrHover(),
		-- 			mode = { "n" },
		-- 		},
		-- 		{
		-- 			"zR",
		-- 			openAllFolds(),
		-- 			mode = { "n" },
		-- 		},
		-- 		{
		-- 			"zM",
		-- 			closeAllFolds(),
		-- 			mode = { "n" },
		-- 		},
		-- 	}
		-- end,
	},
}
