-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use('mbbill/undotree')
    use("github/copilot.vim")
    use('justinmk/vim-sneak')
    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('folke/zen-mode.nvim')
    use('tpope/vim-commentary')
    use('ThePrimeagen/harpoon')
    use("christoomey/vim-tmux-navigator")
    use("eandrju/cellular-automaton.nvim")

    use({'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use({'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    use({"folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end
    })

    use({'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = ({
                require('nvim-treesitter.install').update(
                    { with_sync = true }
                )
            })
            ts_update()
        end
    })
    use('nvim-treesitter/playground')
    use("nvim-treesitter/nvim-treesitter-context")

    use({'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    })

end)

