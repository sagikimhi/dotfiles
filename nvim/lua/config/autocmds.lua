-- ----------------------------------------------------------------------------
-- LSP and Diagnostic Options
-- ----------------------------------------------------------------------------

-- vim.api.nvim_create_autocmd({ "LspAttach" }, {
-- 	pattern = { "*" },
-- 	callback = function(_)
-- 		vim.diagnostic.config({
-- 			severity_sort = true,
-- 			update_in_insert = true,
-- 			virtual_text = {
-- 				severity = vim.diagnostic.severity.ERROR,
-- 				source = true,
-- 			},
-- 			float = {
-- 				style = "minimal",
-- 				source = "if_many",
-- 				border = "rounded",
-- 				severity_sort = true,
-- 			},
-- 		})
-- 	end,
-- })

vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuOpen',
    callback = function()
    require("copilot.suggestion").dismiss()
    vim.b.copilot_suggestion_hidden = true
    end,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuClose',
    callback = function()
    vim.b.copilot_suggestion_hidden = false
    end,
})
