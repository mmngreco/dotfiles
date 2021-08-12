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
