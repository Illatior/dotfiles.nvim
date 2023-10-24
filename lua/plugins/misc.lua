return {
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require('alpha').setup(require('alpha.themes.startify').config)
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        keys = {
            { "<leader>e", ":NvimTreeToggle<CR>", "[E]xplore file tree" },
        },
        opts = require('plugins.settings.tree'),
    },
    {
        "numToStr/Comment.nvim",
        config = {},
    },
    {
        "windwp/nvim-autopairs",
        config = {
            enable_check_bracket_line = true,
            check_ts = true,
        },
    },
    {
        "nvim-treesitter/playground",
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async'
    },
    -- { 'folke/which-key.nvim' },
}
