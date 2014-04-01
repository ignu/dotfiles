set shell=bash
set mouse=a

" ------------
" Pathogen
" ------------
call pathogen#infect()
call pathogen#helptags()

set so=14
set ttymouse=xterm2

let g:vimrubocop_ignore_warning = 1

" Escape when trying to find cursor
inoremap jk <ESC>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set numberwidth=1

nnoremap ; :

"---------------
" TSLIME/TURBUX
"------------------
let g:turbux_command_prefix = 'bundle exec'
let g:turbux_runner  = 'tslime'
noremap <Leader><Right> :Tx rake db:migrate<CR>
noremap <Leader><Left> :Tx rake db:rollback<CR>

noremap <Up> :GitGutterPrevHunk<CR>
noremap <Down> :GitGutterNextHunk<CR>

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
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set list listchars=tab:»·,trail:.

" ---------
" bindings
" ---------
let mapleader = ","
noremap <D-j> :b#<CR>
noremap <D-r> :bd<CR>
"next quickfix file
noremap <D-'> :cnext<CR>
noremap <leader>' :w<CR> :cnext<CR>
iabbrev sao save_and_open_page
iabbrev SAO save_and_open_screenshot

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
noremap <F2> :noremap <F1> :Tx
:nnoremap <F3> :buffers<CR>:b<Space>
noremap <Leader><F3> :Tx bundle<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
:nnoremap <F9> :bufdo! bd<cr>
noremap <F12> :NERDTreeToggle<CR>
noremap <F11> :NERDTreeFind<CR>

" git blame shortcut
vnoremap <Leader>g :<C-U>!git blame -w <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" autoindent is good
filetype plugin indent on

"silent autocmd VimResized :TMiniBufExplorer<CR>

"-----------
" Syntax
" ----------

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
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
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

" Bring CtrlP back
nnoremap <leader>f :CtrlP<cr>

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
