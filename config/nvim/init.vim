
" ============   PLUGINS ============
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

call plug#begin()
   " Plug 'w0rp/ale'
   Plug 'arakashic/chromatica.nvim'
   Plug 'kien/ctrlp.vim'
   Plug 'blindFS/vim-taskwarrior'
   " Plug 'Shougo/echodoc.vim'
   Plug 'Shougo/neoinclude.vim'
   " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
   Plug 'neomake/neomake'
   Plug 'scrooloose/nerdtree'
   Plug 'ivalkeen/nerdtree-execute'
   Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
   Plug 'luochen1990/rainbow'

   Plug 'epeli/slimux'
   Plug 'ervandew/supertab'
   Plug 'godlygeek/tabular'
   Plug 'majutsushi/tagbar'
   Plug 'dhruvasagar/vim-table-mode'

   "=== ultisnips
   Plug 'SirVer/ultisnips'
   Plug 'honza/vim-snippets'
   " Plug 'Valloric/YouCompleteMe' " === only works with MacVim.

   Plug 'tpope/vim-abolish'
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'

   Plug 'tpope/vim-fugitive'
   Plug 'tpope/vim-unimpaired'
   Plug 'airblade/vim-gitgutter'
   Plug 'mbbill/undotree'

   Plug 'vimwiki/vimwiki'
   Plug 'nathanaelkane/vim-indent-guides'
   Plug 'Yggdroot/indentLine'
   Plug 'plasticboy/vim-markdown'
   " Plug 'suan/vim-instant-markdown'
   " Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
   Plug 'previm/previm'
       Plug 'tyru/open-browser.vim'
   Plug 'tpope/vim-commentary'
   Plug 'ryanoasis/vim-devicons'
   " Plug 'terryma/vim-multiple-cursors'
   Plug 'tpope/vim-repeat'
   Plug 'tpope/vim-sensible'

   Plug 'kshenoy/vim-signature'
   Plug 'xolox/vim-notes'
   Plug 'xolox/vim-misc'
   Plug 'tpope/vim-surround'

   " Plug 'zchee/deoplete-clang'
   Plug 'nvie/vim-flake8'
       Plug 'davidhalter/jedi-vim'

   Plug 'mattn/gist-vim'
       Plug 'mattn/webapi-vim'
   " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
   " Plug 'zchee/deoplete-jedi', {'for': 'python'}
   " Plug 'prabirshrestha/vim-lsp'
   " Plug 'prabirshrestha/asyncomplete.vim'
   " Plug 'cjrh/vim-conda'

   Plug 'flazz/vim-colorschemes'

   Plug 'tweekmonster/impsort.vim'  " color and sort imports
   Plug 'tell-k/vim-autopep8'
   Plug 'heavenshell/vim-pydocstring'
   " Plug 'HansPinckaers/ncm2-jedi'
   " Plug 'ncm2/ncm2'
   " Plug 'roxma/nvim-yarp'
   " Plug 'ncm2/ncm2-bufword'
   " Plug 'ncm2/ncm2-path'
   " Plug 'python-mode/python-mode'
   " Plug 'ryanolsonx/vim-lsp-python'
   Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh',  }
   " Plug 'prabirshrestha/asyncomplete.vim'
   " Plug 'prabirshrestha/async.vim'
   " Plug 'prabirshrestha/vim-lsp'
   " Plug 'prabirshrestha/asyncomplete-lsp.vim'

   "=== vim-trailing-whitespace
   Plug 'bronson/vim-trailing-whitespace'
   Plug 'jpalardy/vim-slime'

   Plug 'ErichDonGubler/vim-sublime-monokai'
   Plug 'jalvesaq/vimcmdline'
   " Plug 'Nopik/vim-nerdtree-direnter'
   Plug 'altercation/vim-colors-solarized'
   Plug 'junegunn/fzf'
   Plug 'christoomey/vim-tmux-navigator'
   " Plug 'yuratomo/w3m.vim'
call plug#end()

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
set undodir=~/.vim/undodir
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload
filetype indent on
filetype plugin on

