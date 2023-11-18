local servers = {
--	['tailwindcss'] = {},
	['svelte'] = {},
--	['astro'] = {},
--	['cssls'] = {},
--	['html'] = {},
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
	--['tsserver'] = {},
    --['rust-analyzer'] = {},
    ['marksman'] = {},
    --['json'] = {}
}
local servers_key = vim.tbl_keys(servers)

-- On attach
local on_attach = function(_, bufnr)
  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  -- bufmap('<leader>r', vim.lsp.buf.rename)
  -- bufmap('<leader>a', vim.lsp.buf.code_action)
  -- bufmap('gd', vim.lsp.buf.definition)
  -- bufmap('gD', vim.lsp.buf.declaration)
  -- bufmap('gI', vim.lsp.buf.implementation)
  -- bufmap('<leader>D', vim.lsp.buf.type_definition)
  -- bufmap('gr', require('telescope.builtin').lsp_references)
  -- bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
  -- bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)
  -- bufmap('K', vim.lsp.buf.hover)
  -- bufmap('<leader>f', function()
  --   vim.lsp.buf.format { async = true }
  -- end)

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

    if server == 'tsserver' then
        require('typescript').setup({ server = opts })
    else
        lspconfig[server].setup(opts)
    end
end

require('neodev').setup()

