require('FTerm').setup()

local term = require("FTerm.terminal")
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local gitls = term:new():setup({
    cmd = "git lg",
    dimensions = {
        height = 0.8,
        width = 0.8
    }
})

 -- Use this to toggle gitui in a floating terminal
function _G.__fterm_gitui()
    gitls:toggle()
end
