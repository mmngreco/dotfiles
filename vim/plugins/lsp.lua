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
nvim_lsp.pyls.setup {
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
