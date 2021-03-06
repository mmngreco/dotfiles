" ==== vim-test
" these 'Ctrl mappings' work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" let test#strategy = 'slimux'
let test#strategy = 'dispatch'
let test#python#runner = 'pytest'
let test#python#pytest#options = '-v -x -p no:warnings --tb=short --pdb'
let test#neovim#term_position = 'bottom'
