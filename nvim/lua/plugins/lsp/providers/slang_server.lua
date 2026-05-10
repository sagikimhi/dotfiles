return {
    enabled = false,
    "hudson-trading/slang-server",
    dependencies = {
        "mason.nvim",
        { "mason-org/mason-lspconfig.nvim", opts = {}},
    },
    ft = {"systemverilog", "verilog"},
    opts = {
        servers = {
            slang_server = function(_, opts)
                local util = require("lspconfig.util")
                local configs = require("lspconfig.configs")

                if not configs.slang_server then
                    configs.slang_server = {
                        default_config = {
                            cmd = { "slang-server" },
                            filetypes = {"systemverilog", "verilog"},
                            single_file_support = true,
                            root_dir = function(name)
                                return util.root_pattern(".git", ".slang")(name)
                            end,
                        }
                    }
                end
            end,
        }
    }
}
