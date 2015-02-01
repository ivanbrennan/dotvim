" iblight.vim - Vim color scheme
" ----------------------------------------------------------
" Author:   Ivan Brennan (ivan.brennan@gmail.com)
" Version:  0.1
" ----------------------------------------------------------

" Setup ----------------------------------------------------{{{1
" Initialization ---------------------------------------{{{2
hi clear
if exists("syntax_on")
  syntax reset
endif

let s:cached_background = &background
let g:colors_name = "iblight"

" Palette ----------------------------------------------{{{2
" Colors -----------------------------------------------{{{3
let s:white_2          = { "gui": "#FFFFFF", "cterm": "231" }
let s:white_1          = { "gui": "#EEEEEE", "cterm": "255" }
let s:white_0          = { "gui": "#DDDDDD", "cterm": "253" }
let s:grey_4           = { "gui": "#BBBBBB", "cterm": "249" }
let s:grey_3           = { "gui": "#999999", "cterm": "246" }
let s:grey_2           = { "gui": "#777777", "cterm": "243" }
let s:grey_1           = { "gui": "#444444", "cterm": "238" }
let s:grey_0           = { "gui": "#2e2d2a", "cterm": "235" }
let s:black_2          = { "gui": "#1F1F1F", "cterm": "234" }
let s:black_1          = { "gui": "#111111", "cterm": "233" }
let s:black_0          = { "gui": "#000000", "cterm": "16"  }

let s:red_3            = { "gui": "#FFAFAF", "cterm": "217" }
let s:red_2            = { "gui": "#FF0055", "cterm": "160" }
let s:red_1            = { "gui": "#AF0000", "cterm": "124" }
let s:red_0            = { "gui": "#63001C", "cterm": "52"  }

let s:blue_3           = { "gui": "#FCFEFF", "cterm": "195" }
let s:blue_2           = { "gui": "#E1F0F9", "cterm": "195" }
let s:blue_1           = { "gui": "#9FD3E6", "cterm": "116" }
let s:blue_0           = { "gui": "#005F87", "cterm": "24"  }

let s:green_3          = { "gui": "#BBFFAA", "cterm": "157" }
let s:green_2          = { "gui": "#B1D631", "cterm": "148" }
let s:green_1          = { "gui": "#739200", "cterm": "64"  }
let s:green_0          = { "gui": "#5F5F00", "cterm": "58"  }

let s:tan              = { "gui": "#ECE1C8", "cterm": "230" }
let s:brown            = { "gui": "#503D15", "cterm": "52"  }

" Semantics --------------------------------------------{{{3
let s:bg         = s:white_2
let s:norm       = s:black_1
let s:comment    = s:grey_3
let s:dimmed     = s:grey_1
let s:subtle     = s:grey_4
let s:subtler    = s:white_0
let s:faint      = s:white_1
let s:fainter    = s:white_0
let s:accent1    = s:blue_0
let s:accent2    = s:green_1
let s:accent3    = s:red_2
let s:accent4    = s:brown
let s:accent5    = s:blue_0
let s:normRed    = s:red_0
let s:normGreen  = s:green_1
let s:normBlue   = s:blue_0
let s:faintRed   = s:red_3
let s:faintGreen = s:green_3
let s:faintBlue  = s:blue_2

" Utility Function -----------------------------------------{{{2
function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" Highlights -----------------------------------------------{{{1
" Highlights - Vim >= 7 ------------------------------------{{{2
if version >= 700
  call s:h("CursorLine",       { "bg": s:white_1 })
  call s:h("MatchParen",       { "fg": s:green_1, "bg": s:grey_4, "gui": "bold" })
  call s:h("Pmenu",            { "bg": s:white_1 })
  call s:h("PmenuThumb",       { "bg": s:black_1 })
  call s:h("PmenuSBar",        { "bg": s:grey_4 })
  call s:h("PmenuSel",         { "bg": s:blue_2 })
  call s:h("ColorColumn",      { "bg": s:blue_3 })
  call s:h("SpellBad",         { "sp": s:red_3, "gui": "undercurl" })
  call s:h("SpellCap",         { "sp": s:blue_0, "gui": "undercurl" })
  call s:h("SpellRare",        { "sp": s:green_1, "gui": "undercurl" })
  call s:h("SpellLocal",       { "sp": s:brown, "gui": "undercurl" })
  hi! link CursorColumn	CursorLine

  " Use background for cterm Spell*, which does not support undercurl
  execute "hi! SpellBad   ctermbg=" s:red_0.cterm
  execute "hi! SpellCap   ctermbg=" s:blue_2.cterm
  execute "hi! SpellRare  ctermbg=" s:green_3.cterm
  execute "hi! SpellLocal ctermbg=" s:white_1.cterm
