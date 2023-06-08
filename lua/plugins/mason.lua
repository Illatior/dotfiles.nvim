require("mason").setup({
    ui = {
        icons = {
            package_installed = "?",
            package_pending = "?",
            package_uninstalled = "?"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",
        "rust_analyzer",
        "bashls",
        "dockerls",
        "lua_ls",
        "solc",
        "jsonls"
    },
    automatic_installation = true,
})
