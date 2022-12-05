-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd.packadd 'packer.nvim'
end


require('packer').startup(function(use)
  -- Package manager
  use 'github/copilot.vim'

  use {
    'klafyvel/vim-slime-cells',
    requires = {{'jpalardy/vim-slime'}},
    ft = {'python'},
    after = 'jpalardy/vim-slime',
  }
  use 'liuchengxu/vista.vim'
  use 'romainl/vim-qf'
  use {
    'RRethy/vim-illuminate',
    disable = true
  }

  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  use 'mbbill/undotree'
	use 'kristijanhusak/vim-dadbod-ui'
	use {
      'szw/vim-maximizer',
      config=function ()
        vim.keymap.set('n', '<leader>m', ':MaximizerToggle!<CR>', {noremap = true})
      end
  }
	use 'ThePrimeagen/git-worktree.nvim'
	use 'ThePrimeagen/harpoon'


	use {
    'ThePrimeagen/refactoring.nvim',
    config=function ()
      vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
      vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
      vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
      vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
      -- Extract block doesn't need visual mode
      vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
      vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})
      vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
    end
  }

	use 'tpope/vim-abolish'
	use 'tpope/vim-dadbod'
	use 'tpope/vim-dispatch'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-markdown'
	use 'tpope/vim-obsession'
	use 'tpope/vim-repeat'
	use 'tpope/vim-rhubarb'
	use 'tpope/vim-speeddating'
	use 'tpope/vim-surround'
	use 'tpope/vim-unimpaired'
	use 'tpope/vim-vinegar'
	use 'tweekmonster/impsort.vim'
	use 'tyru/open-browser.vim'
	use 'godlygeek/tabular'
	use 'goerz/jupytext.vim'
	use 'gyim/vim-boxdraw'
  use 'fatih/vim-go'
	use 'mattn/gist-vim'
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'lewis6991/gitsigns.nvim'

  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Add custom plugins to packer from /nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, "custom.plugins")
  if has_plugins then plugins(use) end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