endif

" Highlights - UI ------------------------------------------{{{2
call s:h("Normal",       { "fg": s:black_1, "bg": s:white_2 })
call s:h("NonText",      { "fg": s:grey_4 })
call s:h("Cursor",       { "fg": s:white_2, "bg": s:blue_0 })
call s:h("Visual",       { "bg": s:blue_2 })
call s:h("IncSearch",    { "bg": s:blue_2, "gui": "bold", "cterm": "bold" })
call s:h("Search",       { "bg": s:blue_2, "gui": "bold", "cterm": "bold" })
call s:h("StatusLine",   { "fg": s:black_1, "bg": s:grey_0, "gui": "bold", "cterm": "bold" })
call s:h("StatusLineNC", { "bg": s:grey_0 })
call s:h("SignColumn",   { "fg": s:grey_3, "bg": s:white_1 })
call s:h("VertSplit",    { "fg": s:grey_0, "bg": s:grey_0 })
call s:h("TabLine",      { "fg": s:grey_4, "bg": s:white_1 })
call s:h("TabLineSel",   { "fg": s:black_1, "bg": s:white_2 })
call s:h("TabLineFill",  { "bg": s:white_0 })
call s:h("Folded",       { "fg": s:grey_1, "bg": s:white_2 })
call s:h("Directory",    { "fg": s:blue_0 })
call s:h("Title",        { "fg": s:blue_0, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:red_3 })
call s:h("DiffAdd",      { "bg": s:green_3 })
call s:h("DiffChange",   { "bg": s:red_0 })
call s:h("DiffDelete",   { "fg": s:red_3, "bg": s:red_0 })
call s:h("DiffText",     { "bg": s:red_0, "gui": "bold", "cterm": "bold" })
call s:h("User1",        { "fg": s:white_2, "bg": s:green_1 })
call s:h("User2",        { "fg": s:white_2, "bg": s:red_3 })
call s:h("User3",        { "fg": s:white_2, "bg": s:blue_0 })
call s:h("FoldColumn",   { "fg": s:blue_0, "bg": s:white_1 })
hi! link WildMenu     IncSearch
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link LineNr       NonText
hi! link SpecialKey   NonText

" Highlights - Generic Syntax ------------------------------{{{2
call s:h("Delimiter",  { "fg": s:grey_1 })
call s:h("Comment",    { "fg": s:grey_3, "gui": "italic" })
call s:h("Underlined", { "fg": s:blue_0, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:red_2 })
call s:h("String",     { "fg": s:green_1 })
call s:h("Keyword",    { "fg": s:green_1, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:red_3, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "gui": "bold", "cterm": "bold" })
hi! link Identifier  Function
hi! link Statement   Type
hi! link Constant    Directory
hi! link Number      Constant
hi! link Special     Constant
hi! link PreProc     Constant
hi! link Error       ErrorMsg

" Highlights - HTML ----------------------------------------{{{2
hi! link htmlLink    Underlined
hi! link htmlTag     Type
hi! link htmlEndTag  htmlTag

" Highlights - CSS -----------------------------------------{{{2
hi! link cssBraces      Delimiter
hi! link cssSelectorOp  cssBraces
hi! link cssClassName   Normal

" Highlights - Markdown ------------------------------------{{{2
hi! link mkdListItem  mkdDelimiter

" Highlights - Shell ---------------------------------------{{{2
hi! link shOperator  Delimiter
hi! link shCaseBar   Delimiter

" Highlights - JavaScript ----------------------------------{{{2
hi! link javaScriptValue   Constant
hi! link javaScriptNull    Constant
hi! link javaScriptBraces  Normal

" Highlights - Help ----------------------------------------{{{2
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined

" Cleanup --------------------------------------------------{{{1
execute "set background=" . s:cached_background

" vim: fdm=marker:sw=2:sts=2:et
