
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
   Plug 'ivalkeen/nerdtree-execute'
   Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
   " Plug 'Nopik/vim-nerdtree-direnter'
   Plug 'kien/ctrlp.vim'
   Plug 'majutsushi/tagbar'

   Plug 'luochen1990/rainbow'
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
   " Plug 'tpope/vim-repeat'
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
   Plug 'rhysd/vim-grammarous'
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
   "     Plug 'xolox/vim-misc'
   Plug 'tpope/vim-surround'
   Plug 'webastien/vim-ctags'

   " Plug 'zchee/deoplete-clang'

   Plug 'mattn/gist-vim'
       Plug 'mattn/webapi-vim'
   Plug 'cjrh/vim-conda'

   Plug 'nvie/vim-flake8'
       Plug 'davidhalter/jedi-vim'
   Plug 'tweekmonster/impsort.vim'  " color and sort imports
   Plug 'tell-k/vim-autopep8'
   Plug 'heavenshell/vim-pydocstring'
   " Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh',  }

   Plug 'bronson/vim-trailing-whitespace'
   " Plug 'jpalardy/vim-slime'

   " Plug 'ErichDonGubler/vim-sublime-monokai'
   Plug 'jalvesaq/vimcmdline'
   Plug 'junegunn/fzf'
call plug#end()

set conceallevel=0
" set clipboard=unnamed
set clipboard=unnamedplus
highlight ColorColumn ctermbg=gray
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
set undodir=~/.config/nvim/undodir
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload
set cmdheight=1
filetype indent on
filetype plugin on

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
let g:UltiSnipsSnippetsDir="~/.config/nvim/plugged/vim-snippets/UltiSnips"
" let g:UltiSnipsSnippetDirectories=["UltiSnipsNewDir"]
let g:ultisnips_python_style="sphinx"


" ==========  PyDocstrign  ==========
let g:pydocstring_templates_dir='~/.config/nvim/plugged/vim-pydocstring/test/templates/numpy'

" ========== MARKDOWN-PREVIEW ===========
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_page_title = '${name}'
" let g:mkdp_markdown_css = '/home/mgreco/dotfiles/css/tufte.css'

" ========= MARKDOWN-SYNTAX ============
" autocmd BufNewFile,BufRead *.{md,mark*} set filetype=markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
set conceallelvel=0

" ==========  Language Client Server  ==========
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'

" ==========  SLIMUX  ==========
let g:slimux_python_use_ipython = 1
" let g:slimux_tmux_path = "/usr/local/bin/tmux"
let g:slimux_tmux_path = "/usr/bin/tmux"
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
let maplocalleader="\<space>"
let g:slime_target = "tmux"

" ==========  RAINBOW  ==========
let g:rainbow_active = 1
let g:indentLine_char = "|"

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
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
" let g:airline_theme = 'raven'
" let g:airline_theme = 'monochrome'

" === vimwiki
let g:vimwiki_global_ext=0
let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'
                     \ }]

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
