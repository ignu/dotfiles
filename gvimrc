  set guioptions-=T 
  set guifont=Monaco:h12
  set antialias
  autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Go to full width and height in full screen mode.
  set fuoptions=maxvert,maxhorz
  set transparency=0
  set go-=L

" Don't highlight search result.
  set nohlsearch

" Don't flick cursor.
  set guicursor=a:blinkon0

" TABS: safari style tab navigation
  nmap <D-[> :tabprevious<CR>
  nmap <D-]> :tabnext<CR>
  map <D-[> :tabprevious<CR>
  map <D-]> :tabnext<CR>
  imap <D-[> <C-O>:tabprevious<CR>
  imap <D-]> <C-O>:tabnext<CR>
  imap <D-[> <uuuu
  imap <D-[> <uuuu
  imap <D-[> <uuuu

" TABS: Firefox style, open tabs with command-<tab number>
  map <silent> <D-1> <Esc>:tabn 1<CR>
  map <silent> <D-2> <Esc>:tabn 2<CR>
  map <silent> <D-3> <Esc>:tabn 3<CR>
  map <silent> <D-4> <Esc>:tabn 4<CR>
  map <silent> <D-5> <Esc>:tabn 5<CR>
  map <silent> <D-6> <Esc>:tabn 6<CR>
  map <silent> <D-7> <Esc>:tabn 7<CR>
  map <silent> <D-8> <Esc>:tabn 8<CR>
  map <silent> <D-9> <Esc>:tabn 9<CR>

" don't unselect after move
  vmap < <gv
  vmap > >gv
  vmap <TAB> >gv
  vmap <S-TAB> <gv

" bind command-] to shift right
  nmap <D-]> >>
  vmap <D-]> >>
  imap <D-]> <C-O>>>

" bind command-[ to shift left
  nmap <D-[> <<
  vmap <D-[> <<
  imap <D-[> <C-O><<

call pathogen#runtime_append_all_bundles()

