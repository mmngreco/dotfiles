-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For vsnip user.
      end,
    },

    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-l>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-l>'] = cmp.mapping.confirm({ select = true }),
    },

    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
    }
})


-- LspInstall side
require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
    require'lspconfig'[server].setup {
        -- on_attach = require'completion'.on_attach,
        capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
end

-- manual installations
local function on_attach()
end
local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities()),

-- require'lspconfig'.pyls.setup{ on_attach=on_attach }
require'lspconfig'.pylsp.setup{ capabilities = capabilities, on_attach=on_attach, }
require'lspconfig'.vimls.setup{}
require'lspconfig'.bash.setup{}
require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}
-- require'lspconfig'.pyright.setup {}
