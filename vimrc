set shell=bash
set mouse=a
imap jj <Esc>

" ------------
" Plugins
" ------------
call plug#begin('~/.vim/bundle')

" Purgatory
" Plug 'Lokaltog/vim-easymotion'
" Plug 'scrooloose/nerdcommenter'
" Plug 'git://github.com/vim-scripts/YankRing.vim.git'
" git://github.com/shinokada/dragvisuals.vim.git

" New
Plug 'junegunn/vim-github-dashboard'

" Essentials
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/localvimrc'
Plug 'scrooloose/syntastic'
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
Plug 'vitaly/vim-syntastic-coffee', { 'for' : 'coffee' }
Plug 'kchmck/vim-coffee-script', { 'for' : 'coffee' }
Plug 'jnwhiteh/vim-golang'

" Templates
Plug 'slim-template/vim-slim', { 'for': ['slim', 'skim'] }
Plug 'juvenn/mustache.vim'
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-markdown', { 'for': ['md', 'markdown'] }

" JavaScript
Plug 'ignu/javascript_spec_navigator.vim'
Plug 'pangloss/vim-javascript', { 'for' : 'javascript' }

" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'ecomba/vim-ruby-refactoring', { 'for' : 'ruby' }
Plug 'tpope/vim-cucumber', { 'for' : 'feature' }
Plug 'tpope/vim-bundler'
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
Plug 'reedes/vim-colors-pencil'
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

set so=14
set ttymouse=xterm2

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
noremap <Leader>+ :GitGutterStageHunk<CR>

" Arrow Keys Navigate QuickFix Window
noremap <Right> :cnext<CR>
noremap <Left> :cprev<CR>
noremap <Leader><Up> :GitGutterLineHighlightsToggle<CR>

" simpler surround.vim
:onoremap p i(
:onoremap q i"

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
syntax on
set wildmode=list:longest
set wildchar=<Tab> wildmenu wildmode=full

" RSI sucks. my pooooor thumb
noremap \ :w<CR>

" save and restore folds when a file is closed and re-opened. ugh.
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 


augroup MiscMisc
  au!
  silent autocmd bufwritepost .vimrc source $MYVIMRC

  " let autocomplete work for marionette handlers
  au BufRead,BufNewFile *.coffee setlocal iskeyword+=:

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

noremap <Leader>G :GitGutterNextHunk<CR>

map <Leader>= :Tabularize /=<cr>
map <Leader>: :Tabularize /:<cr>
map <Leader>, :Tabularize /,<cr>
map <Leader>" :Tabularize /"<cr>

noremap cp yap<S-}>p

set cursorline

noremap ; :Ag

color blackboard
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

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

cnoremap <c-a> <home>
cnoremap <c-e> <end>

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

" }}}
" Next and Last {{{
"
" Motion for "next/last object".  "Last" here means "previous", not "final".
" Unfortunately the "p" motion was already taken for paragraphs.
"
" Next acts on the next object of the given type, last acts on the previous
" object of the given type.  These don't necessarily have to be in the current
" line.
"
" Currently works for (, [, {, and their shortcuts b, r, B.
"
" Next kind of works for ' and " as long as there are no escaped versions of
" them in the string (TODO: fix that).  Last is currently broken for quotes
" (TODO: fix that).
"
" Some examples (C marks cursor positions, V means visually selected):
"
" din'  -> delete in next single quotes                foo = bar('spam')
"                                                      C
"                                                      foo = bar('')
"                                                                C
"
" canb  -> change around next parens                   foo = bar('spam')
"                                                      C
"                                                      foo = bar
"                                                               C
"
" vin"  -> select inside next double quotes            print "hello ", name
"                                                       C
"                                                      print "hello ", name
"                                                             VVVVVV

onoremap an :<c-u>call <SID>NextTextObject('a', '/')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', '/')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', '/')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', '/')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', '?')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', '?')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', '?')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', '?')<cr>


