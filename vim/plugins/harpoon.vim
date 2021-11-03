" ==== harpoon
" asdf jkl;
nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <C-;> :lua require("harpoon.ui").nav_file(5)<cr>

nnoremap <C-h><C-h> :lua require("harpoon.term").gotoTerminal(1)<cr>i
nnoremap <C-j><C-j> :lua require("harpoon.term").gotoTerminal(2)<cr>i
nnoremap <C-k><C-k> :lua require("harpoon.term").gotoTerminal(3)<cr>i
nnoremap <C-l><C-l> :lua require("harpoon.term").gotoTerminal(4)<cr>i

" make it repeatable
" https://github.com/tpope/vim-repeat/issues/55
nnoremap <silent> <Plug>SendToHarpoon1 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(1, vim.g['_cmd'])<cr> \ :call repeat#set("\<Plug>SendToHarpoon1", v:count)<cr>
nmap <leader>l6  <Plug>SendToHarpoon1
nnoremap <silent> <Plug>SendToHarpoon2 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(2, vim.g['_cmd'])<cr> \ :call repeat#set("\<Plug>SendToHarpoon2", v:count)<cr>
nmap <leader>l7  <Plug>SendToHarpoon2
nnoremap <silent> <Plug>SendToHarpoon3 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(3, vim.g['_cmd'])<cr> \ :call repeat#set("\<Plug>SendToHarpoon3", v:count)<cr>
nmap <leader>l8  <Plug>SendToHarpoon3
nnoremap <silent> <Plug>SendToHarpoon4 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(4, vim.g['_cmd'])<cr> \ call repeat#set("\<Plug>SendToHarpoon4", v:count)<cr>
nmap <leader>l9  <Plug>SendToHarpoon


nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<cr>

nnoremap <leader>is :lua require("harpoon.term").sendCommand(1, "clab issue ls")<cr>

nnoremap <C-t><C-s> :lua require("harpoon.term").sendCommand(3, "txs\n");require("harpoon.term").gotoTerminal(3)<cr>i
nnoremap <C-t><C-w> :lua require("harpoon.term").sendCommand(3, "txw\n");require("harpoon.term").gotoTerminal(3)<cr>i

nnoremap <C-y><C-b> :let @b=("b " . expand('%:p') . ":" . line('.') . "\n")<CR>

" send breakpoint to terminal 4
nnoremap <C-t><C-b> :let g:_cmd = ("b " . expand('%:p') . ":" . line('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(4, vim.g['_cmd'])<cr>
" send current line to terminal 4
nnoremap <C-t><C-l> :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(4, vim.g['_cmd'])<cr>


" let g:pytst_cmd='pytest tests -v --ff -p no:warnings --pdb'
" nnoremap <C-t><C-l> :let @b=''<CR>?\s*def \w.*(<CR>w"byw<CR>:let g:_cmd=join([pytst_cmd, "-k", getreg('b'), "\n"], " ")<cr>:lua require('harpoon.term').sendCommand(4, vim.g["_cmd"]); require('harpoon.term').gotoTerminal(4)<cr>i
" nnoremap <C-t><C-f> :let g:_cmd=join(["pytest -v -p no:warnings", expand('%:s'), "\n"], " ")<cr>:lua require('harpoon.term').sendCommand(4, vim.g["_cmd"]); require('harpoon.term').gotoTerminal(4)<cr>
" nnoremap <leader>tst :lua require("harpoon.term").sendCommand(4, vim.g['pytst_cmd'] .. "\n");require("harpoon.term").gotoTerminal(4)<cr>
