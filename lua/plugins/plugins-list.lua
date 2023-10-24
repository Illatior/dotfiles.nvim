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
        "nvim-treesitter/playground" },

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
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {"hrsh7th/cmp-cmdline"},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},

            { 'j-hui/fidget.nvim', tag = 'legacy' },
        }
    },

    {
        "jose-elias-alvarez/null-ls.nvim"
    }
}

return plugins
