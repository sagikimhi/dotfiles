local util = require('lspconfig.util')

local root_files = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
}

return {
    {
        "neovim/nvim-lspconfig",
        ft = "python",
        dependencies = {
            "mason.nvim",
            { "mason-org/mason-lspconfig.nvim", opts = {} },
        },
        opts = {
            servers = {
                basedpyright = {
                    cmd = { 'basedpyright-langserver', '--stdio' },
                    single_file_support = true,
                    filetypes = { 'python' },
                    root_dir = function(fname)
                        return util.root_pattern(unpack(root_files))(fname)
                    end,
                    settings = {
                        basedpyright = {
                            analysis = {
                                exclude = {
                                    ".git",
                                    "dist",
                                    "**/.ruff_cache",
                                    "**/.pytest_cache",
                                    "**/.gitignore",
                                    "**/__pycache__",
                                    "**/*.eggs",
                                    "**/*.pyc",
                                    "**/*.pyd",
                                },
                                pythonVersion = "3.12",
                                pythonPlatform = "All",
                                autoSearchPaths = true,
                                diagnosticMode = "openFilesOnly",
                                typeCheckingMode = "standard",
                                reportMissingImports = "error",
                                autoImportCompletions = true,
                                useLibraryCodeForTypes = true,
                            },
                        },
                    },
                },
            },
        },

        keys = {
            { "<leader>-", [[mzyyp^v$r-`zzzzv]], mode = { "n", "x" } },
        },
    },
}
