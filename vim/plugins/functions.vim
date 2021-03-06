fun! OpenScrum()
    split /home/mgreco/gitlab/mgreco/scrums/latest.md
    lcd /home/mgreco/gitlab/mgreco/scrums/
    nnoremap <buffer> q :w\|bdelete!<CR>
endfun
nnoremap <leader>tpb :silent !call OpenScrum()<cr>

fun! OpenTodo()
    vsplit /home/mgreco/.TODO.md
    lcd /home/mgreco/
    nnoremap <buffer> q :w\|bdelete!<CR>
endfun
nnoremap <leader>ttd :silent !call OpenTodo()<cr>

" ==== minimal
fun! TurnOnGuides()
    set rnu
    set nu
    set signcolumn=yes
    set colorcolumn=80
endfun

fun! TurnOffGuides()
    set nornu
    set nonu
    set signcolumn=no
    set colorcolumn=800
endfun

nnoremap <leader>ao :call TurnOnGuides()<cr>
nnoremap <leader>ae :call TurnOffGuides()<cr>

augroup minimal
    autocmd!
    autocmd FileType *\(^\(netrw\|help\)\)\@<! :call TurnOnGuides()
    autocmd FileType netrw,help :call TurnOffGuides()
augroup END

function! AsArgsClass()
    " from:
    "    aaa
    " to:
    "    self.aaa = aaa
    let @x=":s\/\\([a-z_0-9]*\\),\\?\\n\/self.\\1 = \\1\\r\/g\r:nohlsearch\r"
    @x
endfunction
vnoremap <leader>aac :<c-u>call AsArgsClass()<CR>

function! AsKwargs()
    " from:
    "    aaa
    " to:
    "     aaa=aaa,
    let @y=":s\/\\([a-z_0-9]*\\),\\?\\n\/\\1=\\1,\\r\/g\r:nohlsearch\r"
    @y
endfunction
vnoremap <leader>akw :<c-u>call AsKwargs()<CR>

function! SwapEqual()
    " from
    "     aaa = bbb
    " to
    "     bbb = aaa
    let @z=":s\/\\(\\s*\\)\\([a-z._0-9]*\\) = \\([a-z_0-9]*\\)\/\\1\\3 = \\2/g\r:nohlsearch\r"
    @z
endfunction
vnoremap <leader>swe :<c-u>call SwapEqual()<CR>

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

" ==== latex
function! Latexize()
   :silent !pdflatex ./report.tex --output-directory=./tmp
   :silent !bibtex ./report
   :silent !makeindex report.idx
   :silent !pdflatex ./report.tex --output-directory=./tmp
   :redraw!
endfunction
" command Latexize_small execute 'silent !pdflatex ./report.tex --output-directory=./tmp'

" ==== show maps
" https://stackoverflow.com/questions/24842063/how-to-search-in-the-vim-mapping-listing
function! s:ShowMaps()
    let old_reg = getreg("a")          " save the current content of register a
    let old_reg_type = getregtype("a") " save the type of the register as well
    try
        redir @a                           " redirect output to register a
        " Get the list of all key mappings silently, satisfy "Press ENTER to continue"
        silent map | call feedkeys("\<CR>")
        redir END                          " end output redirection
        vnew                               " new buffer in vertical window
        setlocal nobuflisted noswapfile buftype=nofile bufhidden=delete"
        nnoremap <buffer> Q :bdelete!<cr>"
        put a                              " put content of register
        " Sort on 4th character column which is the key(s)
        %!sort -k1.4,1.4
    finally                              " Execute even if exception is raised
        call setreg("a", old_reg, old_reg_type) " restore register a
    endtry
endfunction

com! ShowMaps call s:ShowMaps()      " Enable :ShowMaps to call the function
nnoremap \m :ShowMaps<CR>            " Map keys to call the function

" ==== gitlab
function! YankCurrentFileInGitLab()
  let gitlab_domain = "https://" . $GITLAB_ETS_URI
  " example of url
  " https://xxxx.xxx.es/ggg/pppp/-/blob/master/pppp/file.py#L15-17
  let file_dir = expand('%:h')
  let git_root = system('cd ' . file_dir . '; git rev-parse --show-toplevel | tr -d "\n"')
  let file_path = substitute(expand('%:p'), git_root . '/', '', '')

  " Take into account that file could came from another repo
  let branch = system('cd ' . file_dir . ';git rev-parse HEAD | tr -d "\n"')
  let git_remote = system('cd ' . file_dir . '; git remote get-url origin')
  let repo_path = matchlist(git_remote, ':\(.*\)\.')[1]
  let url = gitlab_domain . '/' . repo_path . '/-/blob/' . branch . '/' . file_path
  let url .= '#L' . line('.')
  let @+ = url
endfunction

noremap <C-g> :call YankCurrentFileInGitLab()<cr>
vnoremap <C-g> :<c-u>call YankCurrentFileInGitLab()<cr>

function! OpenCurrentFileInGitLab()
  let gitlab_domain = "https://" . $GITLAB_ETS_URI
  " example of url
  " https://host/Group/project/-/blob/commit-id/project/file.py#L15-17
  let file_dir = expand('%:h')
  let git_root = system('cd ' . file_dir . '; git rev-parse --show-toplevel | tr -d "\n"')
  let file_path = substitute(expand('%:p'), git_root . '/', '', '')

  " Take into account that file could came from another repo
  let branch = system('cd ' . file_dir . ';git symbolic-ref --short -q HEAD | tr -d "\n"')
  let git_remote = system('cd ' . file_dir . '; git remote get-url origin')
  let repo_path = matchlist(git_remote, ':\(.*\)\.')[1]
  let url = gitlab_domain . '/' . repo_path . '/-/blob/' . branch . '/' . file_path
  let url .= '#L' . line('.')
  call system('xdg-open ' . url)
endfunction
noremap <C-g><C-b> :call OpenCurrentFileInGitLab()<cr>
vnoremap <C-g><C-b> :<c-u>call OpenCurrentFileInGitLab()<cr>

nnoremap <leader>c :call ToggleColumnWidth()<cr>
let g:wide_column = 0
function! ToggleColumnWidth()
    if g:wide_column
        set textwidth=79
        set colorcolumn=79
        let g:wide_column = 0
    else
        set textwidth=110
        set colorcolumn=110
        let g:wide_column = 1
    endif
endfunction

