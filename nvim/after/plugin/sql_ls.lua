
local util = require('lspconfig.util')
local lspconfig = require('lspconfig')

lspconfig.sqls.setup({
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end,
    filetypes = { 'sql', 'plpgsql' },
    cmd = { "sqls", "--config", "/home/skimhi/.config/sqls/config.yml" },
    root_dir = function(fname)
        return require('lspconfig.util').find_git_ancestor(fname)
        -- return require("lspconfig.util").root_pattern('.sqls.yml')
    end,
    single_file_support = true,
    settings = {
        sqls = {
            connections = {
                {
                    driver = 'postgresql',
                    dataSourceName = ''
                        .. 'host=127.0.0.1'
                        .. ' port=' .. os.getenv("PGPORT")
                        .. ' user=' .. os.getenv("USER")
                        .. ' dbname=' .. os.getenv("USER")
                        .. ' password=' .. '' or os.getenv("PGPASSWORD"),
                },
            },
        },
    },
})

lspconfig.postgres_lsp = {
    default_config = {
        name = 'postgres_lsp',
        cmd = { 'postgres_lsp' },
    filetypes = { 'sql', 'plpgsql' },
        single_file_support = true,
        root_dir = require('lspconfig.util').root_pattern('root-file.txt'),
    },
    force_setup = true
}

