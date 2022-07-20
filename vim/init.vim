" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.venv/*
set wildignore+=**/venv/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" set ttymouse=xterm2
" set mouse=a
set mouse=nv

let loaded_matchparen = 1  " allow usage of local vimrc in projects
let mapleader = " "
let g:loaded_python_provider = 1
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
" let g:python3_host_prog = 'python'

" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin()

" Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'rcarriga/nvim-notify'
" Plug 'aquach/vim-mediawiki-editor'
Plug 'fatih/vim-go'

" Plug 'skanehira/denops-docker.vim'
" Plug 'vim-denops/denops.vim'
" Vim Script
" Plug 'AndrewRadev/exercism.vim'
" Plug 'jbyuki/nabla.nvim'
" Plug 'folke/trouble.nvim'
Plug 'sbdchd/neoformat'
" Plug 'alec-gibson/nvim-tetris'
" Plug 'sunjon/shade.nvim'
" Plug 'tversteeg/registers.nvim', { 'branch': 'main' }

" TODO change to luasnip
" Plug 'L3MON4D3/LuaSnip'

Plug 'ckipp01/nvim-jenkinsfile-linter'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
" Plug 'willchao612/vim-diagon'
Plug 'cespare/vim-toml'
" Plug 'chipsenkbeil/distant.nvim'
Plug 'chrisbra/csv.vim'
" Plug 'chrisbra/unicode.vim'
" Plug 'chriskempson/base16-vim'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'flazz/vim-colorschemes'
Plug 'gko/vim-coloresque'  " show color of an color expression (hex, rgb)
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'godlygeek/tabular'
Plug 'goerz/jupytext.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'gyim/vim-boxdraw'
Plug 'hoob3rt/lualine.nvim'
" Plug 'hoschi/yode-nvim'
Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'itchyny/calendar.vim'
" Plug 'johngrib/vim-game-code-break'
" Plug 'joom/latex-unicoder.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
" Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'lambdalisue/suda.vim'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mbbill/undotree'
" Plug 'mboughaba/i3config.vim'
" Plug 'mfussenegger/nvim-dap'
" Plug 'Microsoft/vscode-python'
" Plug 'mmngreco/dbee.nvim'
" Plug 'mmngreco/DrawIt'
Plug 'mmngreco/slimux'
" Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown'}
" Plug 'neomake/neomake'
Plug 'neovim/nvim-lspconfig'
Plug 'numToStr/Comment.nvim'
" Plug 'numtostr/FTerm.nvim'
Plug 'nvie/vim-flake8'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug pangloss/vim-javascript'
" Plug 'puremourning/vimspector'
" Plug 'radenling/vim-dispatch-neovim'
" Plug 'rcarriga/nvim-dap-ui'
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
" Plug 'renerocksai/telekasten.nvim'
" Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }
" Plug 'ruanyl/vim-gh-line'
Plug 'sainnhe/gruvbox-material'
Plug 'sbdchd/neoformat'
" Plug 'Scuilion/markdown-drawer', { 'for': 'markdown'}
" Plug 'Shougo/neoinclude.vim', { 'for': 'cpp' }
Plug 'shumphrey/fugitive-gitlab.vim' " allow open gitlab url
" Plug 'simrat39/symbols-outline.nvim'
" Plug 'stevearc/vim-arduino', { 'for': 'ino' }
Plug 'szw/vim-maximizer'
" Plug 'thaerkh/vim-workspace'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/refactoring.nvim'
" Plug 'ThePrimeagen/vim-be-good'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dadbod'  " database interface
Plug 'tpope/vim-dispatch'  " compiler + make = dispatch
Plug 'tpope/vim-fugitive'  " offers git commands in vim
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'  " allow open github urls
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'  " better netrw
" Plug 'tweekmonster/impsort.vim'  " color and sort imports
Plug 'tyru/open-browser.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-test/vim-test'
" Plug 'vim-utils/vim-man'
" Plug 'vuciv/vim-bujo'  " todos
Plug 'wellle/targets.vim'  " text wrapper: cin,
Plug 'williamboman/nvim-lsp-installer'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()



" ==== custom settings
syntax on " Enable syntax highlighting.
" dissabling syntax highlighting when it's a diff
if &diff
    syntax off
endif

" filetype plugin indent on  " Enable file type based indentation.
" filetype plugin on

" let g:python_host_prog = $PYTHON_NEOVIM

" color theme
" https://github.com/awesome-streamers/awesome-streamerrc
" https://shorturl.at/cxUX3
" let g:my_colorscheme = "ayu"
let g:my_colorscheme = "gruvbox"
fun! ColorMyPencils()
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection='0'

    set background=dark
    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:my_colorscheme])
    else
        " TODO: What the way to use g:my_colorscheme
        colorscheme gruvbox
    endif

    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none

    highlight CursorLine term=bold cterm=bold guibg=Grey40
    highlight NonText ctermbg=none
    highlight Normal  ctermbg=none

    " highlight LineNr guifg=#ff8659
    " highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    highlight NonText guifg=#5eacd3
    hi TelescopeBorder guifg=#5eacd3
