
local opt = vim.opt
opt.wildmode = {"longest", "list", "full"}
opt.wildmenu = true
opt.wildignore:append("*.pyc")
opt.wildignore:append("*_build/*")
opt.wildignore:append("**/coverage/*")
opt.wildignore:append("**/node_modules/*")
opt.wildignore:append("**/.venv/*")
opt.wildignore:append("**/venv/*")
opt.wildignore:append("**/android/*")
opt.wildignore:append("**/ios/*")
opt.wildignore:append("**/.git/*")
opt.mouse = "nv"


local g = vim.g
g.loaded_matchparen = 1
g.mapleader = " "

g.loaded_python_provider = 1
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

require('mmngreco.packer')


-- neogit
local neogit = require('neogit')
local nnoremap = require('mmngreco.keymap').nnoremap

neogit.setup {}

nnoremap("<leader>gs", function()
    neogit.open({ })
end);

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
