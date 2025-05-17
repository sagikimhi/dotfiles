return {}

-- local meths = vim.lsp.protocol.Methods
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- vim.tbl_deep_extend('force', capabilities, {
--     general = {
--         positionEncodings = { "utf-16" },
--     },
--     textDocument = {
--         foldingRange = {
--             lineFoldingOnly = true,
--             dynamicRegistration = true,
--         },
--     }
-- })
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- -- -----------------------------------------------------------------------------
-- -- Cmp Setup
-- -- -----------------------------------------------------------------------------

-- local cmp = require('cmp')
-- local snip = require('luasnip')
-- local compare = cmp.config.compare
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- cmp.setup({
--     enabled = true,

--     view = { docs = { auto_open = true, }, },

--     experimental = { ghost_text = false },

--     window = {
--         completion = {
--             border = "rounded",
--             winblend = 10,
--             scrollbar = true,
--             col_offset = 3,
--             max_height = 50,
--             side_padding = 1,
--         },
--         documentation = {
--             border = "rounded",
--             winblend = 10,
--             scrollbar = true,
--             max_width = 79,
--             max_height = 60,
--             side_padding = 1,
--             -- cmp.config.window.bordered(),
--         },
--     },

--     snippet = {
--         expand = function(args)
--             require('luasnip').lsp_expand(args.body)
--         end,
--     },

--     sources = {
--         { name = 'jupynium', group_index = 1, priority = 100 },
--         { name = 'nvim_lsp', group_index = 2, priority = 99 },
--         { name = 'luasnip',  group_index = 3, priority = 98 },
--         { name = 'buffer',   group_index = 4, priority = 97 },
--         { name = "filepath", group_index = 5, priority = 96 },
--     },

--     sorting = {
--         priority_weight = 1.0,
--         comparators = {
--             compare.score,
--             compare.recently_used,
--             compare.locality,
--         },
--     },

--     mapping = cmp.mapping.preset.insert({
--         ['<Left>']    = cmp.mapping.abort(),
--         ['<CR>']      = cmp.mapping.confirm({
--             select = false,
--             behavior = cmp.ConfirmBehavior.Replace,
--         }),
--         ['<Right>']   = cmp.mapping.confirm({
--             select = false,
--             behavior = cmp.ConfirmBehavior.Insert,
--         }),
--         ['<C-Space>'] = cmp.mapping.complete({
--             config = {
--                 sources = {
--                     { name = 'jupynium', group_index = 1, priority = 100 },
--                     { name = 'nvim_lsp', group_index = 2, priority = 99 },
--                     { name = 'luasnip',  group_index = 3, priority = 98 },
--                     { name = "filepath", group_index = 5, priority = 96 },
--                 }
--             }
--         }),
--         ['<Up>']      = cmp.mapping.select_prev_item(cmp_select),
--         ['<Down>']    = cmp.mapping.select_next_item(cmp_select),
--         ['<C-Right>'] = cmp.mapping(
--             function(fallback)
--                 if snip.jumpable(1) then
--                     snip.jump(1)
--                 else
--                     fallback()
--                 end
--             end, { 'i', 's' }
--         ),
--         ['<C-Left>']  = cmp.mapping(
--             function(fallback)
--                 if snip.jumpable(-1) then
--                     snip.jump(-1)
--                 else
--                     fallback()
--                 end
--             end, { 'i', 's' }
--         ),
--         ['<C-l>']     = cmp.mapping(
--             function(fallback)
--                 if cmp.visible() then
--                     return cmp.complete_common_string()
--                 end
--                 fallback()
--             end, { 'i', 'c' }
--         ),

--     }),

--     formatting = {
--         expandable_indicator = true,
--         fields = { 'abbr', 'menu', 'kind' },
--         format = function(entry, item)
--             local n = entry.source.name
--             if n == 'luasnip' then
--                 item.menu = '[luasnip]'
--             elseif n == 'nvim_lsp' then
--                 item.menu = '[nvim_lsp]'
--             else
--                 item.menu = string.format('[%s]', n)
--             end
--             return item
--         end,
--     },

-- })

-- -- ----------------------------------------------------------------------------
-- -- Luasnip Config
-- -- ----------------------------------------------------------------------------

-- require("luasnip.loaders.from_vscode").lazy_load({
--     paths = "~/.config/nvim/snippets"
-- })

-- -- -----------------------------------------------------------------------------
-- -- Keymap Config
-- -- -----------------------------------------------------------------------------

