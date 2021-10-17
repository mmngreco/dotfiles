let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'vim-vsnip'
set completeopt=menuone,noinsert,noselect


lua <<EOF

vim.lsp.set_log_level("debug")
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

-- manual installations
local function on_attach()
    -- vim.lsp.buf.remove_workspace_folder(".venv")
end

local function py_on_attach()
    vim.lsp.buf.remove_workspace_folder(".venv")
end

-- LspInstall side
require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
    require'lspconfig'[server].setup {
        -- on_attach = require'completion'.on_attach,
        capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
end

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

require'lspconfig'.jedi_language_server.setup{
    on_attach=on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

-- require'lspconfig'.pylsp.setup{config()}
-- require'lspconfig'.pyls.setup{ on_attach=py_on_attach }
-- require'lspconfig'.jedi_language_server.setup{ on_attach=py_on_attach, }
require'lspconfig'.vimls.setup{ on_attach=on_attach, }
require'lspconfig'.bash.setup{ on_attach=on_attach, }
require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}
-- require'lspconfig'.pyright.setup {}
require'lspsaga'.init_lsp_saga()
EOF


nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gh <cmd>Lspsaga lsp_finder<CR>
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>ca :Lspsaga code_action<CR>
" vnoremap <leader>ca :<C-U>Lspsaga range_code_action<CR>
" nnoremap  <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" nnoremap  <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" nnoremap gs :Lspsaga signature_help<CR>
" nnoremap gr :Lspsaga rename<CR>
" nnoremap gd :Lspsaga preview_definition<CR>

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrf :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>sd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :lua vim.lsp.diagnostic.set_loclist()<CR>

