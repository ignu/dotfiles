set shell=bash
set mouse=a

" ------------
" Pathogen
" ------------
call pathogen#infect()
call pathogen#helptags()

inoremap jk <ESC>
map <Right> :cnext<CR>
map <Left> :cprev<CR>

"---------------
" TSLIME/TURBUX
"------------------
let g:turbux_command_prefix = 'bundle exec'
let g:turbux_runner  = 'tslime'

" EMACS
noremap <C-a> <Home>
noremap <C-b> <Left>
noremap <C-f> <Right>
noremap <C-e> <End>

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

" open current buffer in NERDTree
map <Leader>q :NERDTreeFind<cr>

" Hide search highlighting
map <Leader>h :set invhls <CR>


noremap <Leader>] :GitGutterNextHunk<CR>

map <Leader>= :Tabularize /=<cr>
map <Leader>: :Tabularize /:<cr>
map <Leader>, :Tabularize /,<cr>
map <Leader>" :Tabularize /"<cr>


set cursorline

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>


color ironman
if has("gui_macvim")
  color corporation
endif

au BufRead,BufNewFile *.hamlc set ft=haml
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
"next quickfix file
map <D-'> :cnext<CR>
map <leader>' :w<CR> :cnext<CR>

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
nnoremap <silent> <F2> :Dispatch rspec %<CR>

" git blame shortcut
vmap <Leader>g :<C-U>!git blame -w <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" autoindent is good
filetype plugin indent on

silent autocmd bufwritepost .vimrc source $MYVIMRC 
silent autocmd VimResized :TMiniBufExplorer<CR> 

"-----------
" Syntax
" ----------

" rabl is ruby
au BufRead,BufNewFile *.rabl setf ruby

map <C-u> :tabn<CR>
map <C-i> :tabp<CR>

" make movement keys simpler
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"
" While editing a Markdown document in Vim, preview it in the
" default browser.
"
" Author: Nate Silva
"
" To install: Place markdown.vim in ~/.vim/ftplugin or
" %USERPROFILE%\vimfiles\ftplugin.
"
" To use: While editing a Markdown file, press ',p' (comma p)
"
" Tested on Windows and Mac OS X. Should work on Linux if you set
" BROWSER_COMMAND properly.
"
" Requires the `markdown` command to be on the system path. If you
" do not have the `markdown` command, install one of the following:
"
" http://www.pell.portland.or.us/~orc/Code/discount/
" http://www.freewisdom.org/projects/python-markdown/
"
function!PreviewMarkdown()
    " **************************************************************
    " Configurable settings

    let MARKDOWN_COMMAND = 'markdown'

    if has('win32')
        " note important extra pair of double-quotes
        let BROWSER_COMMAND = 'cmd.exe /c start ""'
    else
        let BROWSER_COMMAND = 'open'
    endif

    " End of configurable settings
    " **************************************************************

    silent update
    let output_name = tempname() . '.html'

    " Some Markdown implementations, especially the Python one,
    " work best with UTF-8. If our buffer is not in UTF-8, convert
    " it before running Markdown, then convert it back.
    let original_encoding = &fileencoding
    let original_bomb = &bomb
    if original_encoding != 'utf-8' || original_bomb == 1
        set nobomb
        set fileencoding=utf-8
        silent update
    endif

    " Write the HTML header. Do a CSS reset, followed by setting up
    " some basic styles from YUI, so the output looks nice.
    let file_header = ['<html>', '<head>',
        \ '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">',
        \ '<title>Markdown Preview</title>',
        \ '<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssreset/reset-min.css">',
        \ '<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssbase/base-min.css">',
        \ '<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssfonts/fonts-min.css">',
        \ '<style>body{padding:20px;}div#container{background-color:#F2F2F2;padding:0 20px;margin:0px;border:solid #D0D0D0 1px;}</style>',
        \ '</head>', '<body>', '<div id="container">']
    call writefile(file_header, output_name)

    let md_command = '!' . MARKDOWN_COMMAND . ' "' . expand('%:p') . '" >> "' .
        \ output_name . '"'
    silent exec md_command

    if has('win32')
        let footer_name = tempname()
        call writefile(['</div></body></html>'], footer_name)
        silent exec '!type "' . footer_name . '" >> "' . output_name . '"'
        exec delete(footer_name)
    else
        silent exec '!echo "</div></body></html>" >> "' .
            \ output_name . '"'
    endif

    " If we changed the encoding, change it back.
    if original_encoding != 'utf-8' || original_bomb == 1
        if original_bomb == 1
            set bomb
        endif
        silent exec 'set fileencoding=' . original_encoding
        silent update
    endif

    silent exec '!' . BROWSER_COMMAND . ' "' . output_name . '"'

endfunction

" Map this feature to the key sequence ',p' (comma lowercase-p)
map <Leader>M :call PreviewMarkdown()<CR>

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
map<Leader>O :OpenChangedFiles <CR>

map <Leader>h :cal SetSyn("html") <CR>

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


" Bring CtrlP back
nnoremap <leader>f :CtrlP<cr>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>j :Unite -buffer-name=files   file_rec<cr>
" nnoremap <leader>f :Unite -buffer-name=files   file_rec/async<cr>
nnoremap <leader>F :Unite -buffer-name=files   file<cr>
nnoremap <leader>1 :Unite -buffer-name=mru     file_mru<cr>
nnoremap <leader>2 :Unite -buffer-name=outline outline<cr>
nnoremap <leader>y :Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :Unite -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
