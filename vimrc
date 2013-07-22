" ------------
" Pathogen
" ------------
call pathogen#infect()
call pathogen#helptags()

" ------------
" better defaults
" -----------
set nobackup
set nowritebackup
set noswapfile
set t_Co=256
set autoindent
scriptencoding utf-8
set number
syntax on
set wildmode=list:longest
set wildchar=<Tab> wildmenu wildmode=full
" Hide search highlighting
map <Leader>h :set invhls <CR>
set cursorline

color ironman

" no scrollbars in macvim
set guioptions-=e
set guioptions-=r

" -----------------
" Text Formatting
" -----------------
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" show trailing whitespace
"set list listchars=tab:»·,trail:
set list listchars=tab:»·,trail:.

" ---------
" bindings
" ---------
let mapleader = ","
inoremap jj <Esc>
map <D-j> :b#<CR>
map <D-r> :bd<CR>
nmap <Leader>r :bd<CR>
"next quickfix file
map <D-'> :cnext<CR>
imap <Tab> <C-N>

imap sao save_and_open_page
imap `l p "=" * 80<ESC>

nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader># :set number<CR>
nmap <leader>n :set nonumber<CR>
"open file in macvim
map <Leader>m :!mvim % <CR>
" show trailing whitespace
set list listchars=tab:»·,trail:

" remove trailing whitespace and replace tabs with spaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" git blame shortcut
vmap <Leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" autoindent is good
filetype plugin indent on

silent autocmd bufwritepost .vimrc source $MYVIMRC
silent autocmd VimResized :TMiniBufExplorer<CR>

"-----------
" Syntax
" ----------

" rabl is ruby
au BufRead,BufNewFile *.rabl setf ruby

" make movement keys simpler
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()


map <Leader>B :bufdo bd <CR>
