-- Use a loop to conveniently call 'setup' on multiple servers
local servers = { 'clangd', 'zls', 'pyright' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

require('lspconfig').clangd.setup{
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--suggest-missing-includes",
    "--all-scopes-completion",
    "--pretty",
    "--header-insertion=never",
    "-j=4",
    "--inlay-hints",
    "--header-insertion-decorators",
  },
  filetypes = {"c", "cpp", "objc", "objcpp"},
  -- root_dir = utils.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
  init_option = { fallbackFlags = {  "-std=c++2a"  } }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').zls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
