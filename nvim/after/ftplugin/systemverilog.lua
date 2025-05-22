local lsp = require('lspconfig')
local util = require('lspconfig.util')
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.tbl_deep_extend("force", capabilities, {
    general = { positionEncodings = { "utf-16" } },
})

lsp.veridian.setup({
    cmd = { 'veridian' },
    filetype = { "systemverilog", "verilog" }
    root_dir = function(fname)
        local filename = (
            (util.path.is_absolute(fname) and fname)
            or util.path.join(vim.loop.cwd(), fname)
        )
        return (
            util.root_pattern(filename)
            or util.path.dirname(filename)
        )
    end,
    capabilities = capabilities,
})
