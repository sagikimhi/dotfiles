-- local trouble = {
-- 	cmd = function(command)
-- 		local panel = " toggle win.position=left"
-- 		command = "Trouble " .. command .. panel
-- 		vim.api.nvim_command(command)
-- 	end,
-- }

-- local telescope = {
-- 	cmd = function(command)
-- 		command = "Telescope " .. command
-- 		vim.api.nvim_command(command)
-- 	end,
-- }

-- vim.api.nvim_create_autocmd({ "LspAttach" }, {
-- 	callback = function(event)
-- 		local opts = { buffer = event.buf }

-- 		if vim.bo.ft == "verilog" or vim.bo.ft == "systemverilog" then
-- 			vim.opt.tabstop = 3
-- 			vim.opt.shiftwidth = 3
-- 			vim.opt.softtabstop = 3
-- 			vim.opt.commentstring = "/*%s*/://%s"
-- 		end

-- 		vim.keymap.set("i", "<C-h>", function()
-- 			vim.lsp.buf.signature_help()
-- 		end, opts)
-- 		vim.keymap.set({ "n", "x" }, "<leader>f", function()
-- 			local tmp = vim.opt.fo
-- 			vim.opt.fo = ""
-- 			vim.lsp.buf.format()
-- 			vim.opt.fo = tmp
-- 		end, opts)

-- 		vim.keymap.set("n", "K", function()
-- 			vim.lsp.buf.hover()
-- 		end, opts)

-- 		vim.keymap.set("n", "H", function()
-- 			vim.lsp.buf.signature_help()
-- 		end, opts)

-- 		vim.keymap.set("n", "d]", function()
-- 			vim.diagnostic.goto_diagnostic(vim.diagnostic.get_next({ float = true }))
-- 		end, opts)

-- 		vim.keymap.set("n", "d[", function()
-- 			vim.diagnostic.goto_diagnostic(vim.diagnostic.get_prev({ float = true }))
-- 		end, opts)

-- 		vim.keymap.set("n", "<F2>", function()
-- 			vim.lsp.buf.rename()
-- 		end, opts)

-- 		vim.keymap.set("n", "<F3>", function()
-- 			vim.lsp.buf.code_action()
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>ca", function()
-- 			vim.lsp.buf.code_action()
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>%", function()
-- 			vim.lsp.buf.add_workspace_folder()
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>rm", function()
-- 			vim.lsp.buf.remove_workspace_folder()
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>ls", function()
-- 			vim.lsp.buf.list_workspace_folders()
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>gt", function()
-- 			vim.lsp.buf.typehierarchy("subtypes")
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>gT", function()
-- 			vim.lsp.buf.typehierarchy("supertypes")
-- 		end, opts)

-- 		vim.keymap.set("n", "gs", function()
-- 			trouble.cmd("symbols")
-- 		end, opts)

-- 		vim.keymap.set("n", "gS", function()
-- 			telescope.cmd("symbols")
-- 		end, opts)
-- 		vim.keymap.set("n", "gd", function()
-- 			trouble.cmd("lsp_definitions")
-- 		end, opts)

-- 		vim.keymap.set("n", "gD", function()
-- 			telescope.cmd("lsp_definitions")
-- 		end, opts)

-- 		vim.keymap.set("n", "gr", function()
-- 			trouble.cmd("lsp_references")
-- 		end, opts)

-- 		vim.keymap.set("n", "gR", function()
-- 			telescope.cmd("lsp_references")
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>vd", function()
-- 			trouble.cmd("diagnostics")
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>vD", function()
-- 			telescope.cmd("diagnostics")
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>t", function()
-- 			telescope.cmd("lsp_type_definitions")
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>gd", function()
-- 			telescope.cmd("lsp_definitions")
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>gr", function()
-- 			telescope.cmd("lsp_references")
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>vs", function()
-- 			telescope.cmd("lsp_document_symbols")
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>ws", function()
-- 			telescope.cmd("lsp_workspace_symbols")
-- 		end, opts)

-- 		vim.keymap.set("n", "<leader>wd", function()
-- 			telescope.cmd("lsp_dynamic_workspace_symbols")
-- 		end, opts)
-- 	end,
-- })
