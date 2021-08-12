let test#python#pytest#options = "--color=yes"
let test#javascript#jest#options = "--color=always"
let g:ultest_use_pty = 1
let g:ultest_output_on_line = 0

augroup UltestRunner
    au!
    au BufWritePost test_*.py UltestNearest
augroup END

nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)
nnoremap <C-u><C-n> :UltestNearest<cr>
nnoremap <C-u><C-t> :Ultest<cr>
nnoremap <C-u><C-s> :UltestSummary<cr>
nnoremap <C-u><C-a> :UltestAttach<cr>
