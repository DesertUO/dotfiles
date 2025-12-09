-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', ',e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gE', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', ',q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- Go to declaration
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- Go to definition
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- Show toolbox
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- Show implementation? idk
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- Show signature (params and return type)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 's', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', ',s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- Something about this workspace
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- Go to type definition
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- Rename type
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- Code action
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',qf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- Open references menu (places where the current has been referenced)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Lsp setups for different programming languages
require("lspconfig").nimls.setup{
    cmd                 = {"nimlsp"},
    filetypes           = {"nim"},
    single_file_support = true
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local cmp_nvim_capabilities = cmp_nvim_lsp.default_capabilities()

require('lspconfig').clangd.setup{
  on_attach = on_attach,
  -- Set general clangd command, non os dependant: linux, windows
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--all-scopes-completion",
    "--pretty",
    "--header-insertion=never",
    "-j=4",
    "--inlay-hints",
    "--header-insertion-decorators",
    "--function-arg-placeholders",
    "--completion-style=detailed"
  },
  filetypes = {"c", "cpp", "objc", "objcpp"},
  root_dir = require('lspconfig').util.root_pattern("src"),
  init_option = { fallbackFlags = {  "-std=c++2a"  } },
  capabilities = capabilities
}

require('lspconfig').zls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "zls",
    "--enable-debug-log",
  },
}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require('lspconfig').lua_ls.setup{
    capabilities = cmp_nvim_capabilities
}

require('lspconfig').rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "rust-analyzer" },

    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            }
        }
    }
}
