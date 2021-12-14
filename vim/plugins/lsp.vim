let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'vim-vsnip'
set completeopt=menuone,noinsert,noselect


lua <<EOF

-- vim.lsp.set_log_level("debug")
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
local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require("nvim-lsp-installer.servers")


function setup_server(server_name)
    -- print(vim.inspect(server_name))
    local server_available, requested_server = lsp_installer_servers.get_server(server_name)

    if server_available then
        -- print("on_ready: ", vim.inspect(server_name))
        requested_server:on_ready(
            function ()
                local opts = {}
                opts.on_attach = on_attach
                opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

                -- if requested_server.name == "pyright" then
                --     opts.settings = { pyright = { disableLanguageServices = false, ignore = "deps" } }
                -- end

                if requested_server.name == "clangd" then
                    opts.root_dir = function() return vim.loop.cwd() end
                end
                requested_server:setup(opts)
            end
        )

    if not requested_server:is_installed() then
        -- print("installing: ", vim.inspect(server_name))
        requested_server:install()
        end
    end

end

local function config(_config)
    return vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }, _config or {})
end

setup_server("bashls")
-- setup_server("pylsp")
setup_server("pyright")
setup_server("vimls")
setup_server("gopls")
setup_server("bashls")
setup_server("sumneko_lua")
setup_server("texlab")
setup_server("sqlls")
setup_server("yamlls")
setup_server("lemminx")  -- xml
setup_server("dockerls")  -- xml
setup_server("clangd")

EOF


" nnoremap gh <cmd>Lspsaga lsp_finder<CR>
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>ca :Lspsaga code_action<CR>
" vnoremap <leader>ca :<C-U>Lspsaga range_code_action<CR>
" nnoremap  <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" nnoremap  <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" nnoremap gs :Lspsaga signature_help<CR>
" nnoremap gr :Lspsaga rename<CR>
" nnoremap gd :Lspsaga preview_definition<CR>

nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.signature_help()<CR>

nnoremap <leader>gf :lua vim.lsp.buf.references()<CR>

nnoremap <leader>ga :lua vim.lsp.buf.code_action()<CR>

nnoremap <leader>sd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :lua vim.lsp.diagnostic.set_loclist()<CR>
