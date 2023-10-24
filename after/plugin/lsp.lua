local servers = {
  gopls = {},
  lua_ls = {
      Lua = {
          workspace = { 
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true)
          },
          diagnostics = { globals = { "vim" } },
          runtime = { version = "LuaJIT" },
          telemetry = { enable = false },
      }
  },
  rust_analyzer = {},
  tsserver = {},
  solidity_ls_nomicfoundation = {},
  pylsp = {},
}

local on_attach = function(_, bufnr) 
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, noremap = true, desc = desc })
    end

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
end

require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end
}

local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
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
    }
}
