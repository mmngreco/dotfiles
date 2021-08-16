luafile $DOTFILES/vim/plugins/fterm.lua
nnoremap <C-f><C-g> :lua _G.__fterm_gitui()<CR>
nnoremap <C-c><C-m> :lua require("FTerm").toggle()<CR>
