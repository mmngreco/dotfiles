
" ============   PLUGINS ============
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

call plug#begin()

    " Plug 'Shougo/neoinclude.vim'
    " Plug 'neomake/neomake'
    Plug 'scrooloose/nerdtree'
    " Plug 'ivalkeen/nerdtree-execute'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
    " Plug 'Nopik/vim-nerdtree-direnter'
    Plug 'vim-scripts/VisIncr'
    Plug 'kien/ctrlp.vim'
    Plug 'majutsushi/tagbar'
    Plug 'xolox/vim-session'
        Plug 'xolox/vim-misc'

    " Auto close parens, braces, brackets, etc
    Plug 'jiangmiao/auto-pairs'

    " Plug 'luochen1990/rainbow'
    Plug 'flazz/vim-colorschemes'
    Plug 'arakashic/chromatica.nvim'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'altercation/vim-colors-solarized'

    Plug 'christoomey/vim-tmux-navigator'
    Plug 'epeli/slimux'
    Plug 'godlygeek/tabular'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sensible'

    "=== ultisnips
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    Plug 'tpope/vim-abolish'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-unimpaired'
    Plug 'airblade/vim-gitgutter'
    Plug 'mbbill/undotree'
    " Plug 'rhysd/vim-grammarous'
    " Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vimwiki/vimwiki'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'Yggdroot/indentLine'
    Plug 'plasticboy/vim-markdown'
    " Plug 'iamcco/markdown-preview.vim', { 'do': 'cd app & yarn install'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync(v:true) }}

    Plug 'kshenoy/vim-signature'  " add tag into lines
    " Plug 'xolox/vim-notes'
        " Plug 'xolox/vim-misc'
    Plug 'tpope/vim-surround'

    " Plug 'zchee/deoplete-clang'

    Plug 'mattn/gist-vim'
       Plug 'mattn/webapi-vim'
    " Plug 'cjrh/vim-conda'

    Plug 'nvie/vim-flake8'
       Plug 'davidhalter/jedi-vim'
    Plug 'tweekmonster/impsort.vim'  " color and sort imports
    " Plug 'tell-k/vim-autopep8'
    Plug 'heavenshell/vim-pydocstring'
    " Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh',  }

    Plug 'bronson/vim-trailing-whitespace'
    " Plug 'jpalardy/vim-slime'

    " Plug 'ErichDonGubler/vim-sublime-monokai'
    " Plug 'jalvesaq/vimcmdline'
    Plug 'junegunn/fzf'
call plug#end()

" let g:python3_host_prog = '$CONDA_PYTHON_EXE'
let g:python3_host_prog = 'python'

" habit
" let mapleader = ","
" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Searching
nnoremap / /\v
vnoremap / /\v

" [scrooloose/nerdcommenter]
" Don't be too smart across lines
let g:AutoPairsMultilineClose=0
" Don't insert extra spaces
let g:AutoPairsMapSpace=0
" accelerated scrolling
set scrolljump=-15

" jedi options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0

" Replace <Esc> with C-c
inoremap <F1> <Esc>
inoremap <C-c> <Esc>
nnoremap <C-c> :wa<cr>
" nnoremap <C-c> :q<cr>

" quickly cancel search highlighting
nnoremap <leader><space> :nohlsearch<cr>

" Strip all trailing whitespace
nnoremap <leader>f :StripWhitespace<cr>

set ignorecase
set smartcase
" Highlight the line the cursor is on.
set cursorline

" Toggle NerdTree
nnoremap <leader>a :NERDTreeToggle<cr>

" I type Wq more often than wq
cmap Wq wq
"
" show the cursor position all the time
set ruler
"

" Column limits
set textwidth=110
set colorcolumn=110
" Toggle between column widths
nnoremap <leader>c :call ToggleColumnWidth()<cr>
let g:wide_column = 1
function! ToggleColumnWidth()
    if g:wide_column
        set textwidth=80
        set colorcolumn=80
        let g:wide_column = 0
    else
        set textwidth=110
        set colorcolumn=110
        let g:wide_column = 1
    endif
endfunction

" Sort lines in alphabetical order
" vnoremap <leader>s :'<,'>!sort -f<cr>

" FZF
if executable('fzf')
    nnoremap <C-p> :FZF<cr>
endif

" Git status
nnoremap <leader>w :Gstatus<cr>

" ===========================================================================
" LSP and autocomplete
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
"
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" " found' messages
" set shortmess+=cI
" nnoremap <leader>e :LspHover<cr>
" nnoremap <leader>d :LspDefinition<cr>
" ===========================================================================

" Don't use Ex mode, use Q for formatting
map Q gq
" set clipboard=unnamed
set clipboard=unnamedplus
highlight ColorColumn ctermbg=gray

" read/write file when switching buffers
set autowrite
set autoread
set colorcolumn=80
set expandtab

set fillchars+=vert:\  " remove chars from seperators
set hidden
set laststatus=2

set noshowcmd
set noshowmode  " keep command line clean
set nu

set shiftwidth=4
set smartcase  " better case-sensitivity when searching
set softtabstop=4
set tabstop=4

