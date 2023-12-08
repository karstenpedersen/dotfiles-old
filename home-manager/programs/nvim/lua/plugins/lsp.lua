local servers = {
    ['svelte'] = {},
    ['astro'] = {},
    ['jsonls'] = {},
    ['tsserver'] = {},
    ['lua_ls'] = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                },
                workspace = {
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.stdpath('config') .. '/lua'] = true
                    }
                }
            }
        }
    },
    ['rnix'] = {},
    ['marksman'] = {},
    ['hls'] = {},
    ['pyright'] = {},
    ['ccls'] = {}
}

-- On attach
local on_attach = function(_, bufnr)
    -- Format user command
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end)
end

-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup language servers
local lspconfig = require('lspconfig')
for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend('force', opts, {
        capabilities = capabilities,
        on_attach = on_attach
    })

    lspconfig[server].setup(opts)
end

require('neodev').setup()
