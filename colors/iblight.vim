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
let s:white            = { "gui": "#FFFFFF", "cterm": "231" }
let s:almostWhite      = { "gui": "#EEEEEE", "cterm": "255" }
let s:lighterGrey      = { "gui": "#DDDDDD", "cterm": "253" }
let s:lightGrey        = { "gui": "#BBBBBB", "cterm": "249" }
let s:middleLightGrey  = { "gui": "#999999", "cterm": "246" }
let s:middleDarkGrey   = { "gui": "#777777", "cterm": "243" }
let s:darkGrey         = { "gui": "#444444", "cterm": "238" }
let s:darkerGrey       = { "gui": "#282828", "cterm": "235" }
let s:middleDarkerGrey = { "gui": "#1F1F1F", "cterm": "234" }
let s:almostBlack      = { "gui": "#111111", "cterm": "233" }
let s:black            = { "gui": "#000000", "cterm": "16"  }

let s:lightPink        = { "gui": "#FFAFAF", "cterm": "217" }
let s:middleDarkPink   = { "gui": "#FF0055", "cterm": "160" }
let s:middleLightPink  = { "gui": "#AF0000", "cterm": "124" }
let s:darkPink         = { "gui": "#63001C", "cterm": "52"  }

let s:lighterBlue      = { "gui": "#FCFEFF", "cterm": "195" }
let s:lightBlue        = { "gui": "#E1F0F9", "cterm": "195" }
let s:middleLightBlue  = { "gui": "#9FD3E6", "cterm": "116" }
let s:darkBlue         = { "gui": "#005F87", "cterm": "24"  }

let s:lightGreen       = { "gui": "#BBFFAA", "cterm": "157" }
let s:middleLightGreen = { "gui": "#B1D631", "cterm": "148" }
let s:middleDarkGreen  = { "gui": "#739200", "cterm": "64"  }
let s:darkGreen        = { "gui": "#5F5F00", "cterm": "58"  }

let s:lightTan         = { "gui": "#ECE1C8", "cterm": "230" }
let s:darkTan          = { "gui": "#503D15", "cterm": "52"  }

" Semantics --------------------------------------------{{{3
let s:bg         = s:white
let s:norm       = s:almostBlack
let s:comment    = s:middleLightGrey
let s:dimmed     = s:darkGrey
let s:subtle     = s:lightGrey
let s:subtler    = s:lighterGrey
let s:faint      = s:almostWhite
let s:fainter    = s:lighterGrey
let s:accent1    = s:darkBlue
let s:accent2    = s:middleDarkGreen
let s:accent3    = s:middleDarkPink
let s:accent4    = s:darkTan
let s:accent5    = s:darkBlue
let s:normRed    = s:darkPink
let s:normGreen  = s:middleDarkGreen
let s:normBlue   = s:darkBlue
let s:faintRed   = s:lightPink
let s:faintGreen = s:lightGreen
let s:faintBlue  = s:lightBlue

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
  call s:h("CursorLine",       { "bg": s:almostWhite })
  call s:h("MatchParen",       { "fg": s:middleDarkGreen, "bg": s:lightGrey, "gui": "bold" })
  call s:h("Pmenu",            { "bg": s:almostWhite })
  call s:h("PmenuThumb",       { "bg": s:almostBlack })
  call s:h("PmenuSBar",        { "bg": s:lightGrey })
  call s:h("PmenuSel",         { "bg": s:lightBlue })
  call s:h("ColorColumn",      { "bg": s:lighterBlue })
  call s:h("SpellBad",         { "sp": s:lightPink, "gui": "undercurl" })
  call s:h("SpellCap",         { "sp": s:darkBlue, "gui": "undercurl" })
  call s:h("SpellRare",        { "sp": s:middleDarkGreen, "gui": "undercurl" })
  call s:h("SpellLocal",       { "sp": s:darkTan, "gui": "undercurl" })
  hi! link CursorColumn	CursorLine

  " Use background for cterm Spell*, which does not support undercurl
  execute "hi! SpellBad   ctermbg=" s:darkPink.cterm
  execute "hi! SpellCap   ctermbg=" s:lightBlue.cterm
  execute "hi! SpellRare  ctermbg=" s:lightGreen.cterm
  execute "hi! SpellLocal ctermbg=" s:almostWhite.cterm
endif

" Highlights - UI ------------------------------------------{{{2
call s:h("Normal",       { "fg": s:almostBlack, "bg": s:white })
call s:h("NonText",      { "fg": s:lightGrey })
call s:h("Cursor",       { "fg": s:white, "bg": s:darkBlue })
call s:h("Visual",       { "bg": s:lightBlue })
call s:h("IncSearch",    { "bg": s:lightBlue, "gui": "bold", "cterm": "bold" })
call s:h("Search",       { "bg": s:lightBlue, "gui": "bold", "cterm": "bold" })
call s:h("StatusLine",   { "fg": s:almostBlack, "bg": s:almostWhite, "gui": "bold", "cterm": "bold" })
call s:h("StatusLineNC", { "bg": s:lighterGrey })
call s:h("SignColumn",   { "fg": s:middleLightGrey, "bg": s:almostWhite })
call s:h("VertSplit",    { "fg": s:lighterGrey, "bg": s:lighterGrey })
call s:h("TabLine",      { "fg": s:lightGrey, "bg": s:almostWhite })
call s:h("TabLineSel",   { "fg": s:almostBlack, "bg": s:white })
call s:h("TabLineFill",  { "bg": s:lighterGrey })
call s:h("Folded",       { "fg": s:darkGrey, "bg": s:white })
call s:h("Directory",    { "fg": s:darkBlue })
call s:h("Title",        { "fg": s:darkBlue, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:lightPink })
call s:h("DiffAdd",      { "bg": s:lightGreen })
call s:h("DiffChange",   { "bg": s:darkPink })
call s:h("DiffDelete",   { "fg": s:lightPink, "bg": s:darkPink })
call s:h("DiffText",     { "bg": s:darkPink, "gui": "bold", "cterm": "bold" })
call s:h("User1",        { "fg": s:white, "bg": s:middleDarkGreen })
call s:h("User2",        { "fg": s:white, "bg": s:lightPink })
call s:h("User3",        { "fg": s:white, "bg": s:darkBlue })
call s:h("FoldColumn",   { "fg": s:darkBlue, "bg": s:almostWhite })
hi! link WildMenu     IncSearch
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link LineNr       NonText
hi! link SpecialKey   NonText

" Highlights - Generic Syntax ------------------------------{{{2
call s:h("Delimiter",  { "fg": s:darkGrey })
call s:h("Comment",    { "fg": s:middleLightGrey, "gui": "italic" })
call s:h("Underlined", { "fg": s:darkBlue, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:middleDarkPink })
call s:h("String",     { "fg": s:middleDarkGreen })
call s:h("Keyword",    { "fg": s:middleDarkGreen, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:lightPink, "gui": "bold", "cterm": "bold" })
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
