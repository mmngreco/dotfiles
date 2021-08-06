local function make_base_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {"documentation", "detail", "additionalTextEdits"}
    }
    return {capabilities = capabilities, on_attach = on_attach}
end

require("compe").setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "always",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        tabnine = {priority = 0},
        tmux = true,
        vsnip = true
    }
}


local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  local on_attach = require'completion'.on_attach

  for _, server in pairs(servers) do
    require'lspconfig'[server].setup {
        on_attach=require'completion'.on_attach
    }
  end
end

setup_servers()

local nvim_lsp = require('lspconfig')
local on_attach = require'completion'.on_attach
nvim_lsp.python.setup {
  cmd = {"pyls"};
  cmd_env = {VIRTUAL_ENV = "$CONDA_PREFIX"};
  on_attach = require'completion'.on_attach;
}

-- FIXME why this doesn't work???
-- npm i -g pyright  -- done
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.pyright.setup{
--     cmd_env = {VIRTUAL_ENV = "$CONDA_PREFIX"};
--     on_attach = require'completion'.on_attach;
--     settings = {
--         python = {
--             -- venvPath = "$CONDA_PREFIX",
--             }
--     }
-- }
