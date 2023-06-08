-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    print("Installing packer...")
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config:w
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    print("error loading packer")
    return
end

return packer.startup(function(use)
    local function get_config(name)
        return string.format("require(\"plugins/%s\")", name)
    end

    -- Packer
    use("wbthomason/packer.nvim")

    -- Themes
    use({"navarasu/onedark.nvim", config = get_config("onedark")})

    -- Splits/buffers
    use("szw/vim-maximizer") -- window maximizer

    -- Editing
    use("tpope/vim-surround") -- ys, ds, cs (check docs)
    use("vim-scripts/ReplaceWithRegister")
    use({"numToStr/Comment.nvim", config = get_config("comment")})

    -- Tree
    use({"nvim-tree/nvim-tree.lua", config = get_config("nvim-tree")})

    -- Utils
    use({"windwp/nvim-autopairs", config = get_config("autopairs")})
    use({"nvim-treesitter/nvim-treesitter", config = get_config("treesitter"), run = ":TSUpdate"})
    use({"tpope/vim-sleuth"})
    use("dominikduda/vim_current_word")
    use ({ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', config = get_config("ufo")})

    -- Todo hightling
    use({"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = get_config("todo-comments")})

    -- Lualine
    use({"nvim-lualine/lualine.nvim", requires = 'kyazdani42/nvim-web-devicons', config = get_config("lualine")})
    use("arkav/lualine-lsp-progress")

    -- Telescope
    use({"nvim-telescope/telescope.nvim", branch = "0.1.x", config = get_config("telescope")})
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})

    -- tmux
    use({"christoomey/vim-tmux-navigator"})

    -- git
    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = get_config("gitsigns"),
    })
    use({
     "TimUntersberger/neogit",
      requires = { "nvim-lua/plenary.nvim" },
      config = get_config("neogit"),
    })
    use({
      "sindrets/diffview.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
      },
      config = get_config("diffview"),
    })

    -- lsp
    use({"williamboman/mason.nvim", config = get_config("mason")})
    use("williamboman/mason-lspconfig.nvim")
    use({"neovim/nvim-lspconfig", config = get_config("lsp")})
    use("hrsh7th/cmp-nvim-lsp")
    use({"glepnir/lspsaga.nvim", brach = "main", event = "LspAttach", config = get_config("lspsaga")})
    use("onsails/lspkind.nvim")

    -- autocompletion
    use({"hrsh7th/nvim-cmp", config = get_config("nvim-cmp")})
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    use({"jose-elias-alvarez/null-ls.nvim", config = get_config("null-ls")})

    use({"mfussenegger/nvim-dap"})
    use({"leoluz/nvim-dap-go", requires = "mfussenegger/nvim-dap", config = get_config("nvim-dap-go")})
    use({
      "olexsmir/gopher.nvim",
      requires = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"},
      build = function()
        vim.cmd [[silent! GoInstallDeps]]
      end,
      config = get_config("gopher")
    })

    if packer_bootstrap then
        packer.sync()
    end
end)
