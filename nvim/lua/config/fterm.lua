local M = {}

M.state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

function M.fterm(opts)
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
		relative = relative,
	}

	if not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win = vim.api.nvim_open_win(buf, true, win_config)
	return { buf = buf, win = win }
end

function M.is_terminal(buf)
	return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal"
end

function M.toggle_fterm()
	if vim.api.nvim_win_is_valid(M.state.floating.win) then
		vim.api.nvim_win_hide(M.state.floating.win)
	else
		M.state.floating = M.fterm({ buf = M.state.floating.buf })

		if not M.is_terminal(M.state.floating.buf) then
			vim.cmd.terminal()
		end
	end
end

function M.get_clipboard()
	if vim.fn.has("wsl") == 1 then
		if vim.fn.executable("wl-copy") == 0 then
			print("wl-clipboard not found, clipboard integration won't work")
			return nil
		else
			return {
				name = "wl-clipboard (wsl)",
				copy = {
					["+"] = "wl-copy --foreground --type text/plain",
					["*"] = "wl-copy --foreground --primary --type text/plain",
				},
				paste = {
					["+"] = function()
						return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { "" }, 1) -- '1' keeps empty lines
					end,
					["*"] = function()
						return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { "" }, 1)
					end,
				},
				cache_enabled = true,
			}
		end
	elseif os.getenv("TMUX") ~= nil then
		return {
			name = "tmux-clipboard",
			copy = {
				["+"] = "tmux load-buffer -",
				["*"] = "tmux load-buffer -",
			},
			paste = {
				["+"] = "tmux save-buffer -",
				["*"] = "tmux save-buffer -",
			},
			cache_enabled = true,
		}
	else
		return vim.g.clipboard
	end
end

vim.api.nvim_create_user_command("Fterm", M.toggle_fterm, {})

return M
