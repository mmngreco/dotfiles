
" ============   PLUGINS ============
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

call plug#begin()

    Plug 'Shougo/neoinclude.vim'
    Plug 'neomake/neomake'
    Plug 'scrooloose/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        " Plug 'ivalkeen/nerdtree-execute'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
        " Plug 'Nopik/vim-nerdtree-direnter'
    Plug 'kien/ctrlp.vim'
    Plug 'majutsushi/tagbar'

    " ==== vim enhances
    Plug 'vim-scripts/VisIncr'
    Plug 'mhinz/vim-startify'
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

    Plug 'thaerkh/vim-workspace'
    " Plug 'xolox/vim-session'
    "     Plug 'xolox/vim-misc'

    Plug 'wellle/targets.vim'
    Plug 'jiangmiao/auto-pairs' " Auto close parens, braces, brackets, etc
    Plug 'godlygeek/tabular'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sensible'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'Yggdroot/indentLine'

    " ===== cmd
    Plug 'skywind3000/asyncrun.vim'

    " =========== colors
    Plug 'flazz/vim-colorschemes'
    Plug 'arakashic/chromatica.nvim'

    " =========== icons
    Plug 'ryanoasis/vim-devicons'

    " ===== tmux
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'epeli/slimux'


    "=== ultisnips
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " ==== status bar
    Plug 'itchyny/lightline.vim'

    "=== git
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-fugitive'
    " Plug 'airblade/vim-gitgutter'
    Plug 'mhinz/vim-signify'
    Plug 'jreybert/vimagit'
    Plug 'tpope/vim-abolish'
    Plug 'mbbill/undotree'

    "==== syntax
    Plug 'tpope/vim-unimpaired'
    Plug 'kshenoy/vim-signature'  " add tag into lines
    " Plug 'xolox/vim-notes'
        " Plug 'xolox/vim-misc'
    Plug 'tpope/vim-surround'
    " Plug 'rhysd/vim-grammarous'

    " ==== Task warrior
    " Plug 'blindFS/vim-taskwarrior'
    Plug 'soywod/kronos.vim'

    " ==== vim wiki
    Plug 'vimwiki/vimwiki'

    " ==== vim markdown
    " Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown'}
    " Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown'}
    Plug 'Scuilion/markdown-drawer', { 'for': 'markdown'}
    Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown'}
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown'}
    " Plug 'iamcco/markdown-preview.vim', { 'do': 'cd app & yarn install'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync(v:true) }}
    Plug 'gyim/vim-boxdraw'

    " ==== latex
    Plug 'lervag/vimtex'

    " ==== gist github
    Plug 'mattn/gist-vim'
       Plug 'mattn/webapi-vim'

    " ==== clang related
    Plug 'zchee/deoplete-clang'

    " ==== python related
    Plug 'cjrh/vim-conda'
    Plug 'janko/vim-test'
        Plug 'tpope/vim-dispatch'
        Plug 'benmills/vimux'
    Plug 'psf/black'
    Plug 'nvie/vim-flake8'
       Plug 'davidhalter/jedi-vim'
    Plug 'tweekmonster/impsort.vim'  " color and sort imports
    " Plug 'tell-k/vim-autopep8'
    Plug 'heavenshell/vim-pydocstring'
    Plug 'bronson/vim-trailing-whitespace'
    " Plug 'jpalardy/vim-slime'
    " Plug 'jalvesaq/vimcmdline'
    " documentation
    Plug 'rhysd/devdocs.vim'

    " ====== searching
    Plug 'junegunn/fzf'
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

call plug#end()

" let g:python3_host_prog = '$CONDA_PYTHON_EXE'
" let g:python3_host_prog = 'python'

" habit
let mapleader = ","
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
cmap wQ wq
cmap WQ wq
cmap w!! w suda://%
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
set number
set relativenumber

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

" =============== If a file change then reaload it
" https://unix.stackexchange.com/a/383044
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

" ==========  UltiSnips  ==========
"
"
"
" ========== indentLines ==========
" autocmd FileType markdown,md let g:indentLine_enabled=0
" autocmd FileType markdown setl conceallevel=0
autocmd FileType markdown set conceallevel=0
let g:indentLine_fileTypeExclude = ['markdown']

