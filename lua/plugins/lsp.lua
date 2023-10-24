return {
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
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
        },
        opts = function()
            local servers = {
                'gopls',
                'lua_ls',
                'solidity_ls_nomicfoundation',
                'pylsp',
            }

            local lsp = require('lsp-zero')
            lsp.preset('recommended')
            lsp.set_preferences {
                sign_icons = {},
            }

            lsp.on_attach(function(_, bufnr)
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = "LSP: " .. desc
                    end

                    vim.keymap.set('n', keys, func, { noremap = true, buffer = bufnr, desc = desc })
                end

                nmap('K', vim.lsp.buf.hover, "[K] hover documentation")
                nmap('gd', vim.lsp.buf.definition, "[G]oto [D]efinition")

                nmap("gd", function() vim.lsp.buf.definition() end, "[g]oto [d]efinition")
                nmap("gD", function() vim.lsp.buf.declaration() end, "[g]oto [D]eclaration")
                nmap("gi", function() vim.lsp.buf.implementation() end, "[g]oto [i]mplementation")
                nmap("go", function() vim.lsp.buf.type_definition() end, "[g]oto type definition")
                nmap("<C-h>", function() vim.lsp.buf.signature_help() end, "signature help")
                nmap("gf", function() vim.lsp.buf.references() end, "[g]oto references")
                nmap("K", function() vim.lsp.buf.hover() end, "hover documentation")
                nmap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, "workspace symbol")
                nmap("<leader>vd", function() vim.diagnostic.open_float() end, "open float")
                nmap("]d", function() vim.diagnostic.goto_next() end, "goto next")
                nmap("[d", function() vim.diagnostic.goto_prev() end, "goto prev")
                nmap("<leader>vca", function() vim.lsp.buf.code_action() end, "code action")
                nmap("<leader>rn", function() vim.lsp.buf.rename() end, "[r]e[n]ame")
                nmap('<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, '[W]orkspace [L]ist Folders')
            end)

            require('mason').setup {}
            require('mason-lspconfig').setup {
                ensure_installed = servers,
                handlers = {
                    lsp.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                },
            }

            local cmp = require('cmp')
            local cmp_action = lsp.cmp_action()
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            luasnip.config.setup({})

            cmp.setup {
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(), -- TODO test this shit
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-J>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-K>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete {},
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
            }

            require('fidget').setup {
                window = {
                    blend = 0,
                },
            }
        end
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            return {
                sources = {
                    null_ls.builtins.formatting.gofmt,
                    -- null_ls.builtins.formatting.gofumpt,
                    null_ls.builtins.formatting.goimports_reviser,
                    -- null_ls.builtins.formatting.golines,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr,
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end
                        })
                    end
                end
            }
        end
    },
}
