" === fugitive
nnoremap <leader>w :Gstatus<cr>
" ==== fugitive-gitlab
let g:fugitive_gitlab_domains = ['https://' . $GITLAB_ETS_URI]
let g:gitlab_api_keys = {$GITLAB_PERSONAL_URI : $GITLAB_PERSONAL_TOKEN, $GITLAB_ETS_URI: $GITLAB_ETS_TOKEN}

