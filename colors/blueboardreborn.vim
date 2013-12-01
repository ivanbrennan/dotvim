" Vim color file
"
" Author: Anthony Carapetis <anthony.carapetis@gmail.com>
"
" Note: Based on github's syntax highlighting theme
"       Used Brian Mock's darkspectrum as a starting point/template
"       Thanks to Ryan Heath for an easy list of some of the colours:
"       http://rpheath.com/posts/356-github-theme-for-syntax-gem

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
    syntax reset
    endif
endif
let g:colors_name="blueboardreborn"

" {{{ General
hi Cursor          guifg=NONE    guibg=#606060 guisp=#606060 gui=NONE
hi Normal          guifg=#BEBBE8 guibg=#1C1C1C guisp=#1C1C1C gui=NONE   ctermfg=146  ctermbg=234  cterm=NONE

hi Ignore          guifg=#808080

hi Type            guifg=#BCC6EB guibg=NONE    guisp=NONE    gui=NONE   ctermfg=146  ctermbg=NONE cterm=NONE
hi Constant        guifg=#BCC6EB guibg=NONE    guisp=NONE    gui=NONE   ctermfg=146  ctermbg=NONE cterm=NONE
hi Number          guifg=#BCC6EB guibg=NONE    guisp=NONE    gui=NONE   ctermfg=146  ctermbg=NONE cterm=NONE

hi PreProc         guifg=#4E6FCC guibg=NONE    guisp=NONE    gui=NONE   ctermfg=25   ctermbg=NONE cterm=NONE
hi Comment         guifg=#AEAEAE guibg=NONE    guisp=NONE    gui=ITALIC ctermfg=102  ctermbg=NONE cterm=NONE
hi String          guifg=#AABCC2 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=152  ctermbg=NONE cterm=NONE

hi Statement       guifg=#BD9800 guibg=NONE    guisp=NONE    gui=BOLD   ctermfg=178  ctermbg=NONE cterm=BOLD
hi Delimiter       guifg=#BD9800 guibg=NONE    guisp=NONE    gui=BOLD   ctermfg=178  ctermbg=NONE cterm=BOLD

"hi Function        guifg=#9CB1FF guibg=NONE    guisp=NONE    gui=NONE   ctermfg=153  ctermbg=NONE cterm=NONE
hi Function        guifg=#2E76D4 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=153  ctermbg=NONE cterm=NONE
hi Identifier      guifg=#177F80 guibg=NONE    guisp=NONE    gui=BOLD   ctermfg=110  ctermbg=NONE cterm=BOLD
hi Label           guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
hi StorageClass    guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
hi Structure       guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
hi Typedef         guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE

hi Special         guifg=#159828                             gui=BOLD
hi rubySymbol      guifg=#DDFFDD
hi rubyAttribute   guifg=#6E93FA guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
"hi rubyBlockParameter guifg=#DDFFDD guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
hi Error           guifg=#FF1100 guibg=#F8F8FF               gui=UNDERCURL
hi Todo            guifg=#FF1100 guibg=#F8F8FF               gui=UNDERLINE
" }}}

" {{{ Diff
hi DiffAdd         guifg=#003300 guibg=#DDFFDD               gui=NONE
hi DiffChange                    guibg=#ECECEC               gui=NONE
hi DiffText        guifg=#000033 guibg=#DDDDFF               gui=NONE
hi DiffDelete      guifg=#DDCCCC guibg=#FFDDDD               gui=NONE
" }}}

" {{{ Line Numbering / Status Lines / Folding
hi CursorLineNr    guifg=#FFFFFF guibg=#1C1C1C guisp=#1C1C1C gui=NONE   ctermfg=15  ctermbg=234   cterm=NONE
hi LineNr          guifg=#888888 guibg=#242424 guisp=#242424 gui=NONE   ctermfg=102 ctermbg=235   cterm=NONE
hi NonText         guifg=#BCC6EB guibg=NONE    guisp=NONE    gui=BOLD   ctermfg=66  ctermbg=NONE  cterm=BOLD

