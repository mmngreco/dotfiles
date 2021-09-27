let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" mmngreco
Plug 'mmngreco/dbee.nvim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-speeddating'

" Plug 'lazytanuki/nvim-mapper'
Plug 'numtostr/FTerm.nvim'

" ==== javascript
Plug 'gko/vim-coloresque'
Plug 'pangloss/vim-javascript'

" ==== telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" ==== telescope extensions
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fannheyward/telescope-coc.nvim'

" ==== lsp config
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'hrsh7th/nvim-compe'

" ==== syntax
Plug 'cespare/vim-toml'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-markdown'
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown'}
" Plug 'chrisbra/csv.vim'

" ==== thirdparty
Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }
Plug 'tyru/open-browser.vim'

" Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown'}
" Plug 'Scuilion/markdown-drawer', { 'for': 'markdown'}
Plug 'chrisbra/unicode.vim'
Plug 'mmngreco/slimux'
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mbbill/undotree'
Plug 'chriskempson/base16-vim'
Plug 'mileszs/ack.vim'
Plug 'goerz/jupytext.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
" Plug 'kristijanhusak/vim-dadbod-ui'
" Plug 'szymonmaszke/vimpyter' "vim-plug needs pip install notedown
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'stevearc/vim-rduino', { 'for': 'ino' }
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'jreybert/vimagit'  " git manager
" Plug 'blindFS/vim-taskwarrior'
" Plug 'lervag/vimtex'
" Plug 'joom/latex-unicoder.vim'

" ==== navegation
Plug 'ThePrimeagen/harpoon'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'junegunn/gv.vim'  " git commit browser (git log alternative)
Plug 'majutsushi/tagbar'
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Plug 'ervandew/supertab'
    " Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
" Plug 'liuchengxu/vista.vim'   " modern ctag
" Plug 'Konfekt/FastFold'

" ==== diagrams
Plug 'gyim/vim-boxdraw'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync(v:true) }}
" Plug 'heavenshell/vim-pydocstring'  "overwrites Ctrl-L shortcut

" ==== aspect
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'hoob3rt/lualine.nvim', {'commit': 'dc2c711'}
Plug 'mhinz/vim-startify'
" Plug 'ryanoasis/vim-devicons'

" ==== effective programming
Plug 'tpope/vim-fugitive'  " offers git commands in vim
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'  " gcc to comment
Plug 'tpope/vim-dadbod'  " database interface
Plug 'tpope/vim-dispatch'  " compiler + make = dispatch
Plug 'tpope/vim-rhubarb'  " allow open github urls
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-utils/vim-man'
Plug 'vuciv/vim-bujo'  " todos
Plug 'wellle/targets.vim'  " text wrapper: cin,
Plug 'thaerkh/vim-workspace'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'shumphrey/fugitive-gitlab.vim' " allow open gitlab url
Plug 'haorenW1025/completion-nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvie/vim-flake8'
Plug 'tweekmonster/impsort.vim'  " color and sort imports
" Plug 'neomake/neomake'
" Plug 'jiangmiao/auto-pairs' " Auto close parens, braces, brackets, etc
" Plug 'vim-scripts/VisIncr'
" Plug 'Shougo/neoinclude.vim', { 'for': 'cpp' }
" Plug 'ntpeters/vim-better-whitespace'
" Plug 'radenling/vim-dispatch-neovim'
" Plug 'ruanyl/vim-gh-line'
"
" ==== debugger plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'johngrib/vim-game-code-break'

call plug#end()



" ==== custom settings
syntax on " Enable syntax highlighting.
" dissabling syntax highlighting when it's a diff
if &diff
    syntax off
endif

filetype plugin indent on  " Enable file type based indentation.
" filetype plugin on

let loaded_matchparen = 1  " allow usage of local vimrc in projects
let mapleader = " "
" let g:loaded_python_provider = 1
let g:python3_host_prog = 'python3'
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
    " highlight LineNr guifg=#ff8659
    " highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd
endfun
call ColorMyPencils()

" Vim with me
nnoremap <leader>vwm :call ColorMyPencils()<CR>
nnoremap <leader>vwb :let g:my_colorscheme =

" nnoremap <C-w> :wa<cr>
nnoremap <leader>q :wqa<cr>

" title underline
nnoremap <leader>tu <esc>VypVr-

" edit ini.vim
nnoremap <leader>vrc :tabedit ~/.config/nvim/init.vim<CR>

" reload vimrc
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" exit from terminal mode
tnoremap <Esc> <C-\><C-n>

" resize window
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
" maximizes current window
nnoremap <leader>rp :resize 100<CR>

" add bash dead
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
nnoremap <leader>pv :Ex<CR>

