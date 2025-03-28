function get_clipboard()
    if os.getenv("TMUX") ~= nil then
        return {
            name = 'tmux-clipboard',
            copy = {
                ['+'] = 'tmux load-buffer -',
                ['*'] = 'tmux load-buffer -',
            },
            paste = {
                ['+'] = 'tmux save-buffer -',
                ['*'] = 'tmux save-buffer -',
            },
            cache_enabled = true
        }
    elseif vim.fn.has("wsl") == 1 then
        if vim.fn.executable("wl-copy") == 0 then
            print("wl-clipboard not found, clipboard integration won't work")
            return nil
        else
            return {
                name = "wl-clipboard (wsl)",
                copy = {
                    ["+"] = 'wl-copy --foreground --type text/plain',
                    ["*"] = 'wl-copy --foreground --primary --type text/plain',
                },
                paste = {
                    ["+"] = (function()
                        return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { '' }, 1) -- '1' keeps empty lines
                    end),
                    ["*"] = (function()
                        return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { '' }, 1)
                    end),
                },
                cache_enabled = true
            }
        end
    else
        return nil
    end
end
