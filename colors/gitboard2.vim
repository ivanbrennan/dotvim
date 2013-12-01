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
let g:colors_name="gitboard"

hi Normal          guifg=#FFFFFF guibg=#0B1022 guisp=#0B1022 gui=NONE   ctermfg=15   ctermbg=234  cterm=NONE

" {{{ Cursor
hi Cursor          guifg=NONE    guibg=#606060 guisp=#606060 gui=NONE
" }}}

" {{{ Diff
hi DiffAdd         guifg=#003300 guibg=#DDFFDD               gui=NONE
hi DiffChange                    guibg=#ECECEC               gui=NONE
hi DiffText        guifg=#000033 guibg=#DDDDFF               gui=NONE
hi DiffDelete      guifg=#DDCCCC guibg=#FFDDDD               gui=NONE
" }}}

" {{{ Folding / Line Numbering / Status Lines
hi Folded          guifg=#888888 guibg=#171A22 guisp=#171A22 gui=BOLD   ctermfg=102 ctermbg=235   cterm=BOLD
hi vimFold         guifg=#888888 guibg=#171A22 guisp=#171A22 gui=BOLD   ctermfg=102 ctermbg=235   cterm=BOLD
hi FoldColumn      guifg=#888888 guibg=#171A22 guisp=#171A22 gui=BOLD   ctermfg=102 ctermbg=235   cterm=BOLD

hi LineNr          guifg=#888888 guibg=#242424 guisp=#242424 gui=NONE   ctermfg=102 ctermbg=235   cterm=NONE
hi CursorLineNr    guifg=#FFFFFF guibg=#0B1022 guisp=#0B1022 gui=NONE   ctermfg=15  ctermbg=234   cterm=NONE
hi NonText         guifg=#BCC6EB guibg=NONE    guisp=NONE    gui=BOLD   ctermfg=66  ctermbg=NONE  cterm=BOLD

hi VertSplit       guifg=#242424 guibg=#7E7E7E guisp=#7E7E7E gui=NONE   ctermfg=235 ctermbg=246   cterm=NONE
hi StatusLine      guifg=#242424 guibg=#FAFAFA guisp=#FAFAFA gui=BOLD   ctermfg=235 ctermbg=15    cterm=BOLD
hi StatusLineNC    guifg=#242424 guibg=#7E7E7E guisp=#7E7E7E gui=NONE   ctermfg=235 ctermbg=246   cterm=NONE
" }}}

" {{{ Misc
hi ModeMsg         guifg=#990000
hi MoreMsg         guifg=#990000

hi Title           guifg=#EF5939
hi WarningMsg      guifg=#EF5939
hi SpecialKey      guifg=#177F80                             gui=ITALIC

hi MatchParen      guifg=#000000 guibg=#CDCDFD
hi Underlined      guifg=#000000                             gui=UNDERLINE
hi Directory       guifg=#990000
" }}}

" {{{ Search, Visual, etc
hi Visual          guifg=#FFFFFF guibg=#3465A4               gui=NONE
hi VisualNOS       guifg=#FFFFFF guibg=#204A87               gui=NONE
hi IncSearch       guifg=#FFFF00 guibg=NONE    guisp=NONE    gui=BOLD   ctermfg=11   ctermbg=NONE cterm=BOLD
hi Search          guifg=WHITE   guibg=#1C3B79 guisp=#1C3B79 gui=NONE   ctermfg=NONE ctermbg=6    cterm=NONE
" }}}

" {{{ Syntax groups
hi Ignore          guifg=#808080
hi Identifier      guifg=#BCC6EB guibg=NONE    guisp=NONE    gui=BOLD   ctermfg=146  ctermbg=NONE cterm=BOLD
hi PreProc         guifg=#BEBEBE guibg=NONE    guisp=NONE    gui=NONE   ctermfg=7    ctermbg=NONE cterm=NONE
hi Comment         guifg=#AEAEAE guibg=NONE    guisp=NONE    gui=ITALIC ctermfg=145  ctermbg=NONE cterm=NONE
hi Constant        guifg=#BCC6EB guibg=NONE    guisp=NONE    gui=NONE   ctermfg=146  ctermbg=NONE cterm=NONE
hi String          guifg=#AABCC2 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=152  ctermbg=NONE cterm=NONE
hi Function        guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
hi Statement       guifg=#BD9800 guibg=NONE    guisp=NONE    gui=BOLD   ctermfg=1    ctermbg=NONE cterm=BOLD
hi Type            guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
hi Number          guifg=#BCC6EB guibg=NONE    guisp=NONE    gui=NONE   ctermfg=146  ctermbg=NONE cterm=NONE
hi Special         guifg=#159828 gui=BOLD
hi rubySymbol      guifg=#960B73
hi Error           guifg=#FF1100 guibg=#F8F8FF               gui=UNDERCURL
hi Todo            guifg=#FF1100 guibg=#F8F8FF               gui=UNDERLINE
hi Label           guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
hi StorageClass    guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
hi Structure       guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
hi Typedef         guifg=#8F9AE3 guibg=NONE    guisp=NONE    gui=NONE   ctermfg=110  ctermbg=NONE cterm=NONE
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
hi TabLine         guifg=#404040 guibg=#DDDDDD               gui=NONE
hi TabLineFill     guifg=#404040 guibg=#DDDDDD               gui=NONE
hi TabLineSel      guifg=#404040                             gui=BOLD
" }}}
"
" vim: sw=4 ts=4 foldmethod=marker
