let test#python#pytest#options = "--ff -v -p no:warnings"
let test#javascript#jest#options = "--color=always"
let g:ultest_use_pty = 1
let g:ultest_output_on_line = 0

" augroup UltestRunner
"     au!
"     au BufWritePost test_*.py UltestNearest
" augroup END

nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)

nnoremap <C-u><C-n> :UltestNearest<cr>
nnoremap <C-u><C-t> :Ultest<cr>
nnoremap <C-u><C-s> :UltestSummary<cr>
nnoremap <C-u><C-a> :UltestAttach<cr>

let test#strategy = 'harpoon'
let g:test#harpoon_term = 4

let g:pytst_cmd="pytest tests -v --ff -p no:warnings --pdb"
nnoremap <C-t><C-l> :let @b=''<CR>?\s*def \w.*(<CR>w"byw<CR>:let g:_cmd=join([pytst_cmd, "-k", getreg('b'), "\n"], " ")<cr>:lua require('harpoon.term').sendCommand(4, vim.g["_cmd"]); require('harpoon.term').gotoTerminal(4)<cr>i
nnoremap <leader>tst :lua require("harpoon.term").sendCommand(4, vim.g['pytst_cmd'] .. "\n");require("harpoon.term").gotoTerminal(4)<cr>i

" nnoremap <C-t><C-a> :lua require('harpoon.term').gotoTerminal(4)<CR>:lua require('harpoon.term').sendCommand(4, "pytest test")i<cr>
" tmux send-keys -t \"0:1.2\" \"pytest\" C-p Enter
" TODO wip:
" vnoremap <C-t><C-e> Ay<cr>:let g:_cmd = getreg("A")<cr>:lua require('harpoon.term').sendCommand(4, vim.g["_cmd"]); require('harpoon.term').gotoTerminal(4)<cr>i
" nnoremap <leader>tst :lua require("harpoon.term").sendCommand(1, 'pytest tests -x --pdb\n')<cr>

nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>