" snippets in pure vim
" nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
" nnoremap <Leader>cpu a%" PRIu64 "<esc>
nnoremap <leader>dow :put =strftime(\"## %A %Y-%m-%d\")<cr><esc>j
nnoremap <leader>dt :put =strftime(\"%Y-%m-%d\ttt\tww\tbb\tcc\")<cr><esc>

" yank/paste
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
" paste last copied/yanked
nnoremap <leader>pl "0p
vnoremap <leader>p "_dP
nnoremap <leader>YY gg"+yG
" yank current file's path
nnoremap <leader>yp :let @+ = expand("%:p")<cr>

com! W w

" ==== theprimeagen
" https://www.youtube.com/watch?v=hSHATqh8svM

nnoremap <leader>Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

inoremap <Left> <c-g>U<Left>
inoremap <Right> <c-g>U<Right>

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>
" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
" nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" moves selected lines down/up
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv

" bug here!
" inoremap <C-j> <esc>:m .+1<cr>==
" inoremap <C-k> <esc>:m .-2<cr>==
" nnoremap <leader>k :m .-2<cr>==
" nnoremap <leader>j :m .+1<cr>==

nnoremap <leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<cr>
nnoremap <leader>gln :cnext<cr>:call serach(_search_term)<cr>
nnoremap <leader>glp :cprev<cr>:call serach(_search_term)<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprev<cr>

" scrum get date from title
nnoremap <leader>nt ?##<cr>yy<C-o>pj2dwA

" Sort lines in alphabetical order
vnoremap <leader>s :'<,'>!sort -f<cr>
nnoremap <leader>f :StripWhitespace<cr>

highlight CursorLine term=bold cterm=bold guibg=Grey40
highlight NonText ctermbg=none
highlight Normal  ctermbg=none

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup mmngreco
    autocmd!
    " unfold by default
    autocmd BufRead * normal zR
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs,*.py :lua require'lsp_extensions'.inlay_hints{}
    autocmd FileType markdown setl conceallevel=2 spl=en,es
    " makefiles indentation
    autocmd FileType make setl noexpandtab shiftwidth=8 softtabstop=0
augroup END


" ==== black
" https://github.com/psf/black/issues/1293#issuecomment-623237094
au FileType python nnoremap <buffer> <F8> :silent !black -l79 -S %<CR><CR>
au FileType python vnoremap <buffer> <F8> :silent !black -l79 -c '<,'><CR><CR>

" ==== indents
nnoremap <F9> :setl noai nocin nosi inde=<CR>
nnoremap <F10> :setl ai cin si inde=<CR>

" ==== source plugin conf
source $DOTFILES/vim/plugins/sets.vim
source $DOTFILES/vim/plugins/lualine.vim
" source $DOTFILES/vim/plugins/arduino.vim
source $DOTFILES/vim/plugins/bujo.vim
source $DOTFILES/vim/plugins/carbon.vim
source $DOTFILES/vim/plugins/commentary.vim
" source $DOTFILES/vim/plugins/fastfold.vim
source $DOTFILES/vim/plugins/fugitive.vim
source $DOTFILES/vim/plugins/functions.vim
source $DOTFILES/vim/plugins/harpoon.vim
source $DOTFILES/vim/plugins/impsort.vim
source $DOTFILES/vim/plugins/jupytext.vim
" source $DOTFILES/vim/plugins/latex_unicoder.vim
source $DOTFILES/vim/plugins/lsp.vim
source $DOTFILES/vim/plugins/markdown.vim
source $DOTFILES/vim/plugins/navegation.vim
source $DOTFILES/vim/plugins/netrw.vim
source $DOTFILES/vim/plugins/nvim-tree.vim
source $DOTFILES/vim/plugins/pydocstring.vim
source $DOTFILES/vim/plugins/slimux.vim
source $DOTFILES/vim/plugins/tagbar.vim
source $DOTFILES/vim/plugins/telescope.vim
source $DOTFILES/vim/plugins/test.vim
" source $DOTFILES/vim/plugins/treesitter.vim
source $DOTFILES/vim/plugins/vimspector.vim
source $DOTFILES/vim/plugins/vsnip.vim
source $DOTFILES/vim/plugins/fterm.vim
source $DOTFILES/vim/plugins/workspace.vim
source $DOTFILES/vim/plugins/dbee.vim

" TODO move to functions.vim
let g:show_hidden_symbols=1
function! ShowHidenSymbols()
    if g:show_hidden_symbols
        set listchars=tab:▸\ ,eol:¬,space:·
        let g:show_hidden_symbols=0
    else
        set listchars=tab:>\ ,trail:-,nbsp:+
        let g:show_hidden_symbols=1
    endif
endfunction


let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

autocmd TermOpen * setlocal nonumber norelativenumber
