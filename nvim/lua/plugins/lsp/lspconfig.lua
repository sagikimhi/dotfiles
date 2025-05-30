local util = require('lspconfig.util')

local default_capabilities = require("blink.cmp").get_lsp_capabilities()
table.insert(default_capabilities, {
    general = { positionEncodings = { "utf-16" } },
})

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason.nvim",
            { "mason-org/mason-lspconfig.nvim", opts = {} },
        },
        opts = {
            inlay_hints = { 
                enabled = true,
                exclude = { "python" },
            },
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    enabled = false,
                    spacing = 4,
                    source = "if_many",
                    prefix = "icons",
                },
                severity_sort = true,
            },
            capabilities = default_capabilities,
        },
    }
}
