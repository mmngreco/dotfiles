" ==== harpoon
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-m> :lua require("harpoon.ui").toggle_quick_menu()<cr>

nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<cr>

nnoremap <C-h><C-h> :lua require("harpoon.term").gotoTerminal(1)<cr>i
nnoremap <C-j><C-j> :lua require("harpoon.term").gotoTerminal(2)<cr>i
nnoremap <C-k><C-k> :lua require("harpoon.term").gotoTerminal(3)<cr>i
nnoremap <C-l><C-l> :lua require("harpoon.term").gotoTerminal(4)<cr>i

" send current line to terminal
" make it repeatable
" https://github.com/tpope/vim-repeat/issues/55
nnoremap <silent> <Plug>SendToHarpoon1 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(1, vim.g['_cmd'])<cr> \ :call repeat#set("\<Plug>SendToHarpoon1", v:count)<cr>
nnoremap <silent> <Plug>SendToHarpoon2 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(2, vim.g['_cmd'])<cr> \ :call repeat#set("\<Plug>SendToHarpoon2", v:count)<cr>
nnoremap <silent> <Plug>SendToHarpoon3 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(3, vim.g['_cmd'])<cr> \ :call repeat#set("\<Plug>SendToHarpoon3", v:count)<cr>
nnoremap <silent> <Plug>SendToHarpoon4 :let g:_cmd = (getline('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(4, vim.g['_cmd'])<cr> \ call repeat#set("\<Plug>SendToHarpoon4", v:count)<cr>
nmap <leader>lh  <Plug>SendToHarpoon1
nmap <leader>lj  <Plug>SendToHarpoon2
nmap <leader>lk  <Plug>SendToHarpoon3
nmap <leader>ll  <Plug>SendToHarpoon4

" print out issues
nnoremap <leader>is :lua require("harpoon.term").sendCommand(7, "clab issue ls\nexit\n")<cr>:split<cr>:lua require("harpoon.term").gotoTerminal(7)<cr>
nnoremap <C-y><C-b> :let @b=("b " . expand('%:p') . ":" . line('.') . "\n")<CR>

" send breakpoint
nnoremap <leader>bh :let g:_cmd = ("b " . expand('%:p') . ":" . line('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(1, vim.g['_cmd'])<cr>
nnoremap <leader>bj :let g:_cmd = ("b " . expand('%:p') . ":" . line('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(2, vim.g['_cmd'])<cr>
nnoremap <leader>bk :let g:_cmd = ("b " . expand('%:p') . ":" . line('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(3, vim.g['_cmd'])<cr>
nnoremap <leader>bl :let g:_cmd = ("b " . expand('%:p') . ":" . line('.') . "\n")<CR>:lua require("harpoon.term").sendCommand(4, vim.g['_cmd'])<cr>
