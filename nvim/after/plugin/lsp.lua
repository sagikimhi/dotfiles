-- -----------------------------------------------------------------------------
-- Mason LSP Config - Must come before lspconfig
-- -----------------------------------------------------------------------------

local defaults = require('lspconfig').util.default_config

defaults.capabilities = vim.tbl_deep_extend(
    'force',
    defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities(),
    {
        textDocument = {
            foldingRange = {
                lineFoldingOnly = true,
                dynamicRegistration = true,
            },
        }
    }
)

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
            require('lspconfig')[server_name].setup({
                capabilities = defaults.capabilities,
            })
        end,

        ruff = function()
            require('lspconfig').ruff.setup({
                capabilities = defaults.capabilities,
                init_options = {
                    settings = {
                        fixAll = true,
                        showSyntaxErrors = true,
                        organizeImports = true,
                        lineLength = 80,
                        codeAction = {
                            fixViolation = {
                                enable = true,
                            },
                        },
                        configurationPreference = "filesystemFirst",
                    },
                },
            })
        end,

        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                capabilities = defaults.capabilities,
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

        -- veridian = function()
        --     local util = require('lspconfig.util')
        --     require('lspconfig').veridian.setup({
        --         cmd = { 'veridian' },
        --         root_dir = function(fname)
        --             local filename = (
        --                 (util.path.is_absolute(fname) and fname)
        --                 or util.path.join(vim.loop.cwd(), fname)
        --             )
        --             return (
        --                 util.root_pattern(filename) 
        --                 or util.path.dirname(filename)
        --             )
        --         end
        --     })
        -- end,
    }
})

-- -----------------------------------------------------------------------------
-- Cmp Mappings
-- -----------------------------------------------------------------------------

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    performance = {
        max_view_entries = 999,
    },
    matching = {
        disallow_symbol_nonprefix_matching = false,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Left>']    = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm({
            select = cmp_select,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        ['<Right>']   = cmp.mapping.confirm({
            select = cmp_select,
            behavior = cmp.ConfirmBehavior.Insert,
        }),
        ['<C-Space>'] = cmp.mapping.complete({
            config = {
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }
            }
        }),
        ['<Up>']      = cmp.mapping.select_prev_item(cmp_select),
        ['<Down>']    = cmp.mapping.select_next_item(cmp_select),
        ['<C-Right>'] = cmp.mapping(function(fallback)
            local snip = require('luasnip')
            if snip.jumpable(1) then
                snip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-Left>']  = cmp.mapping(function(fallback)
            local snip = require('luasnip')
            if snip.jumpable(-1) then
                snip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-l>']     = cmp.mapping(function(fallback)
            if cmp.visible() then
                return cmp.complete_common_string()
            end
            fallback()
        end, { 'i', 'c' }),

    }),

    experimental = {
        ghost_text = false
    },

    view = {
        docs = {
            auto_open = true,
        },
        entries = {
            follow_cursor = true,
        }
    },

    window = {
        completion = {
            border = "rounded",
            winblend = 10,
            scrollbar = true,
            col_offset = 3,
            side_padding = 1,
        },
        documentation = {
            border = "rounded",
            winblend = 10,
            scrollbar = true,
            max_width = 80,
            max_height = 20,
            side_padding = 1,
            -- cmp.config.window.bordered(),
        },
    },

    sources = {
        { name = 'nvim_lsp', group_index = 1 },
        { name = 'luasnip',  group_index = 2 },
        { name = 'buffer',   group_index = 3 },
        { name = "filepath", group_index = 4 },
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
            local n = entry.source.name
            if n == 'luasnip' then
                item.menu = '[luasnip]'
            elseif n == 'nvim_lsp' then
                item.menu = '[nvim_lsp]'
            else
                item.menu = string.format('[%s]', n)
            end
            return item
        end,
    },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        wrap = true,
        wrap_at = 79,
        title = "hover",
        style = "minimal",
        border = 'rounded',
    }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        wrap = true,
        wrap_at = 79,
        title = "signature",
        style = "minimal",
        border = 'rounded',
    }
)

vim.lsp.handlers["textDocument/references"] = vim.lsp.with(
    vim.lsp.handlers.references, {
        -- Use location list instead of quickfix list
        wrap = true,
        wrap_at = 79,
        loclist = true,
        title = "hover",
        style = "minimal",
        border = 'rounded',
    }
)

vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = true,
    underline = {
        severity = vim.diagnostic.severity.ERROR
    },
    virtual_text = false,
    -- virtual_text = {
    --     severity = vim.diagnostic.severity.ERROR,
    --     source = "if_many",
    -- },
    float = {
        style = 'minimal',
        source = 'if_many',
        border = 'rounded',
        severity_sort = true,
        header = '',
        prefix = '',
    },
    signs = {
        text = {
            [vim.diagnostic.severity.INFO] = '»',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.ERROR] = '✘',
        },
    },
})

require("luasnip.loaders.from_vscode").lazy_load({
    paths = "~/.config/nvim"
})

-- -----------------------------------------------------------------------------
-- Keymap Config
-- -----------------------------------------------------------------------------

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        if vim.bo.ft == "verilog" or vim.bo.ft == "systemverilog" then
            vim.opt.commentstring = "/*%s*/://%s"
            vim.opt.tabstop = 3
            vim.opt.shiftwidth = 3
            vim.opt.softtabstop = 3
            vim.opt.expandtab = true
            vim.opt.smartindent = true
        end

        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
            local tmp = vim.opt.fo
            vim.opt.fo = ""
            vim.lsp.buf.format()
            vim.opt.fo = tmp
        end, opts)

        vim.keymap.set('n', 'd]', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', 'd[', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', '<F3>', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)

        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', 'H', function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<cr>', opts)

        vim.keymap.set('n', '<leader>ma', function() vim.lsp.buf.add_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>md', function() vim.lsp.buf.remove_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.list_workspace_folders() end, opts)

        vim.keymap.set('n', 'gT', function() vim.lsp.buf.typehierarchy("supertypes") end, opts)
        vim.keymap.set('n', '<leader>gT', function() vim.lsp.buf.typehierarchy("subtypes") end, opts)

        vim.keymap.set('n', 'gci', '<cmd>Telescope lsp_incoming_calls<cr>', opts)
        vim.keymap.set('n', 'gco', '<cmd>Telescope lsp_outgoing_calls<cr>', opts)
        vim.keymap.set("n", "<leader>vd", "<cmd>Telescope diagnostics<cr>", opts)
        vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>', opts)
        vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>', opts)
        vim.keymap.set('n', '<leader>gt', '<cmd>Telescope lsp_type_definitions<cr>', opts)
        vim.keymap.set("n", "<leader>vs", "<cmd>Telescope lsp_document_symbols<cr>", opts)
        vim.keymap.set('n', '<leader>ws', '<cmd>Telescope lsp_workspace_symbols<cr>', opts)
        vim.keymap.set('n', '<leader>wd', "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)
    end,
})
