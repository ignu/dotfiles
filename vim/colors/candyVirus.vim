" candyVirus vim colorscheme
" AUTHOR: Ercolanelli Léo
" CONTACT: leo.ercolanelli@gmail.com


"================================================
" Option:
"================================================

hi clear
if exists("syntax_on")
    syntax reset
endif

if exists("g:candyVirus_luminosity")
    let s:luminosity = g:candyVirus_luminosity
else
    let s:luminosity = "black"
endif

"================================================
" Text Color:
"================================================

let color_name = "candyVirus"

if s:luminosity == "light"

    set background=light

    hi Normal       ctermfg=232     ctermbg=255
    hi Comment      ctermfg=101

    hi Constant     ctermfg=232                     cterm=italic
    hi Number       ctermfg=125                     cterm=italic
    hi Float        ctermfg=125                     cterm=italic
    hi Boolean      ctermfg=125                     cterm=italic
    hi Character    ctermfg=132                     cterm=italic
    hi String       ctermfg=132                     cterm=italic

    hi Identifier   ctermfg=64                      cterm=italic
    hi Function     ctermfg=64                      cterm=italic

    hi Statement    ctermfg=237                     cterm=bold
    hi Conditional  ctermfg=125                     cterm=bold
    hi Repeat       ctermfg=125                     cterm=bold
    hi Operator     ctermfg=237                     cterm=bold
    hi Label        ctermfg=237                     cterm=bold
    hi Keyword      ctermfg=124                     cterm=bold
"   hi Exception

    hi Preproc      ctermfg=237                     cterm=bold
"   hi Include
"   hi Define
"   hi Macro
"   hi PreCondit

    hi Type         ctermfg=67                      cterm=bold
"   hi StorageClass
"   hi Structure
"   hi Typedef

    hi Special      ctermfg=59                      cterm=bold
    hi NonText      ctermfg=59                      cterm=bold
"   hi SpecialChar
"   hi Tag
"   hi Delimiter
"   hi SpecialComment
"   hi Debug

"   hi Underlined

"   hi Ignore

else

    set background=dark

    hi Normal       ctermfg=251     ctermbg=232
    hi Comment      ctermfg=243

    hi Constant     ctermfg=231                     cterm=italic
    hi Number       ctermfg=214                     cterm=italic
    hi Float        ctermfg=214                     cterm=italic
    hi Boolean      ctermfg=214                     cterm=italic
    hi Character    ctermfg=111                     cterm=italic
    hi String       ctermfg=75                      cterm=italic

    hi Identifier   ctermfg=208                     cterm=italic
"   hi Function                                     cterm=italic

    hi Statement    ctermfg=231                     cterm=bold
    hi Conditional  ctermfg=106                     cterm=bold
    hi Repeat       ctermfg=106                     cterm=bold
    hi Operator     ctermfg=231                     cterm=bold
    hi Label        ctermfg=231                     cterm=bold
    hi Keyword      ctermfg=231                     cterm=bold
"   hi Exception
"
    hi Preproc      ctermfg=231                     cterm=bold
"   hi Include
"   hi Define
"   hi Macro
"   hi PreCondit

    hi Type         ctermfg=137                     cterm=bold
"   hi StorageClass
"   hi Structure
"   hi Typedef

    hi Special      ctermfg=231                     cterm=bold
    hi NonText      ctermfg=231                     cterm=bold
"   hi SpecialChar
"   hi Tag
"   hi Delimiter
"   hi SpecialComment
"   hi Debug

"   hi Underlined

"   hi Ignore

endif

"================================================
" Hilighting:
"================================================


hi Cursor           ctermfg=bg      ctermbg=fg
hi CursorColumn     ctermfg=NONE
hi CursorIM         ctermfg=bg      ctermbg=fg
hi CursorLine       ctermfg=NONE                    cterm=NONE
hi Visual           ctermfg=NONE
hi VisualNOS        ctermfg=fg      ctermbg=bg
hi MatchParen       ctermbg=NONE
hi Todo             ctermbg=NONE
hi Error            ctermbg=NONE

if s:luminosity == "light"

    hi CursorColumn                 ctermbg=253
    hi CursorLine                   ctermbg=253
    hi IncSearch    ctermfg=125     ctermbg=NONE    cterm=bold
    hi MatchParen   ctermfg=125     ctermbg=NONE    cterm=bold
    hi Search       ctermfg=125     ctermbg=NONE    cterm=bold
    hi Visual                       ctermbg=148
    hi Error        ctermfg=160     ctermbg=bg      cterm=bold,underline
    hi Todo         ctermfg=125                     cterm=underline
"   hi Cursor       ctermfg=232     ctermbg=231
"   hi CursorIM

