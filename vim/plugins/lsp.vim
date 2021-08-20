let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'vim-vsnip'
set completeopt=menuone,noinsert,noselect

" set completeopt=menuone,noselect
" let g:completion_enable_snippet = 'vim-vsnip'

" ==== lsp
" Configure the completion chains
luafile $DOTFILES/vim/plugins/lsp.lua

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :lua vim.lsp.diagnostic.set_loclist()<CR>

" fun! LspLocationList()
"     " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
" endfun
" if noselect is on this don't work
" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)

" augroup THE_PRIMEAGEN_LSP
"     autocmd!
"     autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
" augroup END
"
" augroup
" augroup
"
" === compe

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-l> compe#confirm({ 'keys': '<C-l>', 'select': v:true })
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

" === vsnip
" imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

highlight link CompeDocumentation NormalFloat
