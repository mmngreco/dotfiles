" ==== harpoon
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <leader>5 :lua require("harpoon.ui").nav_file(5)<cr>

" nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<cr>
" nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<cr>
" nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<cr>
" nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<cr>
" nnoremap <C-;> :lua require("harpoon.ui").nav_file(5)<cr>

nnoremap <leader>11 :lua require("harpoon.term").gotoTerminal(1)<cr>
nnoremap <leader>22 :lua require("harpoon.term").gotoTerminal(2)<cr>
nnoremap <leader>33 :lua require("harpoon.term").gotoTerminal(3)<cr>
nnoremap <leader>44 :lua require("harpoon.term").gotoTerminal(4)<cr>
nnoremap <leader>55 :lua require("harpoon.term").gotoTerminal(5)<cr>
nnoremap <C-5> :lua require("harpoon.term").gotoTerminal(5)<cr>

" nnoremap <C-a> :lua require("harpoon.term").gotoTerminal(1)<cr>
" nnoremap <C-s> :lua require("harpoon.term").gotoTerminal(2)<cr>
" nnoremap <C-d> :lua require("harpoon.term").gotoTerminal(3)<cr>
" nnoremap <C-f> :lua require("harpoon.term").gotoTerminal(4)<cr>
" nnoremap <C-g> :lua require("harpoon.term").gotoTerminal(5)<cr>

nnoremap <leader>hh :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>hm :lua require("harpoon.ui").toggle_quick_menu()<cr>

nnoremap <leader>is :lua require("harpoon.term").sendCommand(1, "clab issue ls")<cr>

nnoremap <C-t><C-s> :lua require("harpoon.term").sendCommand(3, "txs\n");require("harpoon.term").gotoTerminal(3)<cr>i
nnoremap <C-t><C-w> :lua require("harpoon.term").sendCommand(3, "txw\n");require("harpoon.term").gotoTerminal(3)<cr>i

nnoremap <C-y><C-b> :let @b=("b " . expand('%:p') . ":" . line('.') . "\n")<CR>

# send breakpoint to terminal 4
nnoremap <C-t><C-b> :let g:_cmd = ("b " . expand('%:p') . ":" . line('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(4, vim.g['_cmd'])<cr>
# send current line to terminal 4
nnoremap <C-t><C-l> :let g:_cmd = (trim(getline('.')) . "\n")<CR>:lua require("harpoon.term").sendCommand(4, vim.g['_cmd'])<cr>

let g:pytst_cmd='pytest tests -v --ff -p no:warnings --pdb'
" nnoremap <C-t><C-l> :let @b=''<CR>?\s*def \w.*(<CR>w"byw<CR>:let g:_cmd=join([pytst_cmd, "-k", getreg('b'), "\n"], " ")<cr>:lua require('harpoon.term').sendCommand(4, vim.g["_cmd"]); require('harpoon.term').gotoTerminal(4)<cr>i
nnoremap <C-t><C-f> :let g:_cmd=join(["pytest -v -p no:warnings", expand('%:s'), "\n"], " ")<cr>:lua require('harpoon.term').sendCommand(4, vim.g["_cmd"]); require('harpoon.term').gotoTerminal(4)<cr>
nnoremap <leader>tst :lua require("harpoon.term").sendCommand(4, vim.g['pytst_cmd'] .. "\n");require("harpoon.term").gotoTerminal(4)<cr>

" nnoremap <C-t><C-a> :lua require('harpoon.term').gotoTerminal(4)<CR>:lua require('harpoon.term').sendCommand(4, 'pytest test')i<cr>
" tmux send-keys -t \"0:1.2\" \"pytest\" C-p Enter
" TODO wip:
" vnoremap <C-t><C-e> Ay<cr>:let g:_cmd = getreg("A")<cr>:lua require('harpoon.term').sendCommand(4, vim.g["_cmd"]); require('harpoon.term').gotoTerminal(4)<cr>i
" nnoremap <leader>tst :lua require("harpoon.term").sendCommand(1, 'pytest tests -x --pdb\n')<cr>

