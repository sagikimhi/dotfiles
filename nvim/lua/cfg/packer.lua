-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer Autoupdate
    use('wbthomason/packer.nvim')

    -- Color Scheme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd.colorscheme('rose-pine-main')
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        end
    })

    -- Plugins
    use('sharkdp/fd')
    use('mbbill/undotree')
    use('tpope/vim-abolish')
    use('preservim/nerdtree')
    use('justinmk/vim-sneak')
    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('javiorfo/nvim-soil')
    use('dense-analysis/ale')
    use('folke/zen-mode.nvim')
    use('notomo/promise.nvim')
    use('tpope/vim-commentary')
    use('ThePrimeagen/harpoon')
    use('aklt/plantuml-syntax')
    use('edluffy/hologram.nvim')
    use('mfussenegger/nvim-lint')
    use('ThePrimeagen/vim-be-good')
    use('mhartington/formatter.nvim')
    use('nvim-tree/nvim-web-devicons')
    use('christoomey/vim-tmux-navigator')
    use('eandrju/cellular-automaton.nvim')

    -- File Explorer
    use('stevearc/oil.nvim')

    -- Sql Workbench
    use('tpope/vim-dadbod')
    use('kristijanhusak/vim-dadbod-ui')
    use('kristijanhusak/vim-dadbod-completion')

    -- Python - Textual CSS Syntax Highlighting
    use({
        'cachebag/nvim-tcss',
        config = function()
            require('tcss').setup()
        end
    })

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    })

    -- Trouble
    use({
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup({})
        end
    })

    -- Tree-Sitter
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = ({
                require('nvim-treesitter.install')
                    .update({ with_sync = true })
            })

            ts_update()
        end
    })

    -- Jupynium - Synchronized Jupyter Notebooks for Neovim
    use({
        "GCBallesteros/jupytext.nvim",
        config = true,
        lazy = false,
    })

    -- LSP
    use({ 'neovim/nvim-lspconfig' })
    use({ 'williamboman/mason.nvim' })
    use({ 'williamboman/mason-lspconfig.nvim' })
    use({ 'hrsh7th/cmp-nvim-lsp' })
    use({ 'hrsh7th/cmp-buffer' })
    use({ 'hrsh7th/cmp-path' })
    use({ 'hrsh7th/cmp-cmdline' })
    use({ 'hrsh7th/cmp-nvim-lua' })
    use({ 'hrsh7th/nvim-cmp' })

    -- Snippets
    use({
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' }
    })
    use({ 'rafamadriz/friendly-snippets' })
    use({ 'saadparwaiz1/cmp_luasnip' })

    -- Folding
    use({
        'kevinhwang91/nvim-ufo',
        requires = { 'kevinhwang91/promise-async' }
    })
    use({ 'VonHeikemen/lsp-zero.nvim' })

    -- CamelCase and snake_case motion
    use({
        'chrisgrieser/nvim-spider',
        config = function()
            require("spider").setup({
                subwordMovement = true,
                consistentOperatorPending = true, -- see "Consistent Operator-pending Mode" in the README
                skipInsignificantPunctuation = true,
            })
        end
    })

    -- Format via CLI tool instead of neovim
    -- Disabled till i need it, for now neovim's fine.
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({

            })
        end,
    })
end)
