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


Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim', { 'branch': 'main' }
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils', { 'branch' : 'main'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim', {'branch' : 'main'}
Plug 'MunifTanjim/prettier.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'ThePrimeagen/harpoon'

"silent! let g:plugs['nvim-tree.lua'].commit = '9008bac180f84f71e5334311bdcb937bd57b6be0'
"Plug 'kyazdani42/nvim-tree.lua'
Plug 'luukvbaal/nnn.nvim'

Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-projectionist'
Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-startify'
Plug 'benizi/vim-automkdir'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'chentau/marks.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'windwp/nvim-ts-autotag', { 'branch': 'main' }

"Complete
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'ignu/friendly-snippets', { 'branch': 'main' }
Plug 'benfowler/telescope-luasnip.nvim'
Plug 'meain/vim-package-info', { 'do': 'npm install' }

Plug 'nvim-lua/plenary.nvim'
Plug 'tami5/lspsaga.nvim', { 'branch': 'main' }
Plug 'williamboman/nvim-lsp-installer'

" modals
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'


" Eval
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-emoji'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }

" navigate with -
"Plug 'tpope/vim-vinegar'

" Rename, etc unix functions
Plug 'tpope/vim-eunuch'

" More commands are repeatable
Plug 'tpope/vim-repeat'

" WTF ARE THESE?
Plug 'gko/vim-coloresque'
Plug 'rojspencer/vim-colorminder'
"Plug 'tpope/vim-sleuth'

Plug 'mhartington/formatter.nvim'

Plug 'rcarriga/nvim-notify'

" Obsolete?
"
" Plug 'wokalski/autocomplete-flow'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'ternjs/tern_for_vim'
" Plug 'flowtype/vim-flow', { 'on': ['FlowType', 'FlowToggle', 'FlowMake']}
" Plug 'steelsojka/deoplete-flow'
" Plug 'chemzqm/vim-jsx-improve'
" Plug 'sk1418/Join'

Plug 'chentau/marks.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Essentials
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'branch' : 'main', 'do': 'make' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/localvimrc'
Plug 'godlygeek/tabular'
Plug 'tmhedberg/matchit'

" TMUX
Plug 'LnL7/vim-tslime',
Plug 'janko-m/vim-test'

