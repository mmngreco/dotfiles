local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' > ',
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
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
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
local mmngreco = {}

mmngreco.no_preview = function()
    require("telescope.builtin").current_buffer_fuzzy_find(no_preview())
end

mmngreco.search_scio = function()
    require("telescope.builtin").find_files({
        prompt_title = "< scio >",
        cwd = "~/github/mmngreco/scio",
    })
end

mmngreco.search_matlab = function()
    require("telescope.builtin").find_files({
        prompt_title = "< matlab toolbox >",
        cwd = "~/matlab/ets/",
    })
end

mmngreco.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< dotfiles >",
        cwd = "$DOTFILES",
    })
end

mmngreco.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end


-- mmngreco.project_files = function()
--   local opts = {} -- define here if you want to define something
--   local ok = pcall(require'telescope.builtin'.git_files, opts)
--   if not ok then require'telescope.builtin'.find_files(opts) end
-- end


mmngreco.search_dotfiles = function()
    require("telescope.builtin").live_grep({
        prompt_title = "< dotfiles >",
        cwd = "$DOTFILES",
    })
end

require('telescope').mmngreco = mmngreco
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
require("telescope").load_extension("git_worktree")
-- require("telescope").load_extension("mapper")
