vim.keymap.set(
    'i', '<C-Enter>', 'copilot#Accept("")', {
        expr = true,
        replace_keycodes = false
    }
)
vim.keymap.set('i', '<M-Right>', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<M-Enter>', '<Plug>(copilot-accept-line)')
vim.g.copilot_no_tab_map = true

