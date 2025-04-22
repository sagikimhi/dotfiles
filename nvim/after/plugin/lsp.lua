-- -----------------------------------------------------------------------------
-- n = {type = split, position=left}
-- Mason LSP Config - Must come before lspconfig
-- -----------------------------------------------------------------------------


local trouble = {}
local meths = require('vim.lsp.protocol').Methods
local defaults = require('lspconfig').util.default_config

defaults.capabilities = vim.tbl_deep_extend(
    'force',
    defaults.capabilities,
    {
        general = {
            positionEncodings = { "utf-16" },
        },
        textDocument = {
            foldingRange = {
                lineFoldingOnly = true,
                dynamicRegistration = true,
            },
        },
    }
)
defaults.capabilities = vim.tbl_deep_extend(
    'force',
    defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

require('mason').setup({
    ui = {
        icons = {
            package_pending = "➜",
            package_installed = "✓",
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
                -- capabilities = defaults.capabilities,
            })
        end,

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

-- -----------------------------------------------------------------------------
-- Cmp Mappings
-- -----------------------------------------------------------------------------

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    enabled = true,
    matching = {
        disallow_fuzzy_matching = false,
        disallow_prefix_matching = false,
        disallow_prefix_unmatching = false,
        disallow_fullfuzzy_matching = true,
        disallow_nonprefix_matching = false,
        disallow_partial_fuzzy_matching = false,
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
                    { name = 'nvim_lsp', group_index = 1 },
                    { name = 'luasnip',  group_index = 2 },
                    { name = 'filepath', group_index = 3 },
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
    },

    window = {
        completion = {
            border = "rounded",
            winblend = 10,
            scrollbar = true,
            col_offset = 3,
            max_height = 50,
            side_padding = 1,
        },
        documentation = {
            border = "rounded",
            winblend = 10,
            scrollbar = true,
            max_width = 80,
            max_height = 50,
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
        expandable_indicator = true,
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

vim.lsp.config('*', { root_markers = { ".git" } })

vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = true,
    underline = {
        severity = vim.diagnostic.severity.ERROR
    },
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR,
        source = true
    },
    -- virtual_text = {
    --     severity = vim.diagnostic.severity.ERROR,
    --     source = "if_many",
    -- },
    float = {
        style = 'minimal',
        source = 'if_many',
        border = 'rounded',
        severity_sort = true,
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

vim.lsp.handlers[meths.textDocument_hover] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        scrollbar = true,
        wrap = true,
        winblend = 10,
        title = "Signature",
        border = "rounded",
        wrap_at = 79,
        max_width = 80,
        max_height = 50,
        side_padding = 1,
    }
)

vim.lsp.handlers[meths.textDocument_signatureHelp] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        scrollbar = true,
        wrap = true,
        winblend = 10,
        title = "Signature",
        border = "rounded",
        wrap_at = 79,
        max_width = 80,
        max_height = 50,
        side_padding = 1,
    }
)

require("luasnip.loaders.from_vscode").lazy_load({
    paths = "~/.config/nvim"
})

-- -----------------------------------------------------------------------------
-- Keymap Config
-- -----------------------------------------------------------------------------


function trouble.sidebar_cmd(command, opts)
    local panel = " toggle win.position=left"
    local resize = "vertical resize 50"
    command = "Trouble " ..  command .. panel
    vim.api.nvim_command(command)
    vim.api.nvim_command(resize)
end

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

        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', 'H', function() vim.lsp.buf.signature_help() end, opts)

        vim.keymap.set('n', 'd]', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', 'd[', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', '<F3>', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)

        vim.keymap.set('n', '<leader>%', function() vim.lsp.buf.add_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>rm', function() vim.lsp.buf.remove_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.list_workspace_folders() end, opts)

        vim.keymap.set('n', '<leader>gt', function() vim.lsp.buf.typehierarchy("subtypes") end, opts)
        vim.keymap.set('n', '<leader>gT', function() vim.lsp.buf.typehierarchy("supertypes") end, opts)

        vim.keymap.set('n', 'gd', function(opts) trouble.sidebar_cmd('lsp_definitions', opts) end, opts)
        vim.keymap.set('n', 'gD', '<cmd>Telescope lsp_definitions<cr>', opts)
        vim.keymap.set('n', 'gr', function(opts) trouble.sidebar_cmd('lsp_references', opts) end, opts)
        vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<cr>', opts)
        vim.keymap.set("n", "<leader>vD", "<cmd>Telescope diagnostics<cr>", opts)
        vim.keymap.set('n', 'gr', function(opts) trouble.sidebar_cmd('lsp_references', opts) end, opts)
        vim.keymap.set("n", "<leader>vd", function(opts) trouble.sidebar_cmd('diagnostics', opts) end, opts)
        vim.keymap.set('n', '<leader>t', '<cmd>Telescope lsp_type_definitions<cr>', opts)
        vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>', opts)
        vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>', opts)
        vim.keymap.set("n", "<leader>vs", "<cmd>Telescope lsp_document_symbols<cr>", opts)
        vim.keymap.set('n', '<leader>ws', '<cmd>Telescope lsp_workspace_symbols<cr>', opts)
        vim.keymap.set('n', '<leader>wd', "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)
    end,
})

-- ruff = function()
--     require('lspconfig').ruff.setup({
--         capabilities = defaults.capabilities,
--         filetypes = { 'python' },
--         root_dir = function(fname)
--             local util = require('lspconfig.util')
--             return util.root_pattern('pyproject.toml', 'ruff.toml', '.ruff.toml')(fname)
--                 or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
--         end,
--         single_file_support = true,
--         settings = {
--             enable = true,
--             fixAll = true,
--             lineLength = 79,
--             organizeImports = false,
--             showSyntaxErrors = true,
--             configurationPreference = "filesystemFirst",
--             codeAction = {
--                 fixViolation = { enable = true },
--                 disableRuleComment = { enable = true },
--             },
--             lint = {
--                 select = {
--                     "A",
--                     "B",
--                     "C4",
--                     "D",
--                     "E",
--                     "F",
--                     "N",
--                     "W",
--                     "DJ",
--                     "PT",
--                     "EM",
--                     "UP",
--                     "NPY",
--                     "ISC",
--                     "ICN",
--                     "SIM",
--                     "RUF",
--                     "PERF",
--                     "ASYNC",
--                 },
--                 ignore = {
--                     "C408",
--                     "D100",
--                     "D101",
--                     "D102",
--                     "D103",
--                     "D104",
--                     "D105",
--                     "D205",
--                     "UP031",
--                     "RUF022",
--                     "ASYNC110",
--                 },
--             },
--         }
--     })
-- end,

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
