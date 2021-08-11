let test#python#pytest#options = "--color=yes"
let test#javascript#jest#options = "--color=always"
let g:ultest_use_pty = 1

augroup UltestRunner
    au!
    au BufWritePost test_*.py UltestNearest
augroup END

nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)
nnoremap <C-t><C-n> :UltestNearest<cr>
nnoremap <C-t><C-t> :Ultest<cr>
nnoremap <C-t><C-s> :UltestSummary<cr>
nnoremap <C-t><C-a> :UltestAttach<cr>
