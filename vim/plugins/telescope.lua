local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = '> ',
        color_devicons = true,
        borderchars = {
          { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
          prompt = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
          results = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
          preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        },
        -- borderchars = {
        --   { '-', '|', '-', '|', '+', '+', '+', '+'},
        --   prompt = {'-', '|', '-', '|', '+', '+', '+', '+' };
        --   results = {'-', '|', '-', '|', '+', '+', '+', '+' };
        --   preview = {'-', '|', '-', '|', '+', '+', '+', '+' };
        -- };
        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-b>"] = actions.git_create_branch,
            },
        }
    },
    extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        },
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

local no_preview = function()
  return require('telescope.themes').get_dropdown({
    borderchars = {
      { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    },
    width = 0.8,
    previewer = false,
    prompt_title = false
  })
end

-- then use it on whatever picker you want
-- ex:
-- require('telescope').load_extension('fzy_native')
local ignore_patterns = { ".venv/", ".git/", "node_modules/", "%.pyc", "__.*cache.*/", "*.pkl", "*.pickle" }
local mmngreco = {}

mmngreco.no_preview = function()
    require("telescope.builtin").current_buffer_fuzzy_find(no_preview())
end

mmngreco.search_scio = function()
    require("telescope.builtin").find_files({
        prompt_title = "< scio >",
        cwd = "~/github/mmngreco/scio",
        hidden = true,
        no_ignore = true,
    })
end

mmngreco.search_matlab = function()
    require("telescope.builtin").find_files({
        prompt_title = "< matlab toolbox >",
        cwd = "~/etsgit1/COM/Matlab/ets/",
        hidden = true,
        no_ignore = true,
    })
end

mmngreco.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< dotfiles >",
        cwd = "$DOTFILES",
        hidden = true,
        no_ignore = true,
    })
end

mmngreco.find_files = function()
    require("telescope.builtin").find_files({
        file_ignore_patterns = ignore_patterns,
        hidden = true,
        no_ignore = true,
        follow = true,
    })
end


mmngreco.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            map('i', '<c-b>', actions.git_create_branch)
            return true
        end
    })
end


mmngreco.grep_dotfiles = function()
    require("telescope.builtin").live_grep({
        prompt_title = "< dotfiles >",
        cwd = "$DOTFILES",
        hidden = true,
        no_ignore = true,
    })
end

telescope = require('telescope')
telescope.mmngreco = mmngreco
telescope.load_extension('fzf')
telescope.load_extension('media_files')
telescope.load_extension("git_worktree")
telescope.load_extension('harpoon')

