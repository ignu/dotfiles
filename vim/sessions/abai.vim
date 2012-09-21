" ~/bin/dotfiles2.0/vim/sessions/abai.vim: Vim session script.
" Created by session.vim 1.5 on 18 August 2012 at 15:37:14.
" Open this file in Vim and run :source % to restore your session.

set guioptions=
silent! set guifont=
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'jellybeans' | colorscheme jellybeans | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/code/abai
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +7 spec/acceptance/recert_cme_reminder_mailing_spec.rb
badd +45 app/models/exam.rb
badd +51 spec/factories.rb
badd +729 db/schema.rb
badd +310 app/models/person.rb
badd +3 spec/acceptance/certificate_expired_mailer_spec.rb
badd +1 db/mailing_seeds.rb
badd +1 spec/acceptance/cert_reminder_spec.rb
badd +1 app/models/admin/cert_test_site_not_registered_strategy.rb
badd +38 app/models/training/training.rb
badd +15 spec/models/exam_application_spec.rb
badd +2 app/models/admin/recert_cme_reminder_strategy.rb
badd +13 spec/models/person_spec.rb
silent! argdel *
set lines=89 columns=365
edit spec/factories.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 54 - ((0 * winheight(0) + 44) / 88)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
54
normal! 024l
lcd ~/code/abai
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
tabnext 1
1wincmd w

" vim: ft=vim ro nowrap smc=128
