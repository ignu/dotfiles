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
set list listchars=tab:»·,trail:

" ---------
" bindings
" ---------
let mapleader = ","
inoremap jj <Esc>
map <D-j> :b#<CR>
map <D-r> :bd<CR>
nmap <Leader>r :bd<CR>
map <Leader>t :tabnew<CR> 
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

silent autocmd bufwritepost .vimrc source $MYVIMRC 
silent autocmd VimResized :TMiniBufExplorer<CR> 

"-----------
" Syntax
" ----------

" rabl is ruby
au BufRead,BufNewFile *.rabl setf ruby
