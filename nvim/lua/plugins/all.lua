return {
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd.colorscheme('rose-pine-main')
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        end
    },

    -- Plugins
    { 'sharkdp/fd' },
    { 'mbbill/undotree' },
    { 'tpope/vim-abolish' },
    { 'preservim/nerdtree' },
    { 'justinmk/vim-sneak' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-surround' },
    { 'javiorfo/nvim-soil' },
    { 'dense-analysis/ale' },
    { 'folke/zen-mode.nvim' },
    { 'notomo/promise.nvim' },
    { 'tpope/vim-commentary' },
    { 'ThePrimeagen/harpoon' },
    { 'aklt/plantuml-syntax' },
    { 'edluffy/hologram.nvim' },
    { 'mfussenegger/nvim-lint' },
    { 'ThePrimeagen/vim-be-good' },
    { 'mhartington/formatter.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'christoomey/vim-tmux-navigator' },
    { 'eandrju/cellular-automaton.nvim' },

    -- File Explorer
    { 'stevearc/oil.nvim' },

    -- Sql Workbench
    { 'tpope/vim-dadbod' },
    { 'kristijanhusak/vim-dadbod-ui' },
    { 'kristijanhusak/vim-dadbod-completion' },

    -- Python - Textual CSS Syntax Highlighting
    {
        'cachebag/nvim-tcss',
        config = function()
            require('tcss').setup()
        end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    },

    -- Trouble
    {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup({})
        end
    },

    -- Tree-Sitter
    { 'nvim-treesitter/playground' },
    { 'nvim-treesitter/nvim-treesitter-context' },
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = ({
                require('nvim-treesitter.install')
                    .update({ with_sync = true })
            })

            ts_update()
        end
    },

    -- Jupynium - Synchronized Jupyter Notebooks for Neovim
    {
        "GCBallesteros/jupytext.nvim",
        config = true,
        lazy = false,
    },

    -- LSP
    { 'L3MON4D3/LuaSnip' },
    {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'VonHeikemen/lsp-zero.nvim' },
    { 'rafamadriz/friendly-snippets' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'kevinhwang91/promise-async' },
    { 'kevinhwang91/nvim-ufo' },

    -- CamelCase and snake_case motion
    {
        'chrisgrieser/nvim-spider',
        config = function()
            require("spider").setup({
                lazy = true,
                dependencies = {
                    "theHamsta/nvim_rocks",
                    build = "uv tool install hererocks && hererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
                    config = function() require("nvim_rocks").ensure_installed("luautf8") end,
                },
                customPatterns = {},
                subwordMovement = true,
                consistentOperatorPending = true, -- see "Consistent Operator-pending Mode" in the README
                skipInsignificantPunctuation = true
            })
        end
    },

    -- Format via CLI tool instead of neovim
    -- Disabled till i need it, for now neovim's fine.
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    },
}