" Lanugage
Plug 'reasonml-editor/vim-reason-plus', { 'for': 'reason' }
Plug 'toyamarinyon/vim-swift', { 'for': 'swift' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'fatih/vim-go', { 'for' : 'go' }
Plug 'ElmCast/elm-vim', { 'for' : 'elm' }
Plug 'elixir-editors/vim-elixir', {'for' : 'elixir'}
Plug 'slashmili/alchemist.vim', {'for' : 'elixir'}
" Plug 'leafgarland/typescript-vim'

" Templates
Plug 'slim-template/vim-slim', { 'for': ['slim', 'skim'] }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-markdown', { 'for': ['md', 'markdown'] }

" Ruby
Plug 'tpope/vim-rails', { 'for' : 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for' : 'ruby' }
"Plug 'tpope/vim-endwise', { 'for' : 'ruby' }
"Plug 'ecomba/vim-ruby-refactoring', { 'for' : 'ruby' }
"Plug 'tpope/vim-cucumber', { 'for' : 'feature' }
Plug 'tpope/vim-bundler', { 'for' : 'ruby' }
Plug 'jgdavey/vim-blockle'

" Navigation/Search
Plug 'bogado/file-line'
Plug 'airblade/vim-rooter'

" COLORS
" Treesitter friendly
Plug 'shaeinst/roshnivim-cs', { 'branch': 'main' }
Plug 'rafamadriz/neon', { 'branch': 'main' }
Plug 'marko-cerovac/material.nvim', { 'branch': 'main'}
Plug 'rebelot/kanagawa.nvim'
Plug 'jacoborus/tender.vim'
let g:material_style = 'darker'

"Plug 'jakwings/vim-colors'
"Plug 'trevordmiller/nova-vim'

" Color Scheme Framework used by other color schemes
Plug 'AlessandroYorba/Alduin'
Plug 'shaunsingh/moonlight.nvim'
Plug 'rockerBOO/boo-colorscheme-nvim'
Plug 'rktjmp/lush.nvim' 
Plug 'adisen99/apprentice.nvim'
Plug 'whatyouhide/vim-gotham'
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' }
let g:gruvbox_italic=1
"Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'sainnhe/everforest'
Plug 'savq/melange'

let g:neon_style='dark'
let g:neon_italic_keyword=1
let g:neon_italic_function=1
let g:neon_transparent=1

"GIT
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim', { 'branch': 'main' }
Plug 'rhysd/committia.vim'

" TODO: move this to a gui nvimcr 


"nnoremap <silent> gf :call LanguageClient_textDocument_definition()<cr>
"nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

if has('folding')
  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif
end

" FZF
noremap <C-p> :Telescope git_files<CR>
noremap <leader>ff :Telescope live_grep<CR>
noremap <leader>fb :Telescope buffers<CR>
noremap <leader>f? :Telescope help_tags<CR>
noremap <leader>fl :Telescope lsp_references<CR>
noremap <leader>fm :Telescope marks<CR>
noremap <leader>fk :Telescope keymaps<CR>
call plug#end()


let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0


let g:alchemist#extended_autocomplete = 1


set wildmode=list:longest,list:full
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <S-Tab> <c-n>

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

autocmd FileType javascript set formatprg=prettier\ --stdin\ --single-quote
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

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

noremap <C-s> :w<CR> :FormatWrite<CR>
inoremap <C-s> <ESC>:w<CR> :FormatWrite<CR>
" EMACS
" noremap <C-a> <Home>
" noremap <C-b> <Left>
" noremap <C-f> <Right>
" " noremap <C-e> <End>

" make movement keys simpler
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

noremap <Up> :Gitsigns next_hunk<CR>
noremap <Down> :Gitsigns prev_hunk<CR>
" Arrow Keys Navigate QuickFix Window
noremap <Right> :cnext<CR>
noremap <Left> :cprev<CR>
noremap <space>j :lnext<CR>
noremap <space>k :lprev<CR>

" Search for character under word
:nnoremap <space><space> :Rg <cword> <CR>

noremap <Leader><Right> :Tx rake db:migrate<CR>
noremap <Leader><Left> :Tx rake db:rollback<CR>
noremap <Leader><Up> :GitGutterLineHighlightsToggle<CR>

nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
nnoremap <silent> <Leader>r :Bclose<CR>

nnoremap <leader>n :set number!<CR>
nnoremap <leader>N :set relativenumber!<CR>
nnoremap ,u :Gitsigns undo_stage_hunk<CR>
noremap ,+ :Gitsigns stage_hunks<CR>
noremap ,c :Git commit<CR>

noremap <leader>O :Telescope git_status <CR>

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
noremap ,a :set hlsearch! hlsearch?<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
" F6  - use system clipboard
nnoremap <F7> :call LanguageClient#textDocument_rename()<cr>
nnoremap <F8> :GitGutterToggle<cr>
nnoremap <F9> :bufdo! bd<cr>

nnoremap <F11> :NnnPicker %:p:h<CR>
tnoremap <F11> :NnnExplorer<CR>
nnoremap - :NnnPicker<CR>
nnoremap - :NnnPicker %:p:h<CR>

" RSI sucks. save with \ my pooooor thumb
noremap \ :w<CR>

" Copy Paragraph
" noremap cp yap<S-}>p 
" OPEN LOGS

"select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

"dont get confused when lines wrap
nnoremap j gj
nnoremap k gk

" simpler surround.vim
:onoremap p i(
:onoremap q i"

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
  silent autocmd bufwritepost vimrc source $MYVIMRC

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
"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

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
set list listchars=tab:»·,trail:.

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