"===============================================================================
"===   DEFAULT CONFIGURATION
"===   - Typing
" ===   - Colorscheme
" ===   - Plugins
" ===   - Mappings
" ===============================================================================

highlight Normal  ctermbg=none
highlight NonText ctermbg=none
" set runtimepath+=~/.config/nvim/plugins/deoplete.nvim

"===   - Plugins
   " === ale
   let g:ale_emit_conflict_warnings = 0
   " === ctrlp
   " === deoplete
   " let g:deoplete#enable_at_startup = 1
   let g:deoplete#sources#jedi#show_docstring = 1
   let g:deoplete#sources#jedi#server_timeout = 60
   " let g:python3_host_prog = '$CONDA_PYTHON_EXE'
   " === echodoc
   " let g:echodoc_enable_at_startup="1"
   " let g:echodoc_type='echo'
   set cmdheight=2
   " === ncm2 settings"
   " Disable Jedi-vim autocompletion and enable call-signatures options
   let g:jedi#auto_initialization = 1
   let g:jedi#show_call_singatures= 1
   let g:jedi#completions_enabled = 0
   let g:jedi#auto_vim_configuration = 0
   let g:jedi#smart_auto_mappings = 0
   let g:jedi#popup_on_dot = 0
   let g:jedi#completions_command = ''
   " === ncm2 settings
   " autocmd BufEnter * call ncm2#enable_for_buffer()
   " set completeopt=menuone,noselect,noinsert
   " set shortmess+=c
   " inoremap <c-c> <ESC>
   " " make it fast
   " let ncm2#popup_delay = 5
   " let ncm2#complete_length = [[1, 1]]
   " let g:ncm2#matcher = 'substrfuzzy'
   " === indentLine
   " === neoinclude
   " === neomake
   " === nerdtree
   " === rainbow
   " let g:gist_use_password_in_gitconfig = 1
   " === tabular
   " === tagbar
   " === vim-abolish
   " === vim-airline
   " === vim-gitgutter
   " === vim-indent-guides
   " === vim-instant-markdown
   let g:instant_markdown_slow = 1

   " === vim-previm
   let g:previm_open_cmd = 'xdg-open'
   let g:previm_enable_realtime = 1
   augroup PrevimSettings
       autocmd!
       autocmd BufNewFile,BufRead *.{md,mark*} set filetype=markdown
       " nnoremap <silent> <C-p> :PrevimOpen<CR>
       " autocmd BufReadPre,FileReadPre :PrevimOpen
       autocmd FileType markdown :PrevimOpen
   augroup END
   " === vim-repeat
   " === vim-sensible
   " === vim-signature
   " === vim-surround
   " === vim-trailing-whitespace
   " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

   " === UltiSnips
   let g:UltiSnipsExpandTrigger="<tab>"
   let g:UltiSnipsListSnippets="<c-l>"
   let g:UltiSnipsJumpForwardTrigger="<c-j>"
   let g:UltiSnipsJumpBackwardTrigger="<c-h>"
   " If you want :UltiSnipsEdit to split your window.
   let g:UltiSnipsEditSplit="vertical"
   "let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/snippets"
   let g:UltiSnipsSnippetsDir="~/.config/nvim/plugged/vim-snippets/UltiSnips"
   " let g:UltiSnipsSnippetDirectories=["UltiSnipsNewDir"]
   let g:ultisnips_python_style="sphinx"
   let g:pydocstring_templates_dir='~/.config/nvim/plugged/vim-pydocstring/test/templates/numpy'

" ==========  SLIMUX  ==========
let g:slimux_python_use_ipython = 1
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
" let g:slimux_tmux_path = "/usr/local/bin/tmux"
let g:slimux_tmux_path = "/usr/bin/tmux"
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
let maplocalleader="\<space>"
let g:slime_target = "tmux"

" rainbow
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
let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'
                     \ }]

" === Language Client Server
" https://github.com/palantir/python-language-server/issues/374
let g:LanguageClient_serverCommands = {
    \ 'python': ['python3', '-m', 'pyls', '--log-file', '/tmp/pyls.log', '-v'],
    \ }

" let g:lsp_virtual_text_enabled = 1
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

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