" === jedi settings"
" " Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization=1
let g:jedi#show_call_singatures=1
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration=0
let g:jedi#smart_auto_mappings=0
let g:jedi#popup_on_dot=0
let g:jedi#completions_command=''

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

" ========== vim-sessions ===========
let g:session_autoload = 'yes'
nnoremap <leader>s :ToggleWorkspace<CR>

" ========== vim-workspace =========
let g:workspace_autosave_always = 1

" ========= MARKDOWN-SYNTAX ============
" autocmd BufNewFile,BufRead *.{md,mark*} set filetype=markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_override_foldtext=0
let g:vim_markdown_folding_level=6
let g:vim_markdown_toc_autofit=1
let g:vim_markdown_conceal=0
let g:tex_conceal=""
let g:vim_markdown_math=1


" ==========  SLIMUX  ==========
let g:slimux_python_use_ipython=0
" let g:slimux_tmux_path = "/usr/local/bin/tmux"
let g:slimux_tmux_path="/usr/bin/tmux"
map <Leader>e :SlimuxREPLSendLine<CR>
vmap <Leader>e :SlimuxREPLSendSelection<CR>
let maplocalleader="\<space>"
let g:slime_target="tmux"

" ==== devdocs
nmap K <Plug>(devdocs-under-cursor)
let g:devdocs_filetype_map = {
    \   'ruby': 'rails',
    \   'javascript.jsx': 'react',
    \   'javascript.test': 'chai',
    \   'python': 'python',
    \   'cpp': 'cpp',
    \ }

" ===================  COMMANDS   ==================
" function Latexize()
"    :silent !pdflatex ./report.tex --output-directory=./tmp
"    :silent !bibtex ./report
"    :silent !makeindex report.idx
"    :silent !pdflatex ./report.tex --output-directory=./tmp
"    :redraw!
" endfunction
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

" === airline status bar
" let g:powerline_pycmd = 'py3'
" let g:powerline_pyeval = '/usr/bin/python3'
" let g:airline#extensions#tabline#enabled = 0
" let g:airline_powerline_fonts = 1
" let g:airline_theme = 'murmur'
" let g:airline_theme = 'minimalist'
" let g:airline_detect_iminsert=0
" let g:airline_detect_spelllang=1
" let g:airline_detect_crypt=0
" let g:airline_detect_paste=0
" let g:airline_detect_modified=0
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" ===== Task warrior
" default task report type
let g:task_report_name     = 'next'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = []
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
let g:task_readonly        = 0
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" allows user to override task configurations. Seperated by space. Defaults to ''
let g:task_rc_override     = 'rc.defaultwidth=999'
" default fields to ask when adding a new task
let g:task_default_prompt  = ['due', 'description']
" whether the info window is splited vertically
let g:task_info_vsplit     = 0
" info window size
let g:task_info_size       = 15
" info window position
let g:task_info_position   = 'belowright'
" directory to store log files defaults to taskwarrior data.location
let g:task_log_directory   = '~/.task'
" max number of historical entries
let g:task_log_max         = '20'
" forward arrow shown on statusline
let g:task_left_arrow      = ' <<'
" backward arrow ...
let g:task_left_arrow      = '>> '

" ===== Kronos
let g:kronos_backend = 'taskwarrior'

" ===== vimagit
" Open vimagit pane
nnoremap <leader>gs :Magit<CR>       " git status
" Push to remote
nnoremap <leader>gP :! git push<CR>  " git Push
" Enable deletion of untracked files in Magit
let g:magit_discard_untracked_do_delete=1

" ==== vim-test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "vimux"
let test#python#runner = 'pytest'
let test#python#minitest#options = '--verbose'
let test#neovim#term_position = "right"


" === black
let g:black_linelength = 79

" === vimwiki
" Wiki settings
let g:vimwiki_global_ext=0
let g:wiki_default = {}
let g:wiki_default.auto_export = 0
let g:wiki_default.auto_toc = 0
let g:wiki_default.syntax = 'markdown'
let g:wiki_default.ext = '.md'
" let g:wiki_default.diary_rel_path = 'log/'

let g:sh_wiki=copy(g:wiki_default)
let g:sh_wiki.path='$HOME/vimwiki/'

let g:guidelines_wiki=copy(g:wiki_default)
let g:guidelines_wiki.path='$HOME/gitlab/mgreco/guidelines.wiki/'

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
