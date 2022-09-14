" ==== slimux
let g:slimux_tmux_path="/usr/local/bin/tmux"
let g:slime_target="tmux"
"let maplocalleader="\<space>"
let g:slimux_select_from_current_window = 1
let g:slimux_python_use_ipython=1
let g:slimux_python_press_enter = 1

nnoremap <Leader>e :SlimuxREPLSendLine<CR>
vnoremap <Leader>e :SlimuxREPLSendSelection<CR>
nnoremap <Leader>r :SlimuxGlobalConfigure<CR>

nnoremap <leader>co O<esc>77i-<esc>:norm gcc<cr>o%%<esc>:norm gcc<cr>
nnoremap <leader>ck ?%%<cr>
nnoremap <leader>cj /%%<cr>

" nnoremap <leader>cc V/%%<cr>k:'<,'>SlimuxREPLSendSelection<cr>n
nnoremap <leader>cl V/%%<cr>k:'<,'>SlimuxREPLSendSelection<cr>nn
