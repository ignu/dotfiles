set shell=bash
set mouse=a
imap jj <Esc>

let mapleader=" "
let maplocalleader=" "
" ------------
" Plugins
" ------------
call plug#begin('~/.vim/bundle')

" Purgatory
" Plug 'scrooloose/nerdcommenter'

" New

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'rojspencer/vim-colorminder'
Plug 'jremmen/vim-ripgrep'
Plug 'gko/vim-coloresque'
Plug 'junegunn/vim-github-dashboard'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-janah'
Plug 'sbdchd/neoformat'
Plug 'benizi/vim-automkdir'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'wokalski/autocomplete-flow'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'
Plug 'flowtype/vim-flow', { 'on': ['FlowType', 'FlowToggle', 'FlowMake']}
Plug 'steelsojka/deoplete-flow'
Plug 'chemzqm/vim-jsx-improve'
Plug 'sk1418/Join'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'junegunn/vim-emoji'

Plug 'MattesGroeger/vim-bookmarks'

" Essentials
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/localvimrc'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'tmhedberg/matchit'

" TMUX
Plug 'git://github.com/LnL7/vim-tslime.git',
Plug 'janko-m/vim-test'

" Lanugage
Plug 'reasonml-editor/vim-reason-plus'
Plug 'toyamarinyon/vim-swift', { 'for': 'swift' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'ElmCast/elm-vim', { 'for' : 'elm' }
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'leafgarland/typescript-vim'

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
Plug 'bogado/file-line'
Plug 'airblade/vim-rooter'

" COLORS
"
Plug 'jakwings/vim-colors'
Plug 'trevordmiller/nova-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1
Plug 'vim-scripts/ScrollColors'
Plug 'jeetsukumaran/vim-nefertiti'
Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-vividchalk'
Plug 'noahfrederick/vim-hemisu'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'AlessandroYorba/Alduin'

"GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'

let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

nnoremap <silent> gf :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

if has('folding')
  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif
end
let g:airline_section_y = '%{bufnr("%")}'
let g:airline_powerline_fonts = 1
let g:airline_right_sep=''
let g:airline_left_sep=' '
" Vim Bookmarks...
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

" FZF
noremap <C-p> :GitFiles<CR>
noremap ,g :GFiles?<CR>
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:alchemist#extended_autocomplete = 1


set wildmode=list:longest,list:full
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

let g:useSystemClipboard = 0
function! UseSystemClipboard()
  if g:useSystemClipboard
    echom "Using Vim Clipboard. ⓥ"
    let g:useSystemClipboard = 0
    set clipboard=""
  else
    echom "Using System Clipboard. 🌈"
    let g:useSystemClipboard = 1
    set clipboard=unnamed
  endif
endfunction
noremap <F6> :call UseSystemClipboard()<CR>

"Loccal config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
let g:fzf_action = {
    \ 'ctrl-q': 'wall | bdelete',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

function! Elixirlinter(buffer, lines) abort
    " Matches patterns like the following:
    "
    " (CompileError) apps/sim/lib/sim/server.ex:87: undefined function update_in/4
    "
    " TODO include warnings
    let l:pattern = '\v\((CompileError|SyntaxError)\) ([^:]+):([^:]+): (.+)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:type = 'C'
        let l:text = l:match[4]

        call add(l:output, {
        \   'bufnr': a:buffer,
        \   'lnum': l:match[3] + 0,
        \   'col': 0,
        \   'type': l:type,
        \   'text': l:text,
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('elixir', {
\   'name': 'elixirc',
\   'executable': 'elixirc',
\   'command': 'mix compile',
\   'callback': 'Elixirlinter',
\})

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_error =  '✗'
let g:ale_sign_warning = '⚠'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '∑' 
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'javascript': [],
\}

let g:gitgutter_sign_added = emoji#for('eight_spoked_asterisk')
let g:gitgutter_sign_modified = emoji#for('pencil2')
let g:gitgutter_sign_removed = "-"
let g:gitgutter_sign_modified_removed = "-"

autocmd FileType javascript set formatprg=prettier\ --stdin\ --single-quote
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#flow#flow_bin = 'flow'

let g:javascript_plugin_flow = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_arrow_function       = "⇒"

set so=14
"set ttymouse=xterm2

" no more /g
set gdefault

let g:vimrubocop_ignore_warning = 1

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set numberwidth=1

"-----------------
" MAPPINGS 🚀 
"-----------------

"-------------
" INSERT  🌈

" Escape when trying to find cursor
inoremap jk <ESC>

"-------------
" NORMAL  🌈

" EMACS
noremap <C-a> <Home>
noremap <C-b> <Left>
noremap <C-f> <Right>
noremap <C-e> <End>

" make movement keys simpler
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

noremap <Up> :GitGutterPrevHunk<CR>
noremap <Down> :GitGutterNextHunk<CR>
" Arrow Keys Navigate QuickFix Window
noremap <Right> :cnext<CR>
noremap <Left> :cprev<CR>
noremap <space>j :lnext<CR>
noremap <space>k :lprev<CR>

" Search for character under word
:nnoremap <space><space> :Ag <cword> <CR>

noremap <Leader><Right> :Tx rake db:migrate<CR>
noremap <Leader><Left> :Tx rake db:rollback<CR>
noremap <Leader><Up> :GitGutterLineHighlightsToggle<CR>

nnoremap ;a :ALEToggle<cr>
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
nnoremap <silent> <Leader>r :Bclose<CR>

nnoremap <leader>n :set number!<CR>
nnoremap <leader>N :set relativenumber!<CR>
nnoremap ,u :GitGutterUndoHunk<CR>
noremap ,+ :GitGutterStageHunk<CR>
noremap ,c :Git commit<CR>

noremap<space>O :OpenChangedFiles <CR>

noremap <leader>q :execute "rightbelow split " . bufname("#")<cr>

nnoremap <silent> <space>r :Bclose<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap <silent> t :w<cr> :TestNearest<CR>
nnoremap <silent> T :w<cr> :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

let test#strategy = "tslime"

nnoremap <leader>v :tabedit ~/bin/dotfiles/vimrc<CR>
nnoremap Z :noremap <F1> :w!

noremap <Leader><F1> :ResetTmuxVars<CR>
noremap <F1> :echo expand('%:t')<CR>
" remove trailing whitespace and replace tabs with spaces
" Press F4 to toggle highlighting on/off, and show current value.
" F2 gets trampled
nnoremap <F3> :Buffers<CR>
noremap <Leader><F3> :Tx bundle<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
" F6  - use system clipboard
nnoremap <F7> :call LanguageClient#textDocument_rename()<cr>
nnoremap <F8> :GitGutterToggle<cr>
nnoremap <F9> :bufdo! bd<cr>
nnoremap <F10> :Neoformat<cr>
nnoremap ,p :Neoformat<cr>
noremap <F11> :NERDTreeFind<CR>
noremap <F12> :NERDTreeToggle<CR>


" RSI sucks. save with \ my pooooor thumb
noremap \ :w<CR>

" Copy Paragraph
noremap cp yap<S-}>p 
" OPEN LOGS
nmap K :vsp<cr>:Glog<cr>

"select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

"dont get confused when lines wrap
nnoremap j gj
nnoremap k gk

" simpler surround.vim
:onoremap p i(
:onoremap q i"

"-------------
" INSERT  🌈
"
"next quickfix file
iabbrev sao save_and_open_page
iabbrev SAO save_and_open_screenshot

"-------------
" VISUAL  🌈
"
" git blame shortcut
vnoremap <space>g :<C-U>!git blame -w <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

vnoremap <Leader>= :Tabularize /=<cr>
vnoremap <Leader>: :Tabularize /:<cr>
vnoremap <Leader>, :Tabularize /,<cr>
vnoremap <Leader>" :Tabularize /"<cr>

map <Tab> :tabn<cr>
map <S-Tab> :tabp<cr>

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

let g:jsx_ext_required = 0
set cursorline

autocmd ColorScheme janah highlight Normal ctermbg=235

set background=dark
if has("persistent_undo")
  set undodir=~/.vim/undodir
  set undofile
endif

" no scrollbars in macvim
set guioptions-=e
set guioptions-=r

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

" }}}
" Text objects ------------------------------------------------------------ {{{

" Shortcut for [] {{{

" show trailing whitespace
set list listchars=tab:»·,trail:ç

" autoindent is good
filetype plugin indent on

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
" }}}

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif

let g:committia_hooks = {}
let g:committia_open_only_vim_starting = 1
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

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
