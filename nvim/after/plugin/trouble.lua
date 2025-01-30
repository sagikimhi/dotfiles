local leftpanel = ' toggle win = {type = split, position=left}<cr>'
vim.keymap.set("n", "gs", ":Trouble symbols"..leftpanel, {desc = "Symbols (Trouble)"})
vim.keymap.set("n", "gd", ":Trouble lsp"..leftpanel, {desc = "LSP Definitions / references / ... (Trouble)"})
vim.keymap.set("n", "<leader>qf", "<cmd>Trouble diagnostics<cr><cmd>vertical resize 50<cr>" .. leftpanel, {desc = "Diagnostics (Trouble)"} )