endfun
call ColorMyPencils()

" for gruvbox
hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
hi tkBrackets ctermfg=gray guifg=gray

" Vim with me
nnoremap <leader>vwm :call ColorMyPencils()<CR>
nnoremap <leader>vwb :let g:my_colorscheme =

nnoremap <silent> <Plug>RandNorm :read! python3 -c "import random; print(random.gauss(0, 1))"<cr> \ :call repeat#set("\<Plug>RandNorm", v:count)<cr>
nmap <C-g><C-r> <Plug>RandNorm

" tnoremap <leader>q :wqa<cr>


" underline current line
nnoremap <leader>tu <esc>Vypv$r-

" edit ini.vim
nnoremap <leader>rc :tabedit ~/.config/nvim/init.vim<CR>

" reload vimrc
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" exit from terminal mode
tnoremap <Esc> <C-\><C-n>

" resize window
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
" maximizes current window
nnoremap <leader>rp :resize 100<CR>

" add bash dead shbang!
nnoremap <leader>sh :1<cr>O#!/usr/bin/env bash<esc>

" ==== todo list
command! Gtodo noautocmd vimgrep /TODO\|FIXME\|!!!\|???\|NOBUG\|HACK\|IDEA\|TODOC\|BUG\|XXX/j **/*.{py,md,txt} | cw

" task boxes
nnoremap <leader>ta I- [ ]<space><esc>
nnoremap <leader>tx :s/- \[ \?\]/- [x]/<CR>

" get help
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
" nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" searches
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>

" explore with netrw
nnoremap <leader>pv :Ex %:h<CR>

" snippets in pure vim
"
" nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
" nnoremap <Leader>cpu a%" PRIu64 "<esc>
nnoremap <leader>dow :put =strftime(\"## %A %Y-%m-%d\")<cr><esc>j
nnoremap <leader>ddt :put =strftime(\"%Y-%m-%d\ttt\tww\tbb\tcc\")<cr><esc>

" yank/paste
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
" paste last copied/yanked
nnoremap <leader>pl "0p
vnoremap <leader>p "_dP
nnoremap <leader>Y y$
nnoremap <leader>YY gg"+yG

" nnoremap <leader>d "_d
" vnoremap <leader>d "_d
" yank current file's path
nnoremap <leader>yf :let @+ = expand("%:p")<cr>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" common typo
com! W w
com! W2 w


" ==== theprimeagen
" https://www.youtube.com/watch?v=hSHATqh8svM

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

inoremap <Left> <c-g>U<Left>
inoremap <Right> <c-g>U<Right>

" smart replace
nnoremap <leader>s :%s/<C-r><C-w>/<C-r><C-w>/gI<left><left><left>
nnoremap gs :%s//g<left><left>
" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
" nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" moves selected lines down/up
"
" below is commented due to problems with {{cookiecutter}} directories
" set wildignorecase
"
" select previous selection
noremap gV `[v`]

" I don't use below very often and but I do use J to join many lines
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv
" https://vi.stackexchange.com/a/14683
inoremap <c-j> <esc>:.m+1 \| startinsert<cr>
inoremap <c-k> <esc>:.m-2 \| startinsert<cr>
nnoremap <leader>k :m .-2<cr>==
nnoremap <leader>j :m .+1<cr>==

nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprev<cr>
nnoremap <leader>gls :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<cr>
nnoremap <leader>gln :cnext<cr>:call search(g:_search_term)<cr>
nnoremap <leader>glp :cprev<cr>:call search(g:_search_term)<cr>


" sort numerically according 2nd column
nnoremap <leader>sn :'<,'>!sort -n -k 2
" Sort lines in alphabetical order
vnoremap <leader>s :'<,'>!sort -f<cr>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 40})
augroup END

augroup mmngreco
    autocmd!
    " unfold by default
    " autocmd BufRead * normal zR
    " removes spaces at the end of a line
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre *.go GoFmt

    " autocmd BufEnter,BufWinEnter,TabEnter *.rs,*.py :lua require'lsp_extensions'.inlay_hints{}
    autocmd FileType markdown setl conceallevel=2 spl=en,es
    " makefiles indentation
    autocmd FileType make setl noexpandtab shiftwidth=4 softtabstop=0

    " ==== black
    " https://github.com/psf/black/issues/1293#issuecomment-623237094
    autocmd FileType python nnoremap <buffer> <F8> :silent !black -l79 -S %<CR><CR>
    autocmd FileType python vnoremap <buffer> <F8> :silent !black -l79 -c '<,'><CR><CR>

    " remove numbers from terminal buffer
    autocmd TermOpen * setl nonumber norelativenumber

    " autocmd FileType python nnoremap <buffer> [[ ?^class\\|^\s*def<CR>
    " autocmd FileType python nnoremap <buffer> ]] /^class\\|^\s*def<CR>
augroup END

" ==== source plugin conf
"
source $DOTFILES/vim/plugins/sets.vim
source $DOTFILES/vim/plugins/netrw.vim
source $DOTFILES/vim/plugins/functions.vim

" source $DOTFILES/vim/plugins/arduino.vim
" source $DOTFILES/vim/plugins/bujo.vim
source $DOTFILES/vim/plugins/carbon.vim
source $DOTFILES/vim/plugins/commentary.vim
" source $DOTFILES/vim/plugins/dbee.vim
" source $DOTFILES/vim/plugins/drawit.vim
source $DOTFILES/vim/plugins/fugitive.vim
source $DOTFILES/vim/plugins/harpoon.vim
source $DOTFILES/vim/plugins/impsort.vim
source $DOTFILES/vim/plugins/jupytext.vim
source $DOTFILES/vim/plugins/lsp.vim
source $DOTFILES/vim/plugins/lualine.vim
source $DOTFILES/vim/plugins/markdown.vim
source $DOTFILES/vim/plugins/navegation.vim
source $DOTFILES/vim/plugins/neoformat.vim
source $DOTFILES/vim/plugins/pydocstring.vim
source $DOTFILES/vim/plugins/slimux.vim
source $DOTFILES/vim/plugins/tagbar.vim
source $DOTFILES/vim/plugins/telescope.vim
source $DOTFILES/vim/plugins/test.vim
" source $DOTFILES/vim/plugins/vimspector.vim
source $DOTFILES/vim/plugins/vsnip.vim
source $DOTFILES/vim/plugins/workspace.vim
" source $DOTFILES/vim/plugins/yode.vim

lua require'nvim-treesitter.configs'.setup { indent = { enable = false }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
let g:user_emmet_settings = {
            \ 'svelte' : { 'extends' : 'html', },
            \}

nnoremap <c-s> :SymbolsOutline<cr>

command! -range -nargs=0 Space2Tab execute '<line1>,<line2>s#\(\s\+\)#\t#g'

function! Cwd() abort
    return fnamemodify(getcwd(), ':t')
endfunction


" === live preview
let g:livepreview_engine = 'xelatex'
let g:livepreview_previewer = 'evince'
" let g:vimtex_compiler_generic = 'xelatex'
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \}

" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <leader>h :TmuxNavigateLeft<cr>
" nnoremap <silent> <leader>j :TmuxNavigateDown<cr>
" nnoremap <silent> <leader>k :TmuxNavigateUp<cr>
" nnoremap <silent> <leader>l :TmuxNavigateRight<cr>
" nnoremap <silent> <leader>ll :TmuxNavigatePrevious<cr>
" nnoremap  <c-t><c-s> :Telescope tmux sessions<cr>
" go substitute because the default map for sleeping is silly

" format sql parse
vn <leader>sf :!sqlformat -k upper -r -<cr>

nn <leader>cal :Calendar -view=year -split=vertical -width=27 -first_day=monday<cr>
nn <leader>day :Calendar -first_day=monday<cr>

nnoremap <leader>m :MaximizerToggle!<CR>


" ============================================================================
" === diagon : diagram
" noremap <Leader>D :Diagon<Space>
" noremap <Leader>dm :Diagon Math<CR>
" noremap <Leader>ds :Diagon Sequence<CR>
" noremap <Leader>dt :Diagon Tree<CR>


" ============================================================================
" === fold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:rst_fold_enabled = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:zsh_fold_enable = 1
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:python_fold = 1
let g:php_folding = 1
let g:fortran_fold=1
let g:clojure_fold = 1
let g:baan_fold=1
augroup Fold
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
augroup END

let g:SimpylFold_docstring_preview = 0
let g:SimpylFold_fold_docstring = 0
let b:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
let b:SimpylFold_fold_import = 0
let g:SimpylFold_fold_blank = 0
let b:SimpylFold_fold_blank = 0

" ============================================================================
" " === trouble
" lua << EOF
"   require("trouble").setup {
"     -- your configuration comes here
"     -- or leave it empty to use the default settings
"     -- refer to the configuration section below
"   }
" EOF
"
" nnoremap <leader>xx <cmd>TroubleToggle<cr>
" nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
" nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
" nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
" nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
" nnoremap gR <cmd>TroubleToggle lsp_references<cr>


" ============================================================================
" " === shade
" lua << EOF
" require('shade').setup({
"   overlay_opacity = 50,
"   opacity_step = 1,
"   keys = {
"     brightness_up    = '<C-Up>',
"     brightness_down  = '<C-Down>',
"     toggle           = '<Leader>t',
"   }
" })
" EOF
"

" nnoremap <leader>p :lua require("nabla").popup()<CR>
" nnoremap <leader>asc :let s = system(join(["asciiTeX", '"', getline('.'), '"'])) | echo s<cr>

lua << EOF
require'nvim-web-devicons'.setup {
 default = true;
}
EOF


" refactoring
"
lua << EOF
require('refactoring').setup({
    prompt_func_return_type = {
        go = false,
        java = false,

        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    },
    prompt_func_param_type = {
        go = false,
        java = false,

        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
})
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

EOF
