local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    -- Docker
    "dockerls",

    -- Docker Compose
    "docker_compose_language_service",

    -- C
    "clangd",

    -- Cmake
    "cmake",

    -- Lua
    "lua_ls",

    -- Vim
    "vimls",

    -- Rust
    "rust_analyzer",

    -- Python
    "pylsp",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- Set Up cmp
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Right>'] = cmp.mapping.confirm({
      behavior=cmp.ConfirmBehavior.Replace,
      select = true
  }),
  ['<Enter>'] = cmp.mapping.confirm({
      behavior=cmp.ConfirmBehavior.Insert,
      select = true
  }),
  ['<Left>']    = cmp.mapping.abort(),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- Set Up LSP
lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- ===============================================================================
-- Set LSP Keymaps
-- ===============================================================================
--
-- Default Keymaps:
-- ----------------
-- K:           Display Hover information about the symbol under cursor. (`vim.lsp.buf.hover()`)
-- gd:          Jump to definition of symbol under cursor (`vim.lsp.buf.definition()`)
-- gD:          Jump to declaration of symbol under cursor (`vim.lsp.buf.definition()`)
-- go:          Jump to type-definition of symbol under cursor (`vim.lsp.buf.type_definition()`)
-- gi:          List all implementations for symbol under cursor (`vim.lsp.buf.implementation()`)
-- gr:          List all references to symbol under cursor (`vim.lsp.buf.references()`)
-- gs:          Display signature information about symbol under cursor (`vim.lsp.buf.signature_help()`)
-- gl:          Display Diagnostics in a floating window (`vim.diagnostic.open_float()`)
-- ]d:          Move to next diagnostic in current buffer (`vim.diagnostic.goto_next()`)
-- [d:          Move to previous diagnostic in current buffer (`vim.diagnostic.goto_prev()`)
-- <F2>:        Rename all references to symbol under cursor (`vim.lsp.buf.rename()`)
-- <F3>:        Format code in current buffer (`vim.lsp.buf.format()`)
-- <F4>:        Select a code action available at current cursor position (`vim.lsp.buf.code_action()`)
--
-- Additional Keymaps - Insert Mode:
-- ---------------------------------
-- Ctrl-h:      Display signature information about symbol under cursor (`vim.lsp.buf.signature_help()`)
--
-- Additional Keymaps - Normal Mode:
-- ---------------------------------
-- Leader-f:    Format code in current buffer (`vim.lsp.buf.format()`)
-- Leader-gd:   Jump to declaration of symbol under cursor (`vim.lsp.buf.definition()`)
--
-- ===============================================================================

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = true }
    -- Insert Mode
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- Normal mode
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    vim.keymap.set('n', 'd]', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', 'd[', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>pd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "<leader>vs", "<cmd> Telescope lsp_document_symbols<CR>", opts)
    vim.keymap.set('n', '<leader>ws', "<cmd> Telescope lsp_workspace_symbols query=*<CR>", opts)
end)

lsp.setup()
