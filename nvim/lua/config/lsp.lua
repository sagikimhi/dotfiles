vim.lsp.config("*", { root_markers = { ".git" } })

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = true,
	virtual_text = {
		severity = vim.diagnostic.severity.ERROR,
		source = true,
	},
	float = {
		style = "minimal",
		source = "if_many",
		border = "rounded",
		severity_sort = true,
	},
	-- signs = {
	-- 	text = {
	-- 		[vim.diagnostic.severity.INFO] = "»",
	-- 		[vim.diagnostic.severity.HINT] = "⚑",
	-- 		[vim.diagnostic.severity.WARN] = "▲",
	-- 		[vim.diagnostic.severity.ERROR] = "✘",
	-- 	},
	-- },
})
