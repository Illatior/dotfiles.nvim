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
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim', run = function() -- Optional
				pcall(vim.cmd, 'MasonUpdate')
			end},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-path"},
			{"saadparwaiz1/cmp_luasnip"},
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'hrsh7th/cmp-nvim-lua'}, -- Required
			{"hrsh7th/cmp-cmdline"},

			{'L3MON4D3/LuaSnip'},     -- Required
			{"rafamadriz/friendly-snippets"},
		}
	},


    {
        "jose-elias-alvarez/null-ls.nvim"
    }
}

return plugins
