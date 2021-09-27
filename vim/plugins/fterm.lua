-- require('FTerm').setup()

local term = require("FTerm.terminal")
-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
local gitls = term:new():setup({
    cmd = "git lg",
    dimensions = {
        height = 0.8,
        width = 0.8
    }
})

local issues = term:new():setup({
    cmd = "glab issue ls",
    dimensions = {
        height = 0.8,
        width = 0.8
    }
})

local pbSummary = term:new():setup({
    cmd = "glab issue ls --repo COM/com_on/product_backlog --label 'assignee:mgreco'",
    dimensions = {
        height = 0.8,
        width = 0.8
    }
})

 -- Use this to toggle gitui in a floating terminal
function _G.__fterm_gitui()
    gitls:toggle()
end

function _G.__fterm_issues()
    issues:toggle()
end

function _G.__fterm_pbSummary()
    pbSummary:toggle()
end