set undodir="$HOME/.vim/undodir"
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload

set cmdheight=1

filetype indent on
filetype plugin on

nmap <silent> <C-d> <Plug>(pydocstring)
" =============================================================================
" ===   DEFAULT CONFIGURATION
" ===   - Typing
" ===   - Colorscheme
" ===   - Plugins
" ===   - Mappings
" =============================================================================

highlight Normal  ctermbg=none
highlight NonText ctermbg=none
" set runtimepath+=~/.config/nvim/plugins/deoplete.nvim


" === deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#jedi#show_docstring = 1
" let g:deoplete#sources#jedi#server_timeout = 60
" let g:python3_host_prog = '$CONDA_PYTHON_EXE'

" === echodoc
" let g:echodoc_enable_at_startup="1"
" let g:echodoc_type='echo'


" ==========  UltiSnips  ==========
"
"
" === jedi settings"
" " Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#show_call_singatures= 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ''

" ==========  UltiSnips  ==========
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="$HOME/.config/nvim/plugged/vim-snippets/UltiSnips"
" let g:UltiSnipsSnippetDirectories=["UltiSnipsNewDir"]
let g:Ultisnips_python_style="sphinx"


" ==========  PyDocstrign  ==========
let g:pydocstring_templates_dir='$HOME/.config/nvim/plugged/vim-pydocstring/test/templates/numpy'

" ========== MARKDOWN-PREVIEW ===========
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_page_title = '${name}'

" ========= MARKDOWN-SYNTAX ============
" autocmd BufNewFile,BufRead *.{md,mark*} set filetype=markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" ==========  Language Client Server  ==========
" let g:LanguageClient_loggingLevel = 'DEBUG'
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'

" ==========  SLIMUX  ==========
let g:slimux_python_use_ipython = 0
" let g:slimux_tmux_path = "/usr/local/bin/tmux"
let g:slimux_tmux_path = "/usr/bin/tmux"
map <Leader>e :SlimuxREPLSendLine<CR>
vmap <Leader>e :SlimuxREPLSendSelection<CR>
let maplocalleader="\<space>"
let g:slime_target = "tmux"


" ===================  COMMANDS   ==================
function Latexize()
   :silent !pdflatex ./report.tex --output-directory=./tmp
   :silent !bibtex ./report
   :silent !makeindex report.idx
   :silent !pdflatex ./report.tex --output-directory=./tmp
   :redraw!
endfunction

"command Latexize_small execute "silent !pdflatex ./report.tex --output-directory=./tmp"
" ===================  MAPPINGS   ==================
" map <C-l> 1@l
" map <C-L> 1@v
" map <C-p> 1@p
" map <C-i> 1@i
" map <C-c> 1@c
" map <F2>  \l<CR>
" map <F5>  : TagbarToggle<CR><C-w><C-w>
" map <F8>  :! ./modelsim.fdo &<CR>
" map <F9> :silent !pdflatex ./report.tex --output-directory=./tmp<CR>:redraw!<CR>
" map <F10>  :exec Latexize()<CR>
" map <F12> :! evince ./*.pdf &<CR><CR>
" set rtp+=/Users/mmngreco/.local/lib/python3.6/site-packages/powerline/bindings/vim/
" autocmd! BufWritePost * Neomake
" autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'
" au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" :set syntax=markdown
tnoremap <Esc> <C-\><C-n>

" === NerdTree
" autocmd vimenter * NERDTree
" toggle nerdtree on ctrl+n
" let NERDTreeMapOpenInTab='<ENTER>'
map <C-n> :NERDTreeToggle<CR>
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>

" === Porwerline
" let g:powerline_pycmd = 'py3'
" let g:powerline_pyeval = '/usr/bin/python3'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
" let g:airline_theme = 'raven'
" let g:airline_theme = 'monochrome'

" === vimwiki
" Wiki settings
let g:vimwiki_global_ext=0
let g:wiki_default = {}
let g:wiki_default.auto_export = 0
let g:wiki_default.auto_toc = 0
let g:wiki_default.syntax = 'markdown'
let g:wiki_default.ext = '.md'
" let g:wiki_default.diary_rel_path = 'log/'  

let g:sh_wiki = copy(g:wiki_default)
let g:sh_wiki.path = '$HOME/vimwiki/'

let g:guidelines_wiki = copy(g:wiki_default)
let g:guidelines_wiki.path = '$HOME/gitlab/mgreco/guidelines.wiki/'

let g:vimwiki_list = [g:sh_wiki, g:guidelines_wiki]

" === Language Client Server
" https://github.com/palantir/python-language-server/issues/374
" let g:LanguageClient_serverCommands = {
"     \ 'python': ['python3', '-m', 'pyls', '--log-file', '/tmp/pyls.log', '-v'],
"     \ }
" let g:lsp_virtual_text_enabled = 1
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" ===   - Colorscheme
" colorscheme molokai
" colorscheme sublimemonokai
" colorscheme lucius
" colorscheme lucid
" colorscheme Benokai
" colorscheme gruvbox
" colorscheme ayu
" colorscheme smyck
colorscheme mustang
" set conceallevel=0
