" Vim color file
" Maintainer:  Michael Boehler
" Mail:        michael@familie-boehler.de
" Last Change: 2008-2-21
" Version:     3.2
" This color scheme uses a light background.
" GUI only
" inspired by colorsheme PYTE

set background=light
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "blank"

hi PMenu      ctermfg=248  ctermbg=0
hi PMenuSel   ctermfg=223 ctermbg=235
