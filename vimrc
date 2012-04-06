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

color jellybeans

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

