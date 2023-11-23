return {
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
    },
    {
        "theprimeagen/harpoon",
        opts = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-r>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-v>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-u>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-m>", function() ui.nav_file(4) end)
        end
    },
    {
        "mbbill/undotree",
        lazy = false,
        keys = {
            { '<leader>u', vim.cmd.UndotreeToggle, desc = "Open [U]ndo tree" }
        },
    },
    {
        "christoomey/vim-tmux-navigator",
    },

    -- git
    {
        "TimUntersberger/neogit",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>gs", "<cmd>Neogit<cr>", desc = "[G]it [S]tatus" },
        },
        opts = {
            integrations = {
                diffview = true,
            },
        },
    },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>gc", "<cmd>Gitsigns preview_hunk<cr>", desc = "[G]it toggle diff [C]hunks" },
        },
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = {
                add = {
                    hl = "GitSignsAdd",
                    text = "│",
                    numhl = "GitSignsAddNr",
                    linehl = "GitSignsAddLn"
                },
                change = {
                    hl = "GitSignsChange",
                    text = "│",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn"
                },
                delete = {
                    hl = "GitSignsDelete",
                    text = "_",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                topdelete = {
                    hl = "GitSignsDelete",
                    text = "‾",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                changedelete = {
                    hl = "GitSignsChange",
                    text = "~",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn"
                }
            },
            signcolumn = true,
            numhl = false,
            linehl = false,
            word_diff = false,
            watch_gitdir = {interval = 1000, follow_files = true},
            attach_to_untracked = true,

            current_line_blame = false,
            current_line_blame_formatter_opts = {relative_time = false},
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil,
            max_file_length = 40000,
            preview_config = {
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1
            },
            diff_opts = {internal = true},
            yadm = {enable = false}
        }
    },
}
