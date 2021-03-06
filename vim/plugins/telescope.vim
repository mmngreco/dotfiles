" ==== telescope
luafile $DOTFILES/vim/plugins/telescope.lua

" search only on git files
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
" find buffers
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" find files
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" find help
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" project buffers
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
" project find
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
" project search grep
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" project word
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
" view help tags
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
" git branches
nnoremap <leader>gc :lua require('telescope').mmngreco.git_branches()<CR>
" search on dotfiles
nnoremap <leader>dot :lua require('telescope').mmngreco.search_dotfiles()<CR>
nnoremap <leader>fg :lua require('telescope').mmngreco.no_preview()<CR>
" mat files
nnoremap <leader>mat :lua require('telescope').mmngreco.search_matlab()<CR>