function! s:NextTextObject(motion, dir)
    let c = nr2char(getchar())
    let d = ''

    if c ==# "b" || c ==# "(" || c ==# ")"
        let c = "("
    elseif c ==# "B" || c ==# "{" || c ==# "}"
        let c = "{"
    elseif c ==# "r" || c ==# "[" || c ==# "]"
        let c = "["
    elseif c ==# "'"
        let c = "'"
    elseif c ==# '"'
        let c = '"'
    else
        return
    endif

    " Find the next opening-whatever.
    execute "normal! " . a:dir . c . "\<cr>"

    if a:motion ==# 'a'
        " If we're doing an 'around' method, we just need to select around it
        " and we can bail out to Vim.
        execute "normal! va" . c
    else
        " Otherwise we're looking at an 'inside' motion.  Unfortunately these
        " get tricky when you're dealing with an empty set of delimiters because
        " Vim does the wrong thing when you say vi(.

        let open = ''
        let close = ''

        if c ==# "("
            let open = "("
            let close = ")"
        elseif c ==# "{"
            let open = "{"
            let close = "}"
        elseif c ==# "["
            let open = "\\["
            let close = "\\]"
        elseif c ==# "'"
            let open = "'"
            let close = "'"
        elseif c ==# '"'
            let open = '"'
            let close = '"'
        endif

        " We'll start at the current delimiter.
        let start_pos = getpos('.')
        let start_l = start_pos[1]
        let start_c = start_pos[2]

        " Then we'll find it's matching end delimiter.
        if c ==# "'" || c ==# '"'
            " searchpairpos() doesn't work for quotes, because fuck me.
            let end_pos = searchpos(open)
        else
            let end_pos = searchpairpos(open, '', close)
        endif

        let end_l = end_pos[0]
        let end_c = end_pos[1]

        call setpos('.', start_pos)

        if start_l == end_l && start_c == (end_c - 1)
            " We're in an empty set of delimiters.  We'll append an "x"
            " character and select that so most Vim commands will do something
            " sane.  v is gonna be weird, and so is y.  Oh well.
            execute "normal! ax\<esc>\<left>"
            execute "normal! vi" . c
        elseif start_l == end_l && start_c == (end_c - 2)
            " We're on a set of delimiters that contain a single, non-newline
            " character.  We can just select that and we're done.
            execute "normal! vi" . c
        else
            " Otherwise these delimiters contain something.  But we're still not
            " sure Vim's gonna work, because if they contain nothing but
            " newlines Vim still does the wrong thing.  So we'll manually select
            " the guts ourselves.
            let whichwrap = &whichwrap
            set whichwrap+=h,l

            execute "normal! va" . c . "hol"

            let &whichwrap = whichwrap
        endif
    endif
endfunction

" ---------
" bindings
" ---------
let mapleader = ","
nmap <Space> ,

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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

nnoremap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>n :set number!<CR>
nnoremap <leader>N :set relativenumber!<CR>
"open file in macvim
noremap <Leader>m :!mvim % <CR>

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
noremap <F12> :NERDTreeToggle<CR>
noremap <F11> :NERDTreeFind<CR>

nmap <Leader><F12> :e ~/Dropbox/Notes/<cr>
nmap <Leader><F12> :e ~/Dropbox/Notes/TIL.md<cr>
nmap <Leader><F1> :e ~/.vim/update_bundles<cr>

" git blame shortcut
vnoremap <Leader>g :<C-U>!git blame -w <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" autoindent is good
filetype plugin indent on

"silent autocmd VimResized :TMiniBufExplorer<CR>

"-----------
" Syntax
" ----------
" Don't stomp over Ctrl-P
let g:yankring_paste_n_bkey = 'T'
let g:yankring_paste_n_akey = 't'
let g:yankring_paste_v_bkey = 'T'
let g:yankring_paste_v_akey = 't'
"nmap <C-t> :CtrlP<cr>


nmap <> :tabn<CR>
"noremap <C-u> :tabn<CR>
"noremap <C-i> :tabp<CR>

"Ack current word
nmap <C-;>a :vsp<cr> :exe "Ag " .  expand("<cword>") . " "<cr>
nmap <leader>a :vsp<cr> :exe "Ag " .  expand("<cword>") . " "<cr>
noremap  <leader>z :call JsSpecNavigate()<CR>

" make movement keys simpler
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

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

noremap <Leader>h :cal SetSyn("html") <CR>

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

"let g:rails_projections = {
"      \ "app/services/cloud_stack/*_service.rb": {
"      \   "command" : "service",
"      \   "affinity": "model",
"      \   "template": "class CloudStack::%SService\n  include",
"      \   "keywords": "service",
"      \   "test"    : "spec/services/cloud_stack/%s_spec.rb"
"      \ }

nmap <leader>f <Plug>(easymotion-jumptoanywhere)

" DRAG VISUALS
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

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