-- vim.api.nvim_create_autocmd('LspAttach', {
--     desc = 'LSP actions',
--     callback = function(event)
--         local opts = { buffer = event.buf }

--         if vim.bo.ft == "verilog" or vim.bo.ft == "systemverilog" then
--             vim.opt.tabstop = 3
--             vim.opt.shiftwidth = 3
--             vim.opt.softtabstop = 3
--             vim.opt.commentstring = "/*%s*/://%s"
--         end

--         vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
--         vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
--             local tmp = vim.opt.fo
--             vim.opt.fo = ""
--             vim.lsp.buf.format()
--             vim.opt.fo = tmp
--         end, opts)

--         vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
--         vim.keymap.set('n', 'H', function() vim.lsp.buf.signature_help() end, opts)

--         vim.keymap.set('n', 'd]', function() vim.diagnostic.goto_next() end, opts)
--         vim.keymap.set('n', 'd[', function() vim.diagnostic.goto_prev() end, opts)
--         vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
--         vim.keymap.set('n', '<F3>', function() vim.lsp.buf.code_action() end, opts)
--         vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)

--         vim.keymap.set('n', '<leader>%', function() vim.lsp.buf.add_workspace_folder() end, opts)
--         vim.keymap.set('n', '<leader>rm', function() vim.lsp.buf.remove_workspace_folder() end, opts)
--         vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.list_workspace_folders() end, opts)

--         vim.keymap.set('n', '<leader>gt', function() vim.lsp.buf.typehierarchy("subtypes") end, opts)
--         vim.keymap.set('n', '<leader>gT', function() vim.lsp.buf.typehierarchy("supertypes") end, opts)

--         vim.keymap.set('n', 'gs', function(_) trouble.sidebar_cmd('symbols') end)
--         vim.keymap.set('n', 'gd', function(_) trouble.sidebar_cmd('lsp_definitions') end)
--         vim.keymap.set('n', 'gD', '<cmd>Telescope lsp_definitions<cr>', opts)
--         vim.keymap.set('n', 'gr', function(_) trouble.sidebar_cmd('lsp_references') end)
--         vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<cr>', opts)
--         vim.keymap.set('n', 'gr', function(_) trouble.sidebar_cmd('lsp_references') end)
--         vim.keymap.set("n", "<leader>vD", "<cmd>Telescope diagnostics<cr>", opts)
--         vim.keymap.set("n", "<leader>vd", function(_) trouble.sidebar_cmd('diagnostics') end)
--         vim.keymap.set('n', '<leader>t', '<cmd>Telescope lsp_type_definitions<cr>', opts)
--         vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>', opts)
--         vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>', opts)
--         vim.keymap.set("n", "<leader>vs", "<cmd>Telescope lsp_document_symbols<cr>", opts)
--         vim.keymap.set('n', '<leader>ws', '<cmd>Telescope lsp_workspace_symbols<cr>', opts)
--         vim.keymap.set('n', '<leader>wd', "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)
--     end,
-- })

-- -- ----------------------------------------------------------------------------
-- -- LSP Config
-- -- ----------------------------------------------------------------------------

-- vim.lsp.config('*', { root_markers = { ".git" } })

-- vim.diagnostic.config({
--     severity_sort = true,
--     update_in_insert = true,
--     virtual_text = {
--         severity = vim.diagnostic.severity.ERROR,
--         source = true
--     },
--     float = {
--         style = 'minimal',
--         source = 'if_many',
--         border = 'rounded',
--         severity_sort = true,
--     },
--     signs = {
--         text = {
--             [vim.diagnostic.severity.INFO] = '»',
--             [vim.diagnostic.severity.HINT] = '⚑',
--             [vim.diagnostic.severity.WARN] = '▲',
--             [vim.diagnostic.severity.ERROR] = '✘',
--         },
--     },
-- })

-- vim.lsp.handlers[meths.textDocument_hover] = function(err, result, ctx)
--     return vim.lsp.handlers.hover(
--         err, result, ctx, {
--             scrollbar = true,
--             wrap = true,
--             winblend = 10,
--             title = "Signature",
--             border = "rounded",
--             wrap_at = 79,
--             max_width = 80,
--             max_height = 60,
--         }
--     )
-- end

-- vim.lsp.handlers[meths.textDocument_signatureHelp] = function(err, result, ctx)
--     vim.lsp.handlers.signature_help(
--         err, result, ctx, {
--             scrollbar = true,
--             wrap = true,
--             winblend = 10,
--             title = "Signature",
--             border = "rounded",
--             wrap_at = 79,
--             max_width = 80,
--             max_height = 60,
--         }
--     )
-- end
