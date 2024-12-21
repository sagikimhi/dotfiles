-- -----------------------------------------------------------------------------
-- Mason LSP Config - Must come before lspconfig
-- -----------------------------------------------------------------------------

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'lua_ls', 'rust_analyzer' },
    handlers = {

        -- Function for setting up default handlers, i.e. an lsp with no custom
        -- handler defined explicitly.

        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        --
        -- postgres_lsp = function()
        --     -- local util = require('lspconfig.util')
        --     -- local lspconfig = require('lspconfig')
        --     require('lspconfig').postgres_lsp = {
        --         default_config = {
        --             name = 'postgres_lsp',
        --             cmd = { 'postgres_lsp' },
        --             filetypes = { 'sql' },
        --             single_file_support = true,
        --             root_dir = require('lspconfig.util').root_pattern('root-file.txt'),
        --         },
        --     }
        --     -- lspconfig.postgres_lsp.setup { force_setup = true }
        -- end,

        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = { vim.env.VIMRUNTIME },
                        },
                    },
                },
            })
        end,
    }
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)

-- -----------------------------------------------------------------------------
-- Cmp Mappings
-- -----------------------------------------------------------------------------

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Esc>']     = cmp.mapping.close(),
        ['<Up>']      = cmp.mapping.select_prev_item(cmp_select),
        ['<Down>']    = cmp.mapping.select_next_item(cmp_select),
        ['<Left>']    = cmp.mapping.abort(),
        ['<Right>']   = cmp.mapping.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        ['<Enter>']   = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        ['<C-Enter>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
        }),
        ['<C-Space>'] = cmp.mapping(function(_)
            if not cmp.visible() then
                cmp.mapping.complete()
            elseif not cmp.visible_docs() then
                cmp.mapping.open_docs()
            else
                cmp.mapping.close_docs()
            end
        end, { 'i', 'c' }),
        -- navigate to the next snippet placeholder
        ['<C-w>']     = cmp.mapping(function(fallback)
            local snip = require('luasnip')
            if snip.jumpable(1) then
                snip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        -- navigate to the previous snippet placeholder
        ['<C-b>']     = cmp.mapping(function(fallback)
            local snip = require('luasnip')
            if snip.jumpable(-1) then
                snip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    experimental = {
        ghost_text = true
    },
    view = {
        docs = {
            auto_open = true,
        }
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lsp', group_index = 1 },
        { name = 'buffer',   group_index = 2 },
        { name = 'luasnip',  group_index = 3 },
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
            local n = entry.source.name
            if n == 'nvim_lsp' then
                item.menu = '[LSP]'
            else
                item.menu = string.format('[%s]', n)
            end
            return item
        end,
    },
})

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        header = '',
        prefix = '',
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '»',
        },
    },
})

-- -----------------------------------------------------------------------------
-- Keymap Config
-- -----------------------------------------------------------------------------

local defaults = require('lspconfig').util.default_config

defaults.capabilities = vim.tbl_deep_extend(
    'force',
    defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities(),
    {
        textDocument = {
            foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            },
        }
    }
)

vim.o.signcolumn = 'yes'
vim.o.foldenable = true
vim.o.foldcolumn = '1'
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99

require('ufo').setup({})
require('luasnip.loaders.from_vscode').lazy_load()

vim.keymap.set('n', 'zR', function() require('ufo').openAllFolds() end)
vim.keymap.set('n', 'zM', function() require('ufo').closeAllFolds() end)

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'd]', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', 'd[', function() vim.diagnostic.goto_prev() end, opts)

        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition() end, opts)

        vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', '<F3>', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

        vim.keymap.set('n', '<leader>mk', function() vim.lsp.buf.add_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>rm', function() vim.lsp.buf.remove_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.list_workspace_folders() end, opts)

        vim.keymap.set({ 'n', 'x' }, '<leader>f', function() vim.lsp.buf.format() end,
            opts)

        vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>', opts)
        vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>', opts)
        vim.keymap.set('n', '<leader>gt', '<cmd>Telescope lsp_type_definitions<cr>', opts)
        vim.keymap.set("n", "<leader>vd", "<cmd> Telescope diagnostics<cr>", opts)
        vim.keymap.set("n", "<leader>vs", "<cmd> Telescope lsp_document_symbols<cr>", opts)
        vim.keymap.set('n', '<leader>ws', "<cmd> Telescope lsp_workspace_symbols query=*<cr>", opts)
        vim.keymap.set('n', '<leader>wd', "<cmd> Telescope lsp_dynamic_workspace_symbols<cr>", opts)
    end,
})