hi StatusLine      guifg=#242424 guibg=#FAFAFA guisp=#FAFAFA gui=BOLD   ctermfg=235 ctermbg=15    cterm=BOLD
hi StatusLineNC    guifg=#242424 guibg=#7E7E7E guisp=#7E7E7E gui=NONE   ctermfg=235 ctermbg=246   cterm=NONE
hi VertSplit       guifg=#242424 guibg=#7E7E7E guisp=#7E7E7E gui=NONE   ctermfg=235 ctermbg=246   cterm=NONE

hi Folded          guifg=#888888 guibg=#171A22 guisp=#171A22 gui=BOLD   ctermfg=102 ctermbg=235   cterm=BOLD
hi vimFold         guifg=#888888 guibg=#171A22 guisp=#171A22 gui=BOLD   ctermfg=102 ctermbg=235   cterm=BOLD
hi FoldColumn      guifg=#888888 guibg=#171A22 guisp=#171A22 gui=BOLD   ctermfg=102 ctermbg=235   cterm=BOLD
" }}}

" {{{ Misc
hi ModeMsg         guifg=#FFFFFF
hi MoreMsg         guifg=#88DD88

hi Title           guifg=#EF5939
hi WarningMsg      guifg=#EF5939
hi SpecialKey      guifg=#177F80                             gui=ITALIC

hi MatchParen      guifg=#000000 guibg=#CDCDFD
hi Underlined      guifg=#000000                             gui=UNDERLINE
hi Directory       guifg=#990000
" }}}

" {{{ Visual, Search, etc
hi Visual          guifg=#FFFFFF guibg=#3465A4               gui=NONE
hi VisualNOS       guifg=#FFFFFF guibg=#204A87               gui=NONE
hi Search          guifg=#FFFFFF guibg=#1C3B79 guisp=#1C3B79 gui=NONE   ctermfg=NONE ctermbg=6    cterm=NONE
hi IncSearch       guifg=#FFFF00 guibg=NONE    guisp=NONE    gui=BOLD   ctermfg=11   ctermbg=NONE cterm=BOLD
" }}}

" {{{ Completion menus
hi WildMenu        guifg=#EEE8D5 guibg=#242424 guisp=#242424 gui=NONE   ctermfg=230  ctermbg=235  cterm=NONE

hi PMenu           guifg=#DDDDDD guibg=#545658 guisp=#545658 gui=NONE   ctermfg=253  ctermbg=240  cterm=NONE
hi PMenuSel        guifg=#88DD88 guibg=#949698 guisp=#949698 gui=NONE   ctermfg=114  ctermbg=246  cterm=NONE
hi PMenuSbar       guifg=NONE    guibg=#323232 guisp=#323232 gui=NONE   ctermfg=NONE ctermbg=236  cterm=NONE
hi PMenuThumb      guifg=NONE    guibg=#888888 guisp=#888888 gui=NONE   ctermfg=NONE ctermbg=102  cterm=NONE
" }}}

" {{{ Spelling
hi spellBad                                    guisp=#FCAF3E
hi spellCap                                    guisp=#73D216
hi spellRare                                   guisp=#FCAF3E
hi spellLocal                                  guisp=#729FCF
" }}}

" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character       Number
hi link htmlTag         htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink        Underlined
hi link pythonFunction  Identifier
hi link Question        Type
hi link CursorIM        Cursor
hi link VisualNOS       Visual
hi link xmlTag          Identifier
hi link xmlTagName      Identifier
hi link shDeref         Identifier
hi link shVariable      Function
hi link rubySharpBang   Special
hi link perlSharpBang   Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant
" }}}

" {{{ Tabs (non-gui0
hi TabLine         guifg=#888888 guibg=#242424 guisp=#242424 gui=NONE   ctermfg=102  ctermbg=236  cterm=NONE
hi TabLineFill     guifg=NONE    guibg=#000000 guisp=#000000 gui=NONE   ctermfg=NONE ctermbg=0    cterm=NONE
hi TabLineSel      guifg=#FAFAFA guibg=#0B1022               gui=BOLD   ctermfg=253  ctermbg=234  cterm=BOLD
" }}}
"
" vim: sw=4 ts=4 foldmethod=marker
