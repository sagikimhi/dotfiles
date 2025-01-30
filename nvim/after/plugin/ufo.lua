-- -----------------------------------------------------------------------------
-- Function Definitions
-- -----------------------------------------------------------------------------

local function openAllFolds()
    require('ufo').openAllFolds()
end

local function closeAllFolds()
    require('ufo').closeAllFolds()
end

local function goNextClosedFold()
    require('ufo').goNextClosedFold()
end

local function goPreviousClosedFold()
    require('ufo').goPreviousClosedFold()
end

local function goNextClosedAndPeek()
    require('ufo').goNextClosedFold()
    require('ufo').peekFoldedLinesUnderCursor()
end

local function goPreviousClosedAndPeek()
    require('ufo').goPreviousClosedFold()
    require('ufo').peekFoldedLinesUnderCursor()
end

local function peekOrHover()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if winid then
        local bufnr = vim.api.nvim_win_get_buf(winid)
        local keys = {'a', 'i', 'o', 'A', 'I', 'O', 'gd', 'gr'}
        for _, k in ipairs(keys) do
            -- Add a prefix key to fire `trace` action,
            -- if Neovim is 0.8.0 before, remap yourself
        end
    else
        -- nvimlsp
        vim.lsp.buf.hover()
    end
end

-- -----------------------------------------------------------------------------
-- Setup
-- -----------------------------------------------------------------------------

require('ufo').setup({
        enable_get_fold_virt_text = true,
})

-- -----------------------------------------------------------------------------
-- Options
-- -----------------------------------------------------------------------------

vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.signcolumn = 'yes'
vim.o.foldcolumn = '1'
vim.o.foldenable = true
vim.o.foldlevelstart = 99

-- -----------------------------------------------------------------------------
-- Keymaps
-- -----------------------------------------------------------------------------

vim.keymap.set('n', ']]', function() goNextClosedFold() end)
vim.keymap.set('n', 'z]', function() goNextClosedAndPeek() end)
vim.keymap.set('n', '<C-]>', function() goNextClosedAndPeek() end)

vim.keymap.set('n', '[[', function() goPreviousClosedFold() end)
vim.keymap.set('n', 'z[', function() goPreviousClosedAndPeek() end)
vim.keymap.set('n', '<C-[>', function() goPreviousClosedAndPeek() end)

vim.keymap.set('n', 'zk', function() peekOrHover() end)
vim.keymap.set('n', 'zR', function() openAllFolds() end)
vim.keymap.set('n', 'zM', function() closeAllFolds() end)