vim.g.catppuccin_flavour = 'mocha'
-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
-- vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
-- vim.o.termguicolors = true
vim.cmd [[colorscheme catppuccin]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`


-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<C-p>', '<cmd>lua require(\'telescope.builtin\').git_files()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>dot', '<cmd>lua require(\'telescope\').mmngreco.search_dotfiles()<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>ff', '<cmd>lua require(\'telescope\').mmngreco.find_files()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fg', '<cmd>lua require(\'telescope\').mmngreco.no_preview()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fk', '<cmd>lua require(\'telescope.builtin\').keymaps()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gc', '<cmd>lua require(\'telescope\').mmngreco.git_branches()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gsh', '<cmd>lua require(\'telescope.builtin\').git_stash()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gwt', '<cmd>lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>lg', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>pb', '<cmd>lua require(\'telescope.builtin\').buffers()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>ps', '<cmd>lua require(\'telescope.builtin\').grep_string({ search = vim.fn.input("Grep For > ")})<CR>', {noremap = true})
vim.keymap.set('n', '<leader>pw', '<cmd>lua require(\'telescope.builtin\').grep_string { search = vim.fn.expand("<cword>") }<CR>', {noremap = true})
vim.keymap.set('n', '<leader>sc', '<cmd>lua require(\'telescope\').mmngreco.search_scio()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>th', '<cmd>lua require(\'telescope.builtin\').help_tags()<CR>', {noremap = true})

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'vim', 'help'},

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = {
  -- 'clangd',
	-- 'rust_analyzer',
	'pyright',
	-- 'tsserver',
	'sumneko_lua',
	'gopls'
}

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Turn on status information
require('fidget').setup()

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-l>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'neorg' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'orgmode' },
    { name = 'path' },
    { name = 'vsnip' },
  },
}

require("catppuccin").setup({
    transparent_background = false,
    term_colors = false,
    compile = {
        enabled = false,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
    comments = {},
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
    },
    integrations = {
    -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
        treesitter = true,
    },
    color_overrides = {},
    highlight_overrides = {},
})

-- require('illuminate').configure({
--     -- providers: provider used to get references in the buffer, ordered by priority
--     providers = {
--         'lsp',
--         'treesitter',
--         'regex',
--     },
--     -- delay: delay in milliseconds
--     delay = 100,
--     -- filetype_overrides: filetype specific overrides.
--     -- The keys are strings to represent the filetype while the values are tables that
--     -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
--     filetype_overrides = {},
--     -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
--     filetypes_denylist = {
--         'dirvish',
--         'fugitive',
--     },
--     -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
--     filetypes_allowlist = {},
--     -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
--     -- See `:help mode()` for possible values
--     modes_denylist = {},
--     -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
--     -- See `:help mode()` for possible values
--     modes_allowlist = {},
--     -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
--     -- Only applies to the 'regex' provider
--     -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
--     providers_regex_syntax_denylist = {},
--     -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
--     -- Only applies to the 'regex' provider
--     -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
--     providers_regex_syntax_allowlist = {},
--     -- under_cursor: whether or not to illuminate under the cursor
--     under_cursor = true,
--     -- large_file_cutoff: number of lines at which to use large_file_config
--     -- The `under_cursor` option is disabled when this cutoff is hit
--     large_file_cutoff = 10000,
--     -- large_file_config: config to use for large files (based on large_file_cutoff).
--     -- Supports the same keys passed to .configure
--     -- If nil, vim-illuminate will be disabled for large files.
--     large_file_overrides = nil,
--     -- min_count_to_highlight: minimum number of matches required to perform highlighting
--     min_count_to_highlight = 1,
-- })

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        separator = { left = '', right = ''},
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        -- lualine_b = {'branch'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {{'filename', path = 1}},
        -- lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {function() return vim.fn.ObsessionStatus('Ob:ON', 'Ob:Off') end },
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {''},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
})

local augroup = vim.api.nvim_create_augroup
mgreco = augroup('mgreco', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


autocmd({"BufWritePre"}, {
    group = mgreco,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

autocmd({'FileType'}, {
    group = mgreco,
    pattern = "dbui",
    command = "nmap <buffer> <leader>w <Plug>(DBUI_SaveQuery)",
})

vim.keymap.set('n', '<leader>sq', '<Plug>(DBUI_SaveQuery)', {noremap = true})

autocmd({'FileType'}, {
    group = mgreco,
    pattern = "dbui",
    command = "setl nonumber norelativenumber",
})

M = {}
local actions = require('telescope.actions')

M.no_preview = function()
    require("telescope.builtin").current_buffer_fuzzy_find(no_preview())
end


M.search_scio = function()

    local vim_edit_prompt = function(prompt_bufnr)
        local current_picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
        local prompt = current_picker:_get_prompt()
        local cwd = current_picker.cwd
        actions.close(prompt_bufnr)
        vim.api.nvim_exec(':edit ' .. cwd .. '/' .. prompt, false)
        return true
    end

    require("telescope.builtin").find_files({
        prompt_title = "< scio >",
        cwd = "~/github/mmngreco/scio",
        hidden = true,
        no_ignore = true,
        attach_mappings = function(_, map)
            map('i', '<c-n>', vim_edit_prompt)
            return true
        end
    })
end

local ignore_patterns = { "venv/", ".venv/", ".git/", "node_modules/", "%.pyc", "__.*cache.*/", "*.pkl", "*.pickle" , "*.mat"}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< dotfiles >",
        cwd = "$DOTFILES",
        hidden = true,
        no_ignore = true,
    })
end

M.find_files = function()
    require("telescope.builtin").find_files({
        file_ignore_patterns = ignore_patterns,
        hidden = true,
        no_ignore = true,
        follow = true,
    })
end


M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            map('i', '<c-b>', actions.git_create_branch)
            return true
        end
    })
end


M.grep_dotfiles = function()
    require("telescope.builtin").live_grep({
        prompt_title = "< dotfiles >",
        cwd = "$DOTFILES",
        hidden = true,
        no_ignore = true,
    })
end



local telescope = require('telescope')
telescope.mmngreco = M
telescope.load_extension("git_worktree")
telescope.load_extension('harpoon')


-- netrw
--

vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
vim.g.netrw_localrmdir='rm -r'
vim.g.netrw_browsex_viewer= 'xdg-open'
vim.g.netrw_hide = 0


vim.keymap.set('n', 'gx', '<Plug>(openbrowser-smart-search)')
vim.keymap.set('v', 'gx', '<Plug>(openbrowser-smart-search)')
vim.keymap.set('n', '<leader>dd', ':Lexplore %:p:h<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>da', ':Lexplore<CR>', {noremap = true})


vim.cmd([[
if &columns < 90
  let g:netrw_winsize = 50
else
  let g:netrw_winsize = 30
endif

let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'

function! NetrwRemoveRecursive()
  if &filetype ==# 'netrw'
    cnoremap <buffer> <CR> rm -r<CR>
    normal mu
    normal mf
    try
      normal mx
    catch
    endtry
    cunmap <buffer> <CR>
  endif
endfunction

function! NetrwMapping()
  nmap <buffer> <leader>dd :Lexplore<CR>
  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> . gh
  nmap <buffer> <TAB> mf
  nmap <buffer> <S-TAB> mF
  nmap <buffer> <Leader><TAB> mu
  nmap <buffer> bb mb
  nmap <buffer> bd mB
  nmap <buffer> bl gb
  nmap <buffer> ff %:w<CR>:buffer #<CR>
  nmap <buffer> fe R
  nmap <buffer> fc mc
  nmap <buffer> fC mtmc
  nmap <buffer> fx mm
  nmap <buffer> fX mtmm
  nmap <buffer> f; mx
  nmap <buffer> fd mtfq
  nmap <buffer> FF :call NetrwRemoveRecursive()<CR>
  nmap <buffer> P <C-w>z
endfunction

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END
]])

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- [[ LSP ]]
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gh', ':lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gf', ':lua vim.lsp.buf.references()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>ga', ':lua vim.lsp.buf.code_action()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>dq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true})

-- [[ jupytext ]]
--
-- vim.g.jupytext_filetype_map = { 'py' : 'python' }
vim.g.jupytext_fmt = 'py'

-- [[ harpoon ]]

function Send_to_harpoon(term_num, visual)
    local goto_term = vim.g.harpoon_goto_term
    local term = require('harpoon.term')
    if visual == 1 then
        local lines = vim.fn.getline("'<", "'>")
        for _, line in ipairs(lines) do
            term.sendCommand(term_num, line)
            term.sendCommand(term_num, '\r')
        end
    else
        local line = vim.fn.getline('.')
        term.sendCommand(term_num, line)
        term.sendCommand(term_num, '\r')
    end

    if goto_term == 1 then
        term.gotoTerminal(term_num)
    end

end
vim.g.harpoon_goto_term = 0
vim.keymap.set('n', '<leader>h', ':lua Send_to_harpoon(1, 0)<CR>', {noremap = true})
vim.keymap.set('v', '<leader>h', ':lua Send_to_harpoon(1, 1)<CR>', {noremap = true})

local harpoon = require('harpoon.mark').add_file
vim.keymap.set('n', '<leader>aa', require('harpoon.mark').add_file, {noremap = true})
vim.keymap.set('n', '<leader>a', require('harpoon.ui').toggle_quick_menu, {noremap = true})

vim.cmd([[
nnoremap <silent> <Plug>SendToHarpoon1 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(1, vim.g['_cmd'])<cr> \ :call repeat#set("\<Plug>SendToHarpoon1", v:count)<cr>
nnoremap <silent> <Plug>SendToHarpoon2 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(2, vim.g['_cmd'])<cr> \ :call repeat#set("\<Plug>SendToHarpoon2", v:count)<cr>
nnoremap <silent> <Plug>SendToHarpoon3 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(3, vim.g['_cmd'])<cr> \ :call repeat#set("\<Plug>SendToHarpoon3", v:count)<cr>
nnoremap <silent> <Plug>SendToHarpoon4 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(4, vim.g['_cmd'])<cr> \ call repeat#set("\<Plug>SendToHarpoon4", v:count)<cr>
nmap <leader>lh  <Plug>SendToHarpoon1
nmap <leader>lj  <Plug>SendToHarpoon2
nmap <leader>lk  <Plug>SendToHarpoon3
nmap <leader>ll  <Plug>SendToHarpoon4

nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<cr>

nnoremap <C-h><C-h> :lua require("harpoon.term").gotoTerminal(1)<cr>i
nnoremap <C-j><C-j> :lua require("harpoon.term").gotoTerminal(2)<cr>i
nnoremap <C-k><C-k> :lua require("harpoon.term").gotoTerminal(3)<cr>i
nnoremap <C-l><C-l> :lua require("harpoon.term").gotoTerminal(4)<cr>i
]])

-- python cells
vim.keymap.set('n', '<leader>cO', 'O%%<esc>:norm gcc<cr>j', {noremap = true})
vim.keymap.set('n', '<leader>co', 'o%%<esc>:norm gcc<cr>k', {noremap = true})
vim.keymap.set('n', '<leader>c-', 'O<esc>77i-<esc>:norm gcc<cr>j', {noremap = true})

-- [[ slime ]]

-- markdown
vim.g.markdown_fenced_languages = { 'html', 'python', 'bash=sh', 'sql' }
vim.g.markdown_minlines = 50
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_page_title = "${name}"

--grepper
vim.g.grepper = {}
vim.g.grepper.tools = { 'ag', 'rg', 'git' }
vim.g.grepper.jump = 1
vim.g.grepper.next_tool = '<leader>g'
vim.g.grepper.simple_prompt = 1
vim.g.grepper.quickfix = 0
vim.keymap.set('n', '<leader>*', ':Grepper -tool ag -cword -noprompt<cr>', {noremap = true})
vim.keymap.set('n', '<leader>g', ':Grepper -tool ag<cr>', {noremap = true})

-- fasfold

vim.g.markdown_folding = 1
vim.g.python_folding = 1
vim.g.markdown_folding = 1
vim.g.tex_fold_enabled = 1
vim.g.vimsyn_folding = 'af'
vim.g.xml_syntax_folding = 1
vim.g.javaScript_fold = 1
vim.g.sh_fold_enabled= 7
vim.g.ruby_fold = 1
vim.g.perl_fold = 1
vim.g.perl_fold_blocks = 1
vim.g.r_syntax_folding = 1
vim.g.rust_fold = 1
vim.g.php_folding = 1
vim.keymap.set('n', 'zuz', '<Plug>(FastFoldUpdate)', {noremap = true})
vim.g.fastfold_savehook = 1
vim.g.fastfold_fold_command_suffixes =  { 'x','X','a','A','o','O','c','C' }
vim.g.fastfold_fold_movement_commands = {']z', '[z', 'zj', 'zk'}
vim.g.fastfold_savehook = 0
vim.cmd([[
augroup Fold
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
augroup END
]])

vim.g.SimpylFold_docstring_preview = 0
vim.g.SimpylFold_fold_docstring = 0
vim.b.SimpylFold_fold_docstring = 0
vim.g.SimpylFold_fold_import = 0
vim.b.SimpylFold_fold_import = 0
vim.g.SimpylFold_fold_blank = 0
vim.b.SimpylFold_fold_blank = 0

-- sets
vim.o.scrollback=20000
-- vim.o.guicursor=nil
-- vim.o.relativenumber = true
-- vim.o.nohlsearch = true
-- vim.o.hidden = true
-- vim.o.noerrorbells = true
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.expandtab = true
vim.o.smartindent = true
-- vim.o.number = true
-- vim.o.nowrap = true
-- vim.o.noswapfile = true
-- vim.o.nobackup = true
vim.o.undodir=os.getenv("HOME") .. '/.vim/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.termguicolors = true
-- vim.o.scrolloff=8
-- vim.o.signcolumn='no'
vim.o.cmdheight = 1
vim.o.timeoutlen = 220
vim.o.updatetime = 50
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.textwidth = 79
vim.o.cursorline = true
vim.o.colorcolumn = 80

vim.keymap.set('n', '<leader><cr>', ':source ~/.config/nvim/init.lua<cr>', {noremap = true})
vim.keymap.set('n', '<leader>rc', ':new ~/.config/nvim/init.lua<cr>', {noremap = true})


vim.cmd([[
augroup mmngreco
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre *.go GoFmt
    autocmd BufEnter *.dbout norm zR
    autocmd FileType markdown setl conceallevel=2 spl=en,es
    autocmd FileType make setl noexpandtab shiftwidth=4 softtabstop=0
    autocmd TermOpen * setl nonumber norelativenumber
augroup END

augroup black_stuff
    autocmd!
    " https://github.com/psf/black/issues/1293#issuecomment-623237094
    autocmd FileType python nnoremap <buffer> <F8> :silent !black -l79 -S %<CR><CR>
augroup end
]])



-- [[ slime ]]
vim.g.slime_bracketed_paste = 0
vim.g.slime_cell_delimiter = "#\\\\s*%%"
vim.g.slime_dont_ask_default = 1
vim.g.slime_no_mappings = 1
vim.g.slime_paste_file='~/.slime_paste'
vim.g.slime_target = "tmux"
vim.g.slime_bracketed_paste = 1
vim.g.slime_dont_ask_default = 1
vim.cmd([[
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
]])
vim.g.slime_no_mappings = 1
vim.keymap.set('n', '<leader>cv', ':SlimeConfig<cr>', {noremap = true})
vim.keymap.set('n', '<leader>e',  ':SlimeSend<cr>', {noremap = true})
vim.keymap.set('v', '<leader>e',  ':SlimeSend<cr>', {noremap = true})
vim.keymap.set('x', '<leader>cl', '<Plug>SlimeRegionSend', {noremap = true})
vim.keymap.set('n', '<leader>cp', ':SlimeParagraphSend', {noremap = true})
vim.keymap.set('n', '<leader>cc', ':SlimeCellsSendAndGoToNext', {noremap = true})
vim.keymap.set('n', '<leader>cj', ':SlimeCellsNext', {noremap = true})
vim.keymap.set('n', '<leader>ck', ':SlimeCellsPrev', {noremap = true})
vim.cmd([[
nmap <leader>cv <Plug>SlimeConfig
nmap <leader>cc <Plug>SlimeCellsSendAndGoToNext
nmap <leader>cj <Plug>SlimeCellsNext
nmap <leader>ck <Plug>SlimeCellsPrev
]])


vim.keymap.set('n', 'gV', '`[v`]', {noremap = true})
vim.keymap.set('n', '<leader>s', ':%s/<C-r><C-w>/<C-r><C-w>/gI<left><left><left>', {noremap = true})
vim.keymap.set('n', 'gs', ':%s//g<left><left>', {noremap = true})

vim.keymap.set('i', '<C-J>', '<esc>:.m+1 | startinsert<cr>', {noremap = true})
vim.keymap.set('i', '<C-K>', '<esc>:.m-2 | startinsert<cr>', {noremap = true})

vim.keymap.set('n', '<leader>k', ':m .-2<cr>==', {noremap = true})
vim.keymap.set('n', '<leader>j', ':m .+1<cr>==', {noremap = true})

vim.keymap.set('n', '<leader>cn', ':cnext<cr>', {noremap = true})
vim.keymap.set('n', '<leader>cp', ':cprev<cr>', {noremap = true})

vim.keymap.set('n', '<leader>gls', ':let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<cr>', {noremap = true})
vim.keymap.set('n', '<leader>gln', ':cnext<cr>:call search(g:_search_term)<cr>', {noremap = true})
vim.keymap.set('n', '<leader>glp', ':cprev<cr>:call search(g:_search_term)<cr>', {noremap = true})
vim.keymap.set('n', '<leader>sn', ':\'<,\'>!sort -n -k 2', {noremap = true})
vim.keymap.set('v', '<leader>s', ':\'<,\'>!sort -f<cr>', {noremap = true})
-- vim.o.isfname:append('@-@')
vim.keymap.set('v', '<leader>sf', ':!sqlformat -k upper -r -<cr>', {noremap = true})

-- to show hidden symbols characters in a file, :set list to show them.
vim.o.listchars='tab:→\\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»'
vim.keymap.set("n", "<leader>w", ":Git<cr>", {noremap = true})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