else

    hi CursorColumn                 ctermbg=16
    hi CursorLine                   ctermbg=16
    hi IncSearch    ctermfg=202      ctermbg=NONE    cterm=bold,underline
    hi MatchParen   ctermfg=202      ctermbg=NONE    cterm=bold
    hi Search       ctermfg=202      ctermbg=NONE    cterm=bold,underline
    hi Visual                       ctermbg=59
    hi Error        ctermfg=160     ctermbg=bg      cterm=bold
    hi Todo         ctermfg=226                     cterm=underline
"   hi Cursor
"   hi CursorIM

endif

"================================================
" Message:
"================================================

hi ModeMsg          ctermfg=fg
hi Question         ctermfg=fg

if s:luminosity == "light"

    hi ErrorMsg     ctermfg=160   ctermbg=bg
    hi MoreMsg      ctermfg=24    ctermbg=bg
    hi WarningMsg   ctermfg=125   ctermbg=bg

else

    hi ErrorMsg     ctermfg=160   ctermbg=bg
    hi MoreMsg      ctermfg=75    ctermbg=bg
    hi WaringMsg    ctermfg=226   ctermbg=bg


endif

"================================================
" UI:
"================================================

hi ColorColumn      ctermfg=NONE
hi Pmenu            ctermfg=bg
hi PmenuSel         ctermfg=fg
hi PmenuThumb       ctermfg=fg
hi StatuLine        ctermfg=bg
hi TabLine          ctermfg=bg
hi TabLineSel       ctermfg=fg
hi WildMenu         ctermfg=fg

if s:luminosity == "light"

    hi ColorColumn                  ctermbg=253
    hi CursorLineNr ctermfg=24      ctermbg=253
    hi LineNr       ctermfg=101     ctermbg=253
    hi VertSplit    ctermfg=253     ctermbg=101
    hi Pmenu        ctermfg=232     ctermbg=253
    hi PmenuSel     ctermfg=67      ctermbg=253         cterm=bold
    hi PmenuSbar    ctermfg=232     ctermbg=253
    hi TabLine      ctermfg=232     ctermbg=255         cterm=bold
    hi TabLineSel   ctermfg=24      ctermbg=NONE
    hi TabLineFill  ctermfg=255
"   hi PmenuThumb
"   hi WildMenu
"   hi FoldColum
    hi Folded       ctermfg=161      ctermbg=bg
"   hi SignColumn

else

    hi ColorColumn                  ctermbg=16
    hi CursorLineNr ctermfg=172     ctermbg=16
    hi LineNr       ctermfg=241     ctermbg=bg
    hi VertSplit    ctermfg=16      ctermbg=251
    hi Pmenu        ctermfg=251     ctermbg=232
    hi PmenuSel     ctermfg=172     ctermbg=234         cterm=bold
    hi PmenuSbar    ctermfg=251     ctermbg=16
    hi PmenuThumb   ctermfg=251     ctermbg=234
    hi TabLineFill  ctermfg=234
    hi TabLine      ctermfg=246     ctermbg=234         cterm=bold
    hi TabLineSel   ctermfg=172
"   hi WildMenu
    hi SignColumn                   ctermbg=16
    hi Folded       ctermfg=214     ctermbg=bg
    hi FoldColumn                   ctermbg=16
endif

"================================================
" Spell:
"================================================

if s:luminosity == "light"
    hi SpellBad     ctermfg=124     ctermbg=bg          cterm=underline
    hi SpellCap     ctermfg=126     ctermbg=bg          cterm=underline
else
    hi SpellBad     ctermfg=160     ctermbg=bg          cterm=underline
    hi SpellCap     ctermfg=205     ctermbg=bg          cterm=underline
endif

"================================================
" Diff:
"================================================

"hi DiffAdd    ctermfg=fg
"hi DiffChange ctermfg=fg
"hi DiffDelete ctermfg=fg

"if s:luminosity == "light"

"    hi DiffAdd                ctermbg=151
"    hi DiffChange             ctermbg=187
"    hi DiffDelete             ctermbg=181
"    hi DiffText   ctermfg=166 ctermbg=187

"else

"    hi DiffAdd                ctermbg=65
"    hi DiffChange             ctermbg=101
"    hi DiffDelete             ctermbg=95
"    hi DiffText   ctermfg=185 ctermbg=101

"endif

"================================================
" Preset Commands:
"================================================

function! SwitchCandyVirus()
    if s:luminosity == "black"
        let g:candyVirus_luminosity = "light"
    else
        let g:candyVirus_luminosity = "black"
    endif
endfunction

function! SetCandyVirus(luminosity)
    let g:candyVirus_luminosity = a:luminosity
endfunction

command! CandySwitch call SwitchCandyVirus()
            \ | colorscheme candyVirus

command! CandyLight call SetCandyVirus("light")
            \ | colorscheme candyVirus

command! CandyDark call SetCandyVirus("black")
            \ | colorscheme candyVirus
