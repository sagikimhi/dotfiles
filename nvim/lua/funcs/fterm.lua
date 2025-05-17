local function is_terminal(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal"
end

local function Fterm(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.85)
    local height = opts.height or math.floor(vim.o.lines * 0.85)
    local col = opts.col or math.ceil((vim.o.columns - width) / 2)
    local row = opts.row or math.ceil((vim.o.lines - height) / 2)
    local buf = opts.buf
    local style = opts.style or "minimal"
    local border = opts.border or "rounded"
    local relative = opts.relative or "editor"
    local win_config = {
        row = row,
        col = col,
        width = width,
        height = height,
        style = style,
        border = border,
        relative = relative
    }

    if not vim.api.nvim_buf_is_valid(buf) then
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win = vim.api.nvim_open_win(buf, true, win_config)
    return { buf = buf, win = win }
end

local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

vim.api.nvim_create_user_command("Fterm", function()
    if vim.api.nvim_win_is_valid(state.floating.win) then
        vim.api.nvim_win_hide(state.floating.win)
    else
        state.floating = Fterm({ buf = state.floating.buf })

        if not is_terminal(state.floating.buf) then
            vim.cmd.terminal()
        end
    end
end, {})
