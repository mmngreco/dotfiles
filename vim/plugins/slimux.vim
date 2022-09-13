" ==== slimux
let g:slimux_tmux_path="/usr/local/bin/tmux"
let g:slime_target="tmux"
"let maplocalleader="\<space>"
let g:slimux_select_from_current_window = 1
let g:slimux_python_use_ipython=1
let g:slimux_python_press_enter = 1
map <Leader>e :SlimuxREPLSendLine<CR>
vmap <Leader>e :SlimuxREPLSendSelection<CR>
" map <Leader>p :SlimuxREPLSendParagraph<CR>
nnoremap <leader>cc V/#%%<cr>n:'<,'>SlimuxREPLSendSelection<cr>n
