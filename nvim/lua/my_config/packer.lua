-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer Autoupdate
    use('wbthomason/packer.nvim')

    -- Plugins
    use('mbbill/undotree')
    use('preservim/nerdtree')
    use('justinmk/vim-sneak')
    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('folke/zen-mode.nvim')
    use('tpope/vim-commentary')
    use('ThePrimeagen/harpoon')
    use('aklt/plantuml-syntax')
    use('ThePrimeagen/vim-be-good')
    use('easymotion/vim-easymotion')
    use("christoomey/vim-tmux-navigator")
    use("eandrju/cellular-automaton.nvim")

    -- Color Scheme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    -- Trouble
    use({"folke/trouble.nvim", config = function()
            require("trouble").setup({ icons = false, })
        end
    })

    -- Tree-Sitter
    use('nvim-treesitter/playground')
    use("nvim-treesitter/nvim-treesitter-context")
    use({'nvim-treesitter/nvim-treesitter', run = function()
            local ts_update = ({
                require('nvim-treesitter.install')
                    .update({ with_sync = true })
            })

            ts_update()
        end
    })

    -- LSP + Mason
    use({'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'saadparwaiz1/cmp_luasnip' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    })

    -- Neovim Remote
    use({
        "amitds1997/remote-nvim.nvim",
        version = "*",                       -- Pin to GitHub releases
        requires = {
            "nvim-lua/plenary.nvim",         -- For standard functions
            "MunifTanjim/nui.nvim",          -- To build the plugin UI
            "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
        },
        config = function()
            require('remote-nvim').setup({
                client_callback = function(port, workspace_config)
                    local cmd = ("wezterm cli set-tab-title --pane-id $(wezterm cli spawn nvim --server localhost:%s --remote-ui) %s")
                    :format(
                        port,
                        ("'Remote: %s'"):format(workspace_config.host)
                    )
                    if vim.env.TERM == "xterm-kitty" then
                        cmd = ("kitty -e nvim --server localhost:%s --remote-ui"):format(port)
                    end
                    vim.fn.jobstart(cmd, {
                        detach = true,
                        on_exit = function(job_id, exit_code, event_type)
                            -- This function will be called when the job exits
                            print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
                        end,
                    })
                end,
                offline_mode = {
                    enabled = true,
                    no_github = false,
                },
            })
        end
    })

end)
