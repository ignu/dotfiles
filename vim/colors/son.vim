" Vim color scheme
"
" Name:         blackboard.vim
" Maintainer:   Ben Wyrosdick <ben.wyrosdick@gmail.com> 
" Last Change:  20 August 2009
" License:      public domain
" Version:      1.4

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "blackboard"

if has("gui_running")
  "GUI Colors
  highlight Normal guifg=White   guibg=#2A2822
  highlight Cursor guifg=Black   guibg=Yellow
  highlight CursorLine guifg=#E4E2E0 guibg=#64614F
  highlight LineNr guibg=#323232 guifg=#888888
  highlight Folded guifg=#f1f3e8 guibg=#444444
  highlight Pmenu guibg=#84A7C1

  "General Colors
  highlight Comment  guifg=#7B7466
  highlight Constant guifg=#CAFE1E
  highlight Keyword  guifg=#63C793
  highlight String   guifg=#0076EC
  highlight Type     guifg=#B18C67
  highlight Identifier guifg=#B48C8C gui=NONE
  highlight Function guifg=#B48C8C gui=NONE
  highlight clear Search
  highlight Search guibg=#1C3B79
  highlight PreProc guifg=#FF5600

  "HTML Colors
  highlight link htmlTag Type
  highlight link htmlEndTag htmlTag
  highlight link htmlTagName htmlTag

  "Ruby Colors
  highlight link rubyClass Keyword
  highlight link rubyDefine Keyword
  highlight link rubyConstant Type
  highlight link rubySymbol Constant
  highlight link rubyStringDelimiter rubyString
  highlight link rubyInclude Keyword
  highlight link rubyAttribute Keyword
  highlight link rubyInstanceVariable Normal

  "Rails Colors
  highlight link railsMethod Type
end
