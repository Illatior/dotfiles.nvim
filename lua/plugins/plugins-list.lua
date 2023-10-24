local plugins = {
    {
        "nvim-telescope/telescope.nvim", branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" }  }
    },
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"
    },
    {
        "nvim-treesitter/playground"
    },

    -- colors
    {
        'navarasu/onedark.nvim'
    },

    -- misc
    {
        "theprimeagen/harpoon"
    },
    {
        "mbbill/undotree"
    },
    {
        "numToStr/Comment.nvim"
    },
    {
        "nvim-tree/nvim-tree.lua"
    },
    {
        "windwp/nvim-autopairs"
    },
    {
        "christoomey/vim-tmux-navigator"
    },
    {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async'
    },
    -- { 'folke/which-key.nvim' },

    -- git
    {
        "TimUntersberger/neogit",
        requires = { "nvim-lua/plenary.nvim" },
    },
    {
        "sindrets/diffview.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    },

    -- lsp
    {
        'neovim/nvim-lspconfig',
        requires= {
            -- Automatically install LSPs to stdpath for neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim', tag = 'legacy' },
            -- Additional lua configuration, makes nvim stuff amazing!
            {'folke/neodev.nvim'},
        },
    },
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = {
            -- Snippet Engine & its associated nvim-cmp source
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},

            -- Adds LSP completion capabilities
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-cmdline"},

            -- Adds a number of user-friendly snippets
            {'rafamadriz/friendly-snippets'},
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim"
    }
}

return plugins
