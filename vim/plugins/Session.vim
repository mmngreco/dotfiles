let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/etsgit/COM/libraries/tesser
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +45 tests/migration/programs/test_program_119.py
badd +7 term://~/etsgit/COM/libraries/tesser/tests/migration/programs//19335:/usr/bin/zsh
badd +2 term://~/etsgit/COM/libraries/tesser/tests/migration/programs//20030:/usr/bin/zsh
badd +1 tests/migration/programs
badd +921 tests/migration/utils.py
badd +348 ~/.dotfiles/vim/init.vim
badd +58 tests/migration/test_utils.py
badd +10 ~/.dotfiles/vim/plugins/lsp.vim
badd +15 ~/.dotfiles/vim/plugins/lsp.lua
badd +1 term://~/etsgit/COM/libraries/tesser//16385:/usr/bin/zsh
badd +1 term://~/etsgit/COM/libraries/tesser//16517:/usr/bin/zsh
badd +1 term://~/etsgit/COM/libraries/tesser//21002:/usr/bin/zsh
argglobal
%argdel
argglobal
enew
balt ~/.dotfiles/vim/plugins/lsp.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/.dotfiles/vim/plugins
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFIc
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
