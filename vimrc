set shell=bash
set mouse=a
imap jj <Esc>

" ------------
" Plugins
" ------------
call plug#begin('~/.vim/bundle')

" Purgatory
" Plug 'scrooloose/nerdcommenter'

" New
Plug 'gko/vim-coloresque'
Plug 'junegunn/vim-github-dashboard'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-janah'
Plug 'flowtype/vim-flow'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'benizi/vim-automkdir'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'
Plug 'flowtype/vim-flow'
Plug 'steelsojka/deoplete-flow'
Plug 'chemzqm/vim-jsx-improve'
Plug 'itmammoth/doorboy.vim'
Plug 'leafgarland/typescript-vim'

" Essentials
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/localvimrc'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'msanders/snipmate.vim'
Plug 'tmhedberg/matchit'

" TMUX
Plug 'git://github.com/LnL7/vim-tslime.git',
Plug 'git://github.com/jgdavey/vim-turbux.git',

" Lanugage
Plug 'toyamarinyon/vim-swift', { 'for': 'swift' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'kchmck/vim-coffee-script'
Plug 'jnwhiteh/vim-golang'
Plug 'ElmCast/elm-vim', { 'for' : 'elm' }

" Templates
Plug 'slim-template/vim-slim', { 'for': ['slim', 'skim'] }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-markdown', { 'for': ['md', 'markdown'] }

" Ruby
Plug 'tpope/vim-rails', { 'for' : 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for' : 'ruby' }
Plug 'tpope/vim-endwise', { 'for' : 'ruby' }
Plug 'ecomba/vim-ruby-refactoring', { 'for' : 'ruby' }
Plug 'tpope/vim-cucumber', { 'for' : 'feature' }
Plug 'tpope/vim-bundler', { 'for' : 'ruby' }
Plug 'jgdavey/vim-blockle'

" Navigation/Search
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'bogado/file-line'
Plug 'airblade/vim-rooter'

" COLORS
Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/ScrollColors'
Plug 'jeetsukumaran/vim-nefertiti'
Plug 'zenorocha/dracula-theme'
Plug 'junegunn/seoul256.vim'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-vividchalk'
Plug 'noahfrederick/vim-hemisu'

"GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" NEOFORMAT
"
autocmd FileType javascript set formatprg=prettier\ --stdin\ --single-quote
autocmd FileType typescript :set makeprg=tsc

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#flow#flow_bin = 'flow'

" NEOMAKE
let g:neomake_javascript_enabled_makers = []
let g:neomake_jsx_enabled_makers = []

if executable('eslint')
  let g:neomake_javascript_enabled_makers += ['eslint']
  let g:neomake_jsx_enabled_makers += ['eslint']
endif
if executable('flow')
  let g:neomake_javascript_enabled_makers += ['flow']
  let g:neomake_jsx_enabled_makers += ['flow']
endif

let g:javascript_plugin_flow = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_arrow_function       = "⇒"

set so=14
set relativenumber
"set ttymouse=xterm2

let g:vimrubocop_ignore_warning = 1

" Escape when trying to find cursor
inoremap jk <ESC>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set numberwidth=1

nnoremap ; :
inoremap ;fl (╯°□°）╯︵ ┻━┻"

"---------------
" TSLIME/TURBUX
"------------------
let g:turbux_command_prefix = 'bundle exec'
let g:turbux_runner  = 'tslime'
noremap <Leader><Right> :Tx rake db:migrate<CR>
noremap <Leader><Left> :Tx rake db:rollback<CR>

noremap <Up> :GitGutterPrevHunk<CR>
noremap <Down> :GitGutterNextHunk<CR>
nmap <Leader>+ :GitGutterStageHunk<CR>

" Arrow Keys Navigate QuickFix Window
noremap <Right> :cnext<CR>
noremap <Left> :cprev<CR>
noremap <Leader><Up> :GitGutterLineHighlightsToggle<CR>

" simpler surround.vim
:onoremap p i(
:onoremap q i"

" Copy Paragraph
noremap cp yap<S-}>p

" ---------
" EMACS
" ---------
noremap <C-a> <Home>
noremap <C-b> <Left>
noremap <C-f> <Right>
noremap <C-e> <End>

"noremap <C-l> :match ErrorMsg '\%>79v.\+'<CR>

" ------------
" better defaults
" -----------
set nobackup
set nowritebackup
set noswapfile
set autoread
set t_Co=256

"set autoindent
scriptencoding utf-8
set number
set autoread
set wildmode=list:longest
set wildchar=<Tab> wildmenu wildmode=full

" RSI sucks. my pooooor thumb
noremap \ :w<CR>

" save and restore folds when a file is closed and re-opened. ugh.
autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview 


augroup MiscMisc
  au!
  silent autocmd bufwritepost .vimrc source $MYVIMRC

  " remember fold positions
  autocmd BufWinLeave .* mkview
  autocmd BufWinEnter .* silent loadview
augroup END

" Remember last location in file
augroup RememberPosition
  au!
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
augroup END


" Do not show cursorline on inactive panes
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

augroup NewSyntaxes
  au!
  " rabl is ruby
  au BufRead,BufNewFile *.rabl setf ruby
  au BufRead,BufNewFile *.hamlc set ft=haml
  au BufRead,BufNewFile *.skim set ft=slim
augroup end

map <Leader>= :Tabularize /=<cr>
map <Leader>: :Tabularize /:<cr>
map <Leader>, :Tabularize /,<cr>
map <Leader>" :Tabularize /"<cr>

let g:jsx_ext_required = 0
set cursorline

noremap ; :Ag

autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah

set background=dark
if has("persistent_undo")
  set undodir=~/.vim/undodir
  set undofile
endif

" no scrollbars in macvim
set guioptions-=e
set guioptions-=r
nmap K :vsp<cr>:Glog<cr>

" SILVER SEARCHER
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" -----------------
" Text Formatting
" -----------------
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
set splitbelow
set splitright
set autowrite
set autoread
set shiftround
set title
set linebreak
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set list listchars=tab:»·,trail:.

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Save when losing focus
au FocusLost * :silent! wall

nnoremap Q gqip

let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030 ctermbg=234
nnoremap <F7> :call IndentGuides()<cr>

" }}}
" Text objects ------------------------------------------------------------ {{{

" Shortcut for [] {{{

onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" ---------
" bindings
" ---------
let mapleader = ","
nmap <Space> ,

noremap <D-j> :b#<CR>
noremap <D-r> :bd<CR>

"next quickfix file
noremap <D-'> :cnext<CR>
noremap <leader>' :w<CR> :cnext<CR>
iabbrev sao save_and_open_page
iabbrev SAO save_and_open_screenshot

iabbrev furm # rubocop:disable MethodLength

noremap <leader>q :execute "rightbelow split " . bufname("#")<cr>

map <Tab> :tabn<cr>
map <S-Tab> :tabp<cr>
inoremap ;pr require 'pry'; binding.pry<esc>
inoremap `l p "=" * 80<ESC>

nnoremap <leader>v :tabedit ~/bin/dotfiles2.0/vimrc<CR>
nnoremap <leader>n :set number!<CR>
nnoremap <leader>N :set relativenumber!<CR>

" show trailing whitespace
set list listchars=tab:»·,trail:

noremap <Leader><F1> :ResetTmuxVars<CR>
noremap <F1> :echo expand('%:t')<CR>
" remove trailing whitespace and replace tabs with spaces
" Press F4 to toggle highlighting on/off, and show current value.
nmap <F2> :noremap <Enter> :Tx
:nnoremap <F3> :buffers<CR>:b<Space>
noremap <Leader><F3> :Tx bundle<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
:nnoremap <F8> :GitGutterToggle<cr>
:nnoremap <F9> :bufdo! bd<cr>
:nnoremap <F10> :Neoformat<cr>
noremap <F11> :NERDTreeFind<CR>
noremap <F12> :NERDTreeToggle<CR>

" git blame shortcut
vnoremap <Leader>g :<C-U>!git blame -w <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" autoindent is good
filetype plugin indent on

nmap <> :tabn<CR>

"Ack current word
nmap <C-;>a :vsp<cr> :exe "Ag " .  expand("<cword>") . " "<cr>
nmap <leader>a :vsp<cr> :exe "Ag " .  expand("<cword>") . " "<cr>

" make movement keys simpler
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

let g:startify_custom_header = [
  \'',
  \'',
  \'  ____   ____.__  .___   _____                                      .___  ',
  \'  \   \ /   /|__| |   | /     \ _____________  _______  __ ____   __| _/  ',
  \'   \   Y   / |  | |   |/  \ /  \\____ \_  __ \/  _ \  \/ // __ \ / __ |   ',
  \'    \     /  |  | |   /    Y    \  |_> >  | \(  <_> )   /\  ___// /_/ |   ',
  \'     \___/   |__| |___\____|__  /   __/|__|   \____/ \_/  \___  >____ |   ',
  \'                              \/|__|                          \/     \/   ',
  \]

" OpenChangedFiles (<Leader>O)---------------------- {{{
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")

  if len(filenames) < 1
    let status = system('git show --pretty="format:" --name-only')
    let filenames = split(status, "\n")
  endif

  exec "edit " . filenames[0]

  for filename in filenames[1:]
    if len(filenames) > 4
      exec "tabedit " . filename
    else
      exec "sp " . filename
    endif
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()
noremap<Leader>O :OpenChangedFiles <CR>
" }}}

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif

let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>r :Bclose<CR>

nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>79v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction


fun! s:FindWordUnderCursor()
  " Yank the word under the cursor into the z register
  normal "zyiw
  exec "copen"

  exec "Ag " . @z
endfun
nmap <Leader>a :call s:FindWordUnderCursor()
