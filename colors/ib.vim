" ib.vim - Vim color scheme
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
let g:colors_name = "ib"

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
if s:background == "dark"
  " Dark theme
  let s:bg         = s:almostBlack
  let s:norm       = s:almostWhite
  let s:comment    = s:middleDarkGrey
  let s:dimmed     = s:middleLightGrey
  let s:subtle     = s:darkGrey
  let s:faint      = s:middleDarkerGrey
  let s:fainter    = s:darkerGrey
  let s:subtler    = s:black
  let s:accent1    = s:lighterBlue
  let s:accent2    = s:middleLightGreen
  let s:accent3    = s:lightGreen
  let s:accent4    = s:lightTan
  let s:accent5    = s:lightBlue
  let s:normRed    = s:darkPink
  let s:normGreen  = s:middleLightGreen
  let s:normBlue   = s:middleLightBlue
  let s:faintRed   = s:middleLightPink
  let s:faintGreen = s:darkGreen
  let s:faintBlue  = s:darkBlue
else
  " Light theme
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
endif

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
  call s:h("CursorLine",       { "bg": s:faint })
  call s:h("MatchParen",       { "fg": s:normGreen, "bg": s:subtle, "gui": "bold" })
  call s:h("Pmenu",            { "bg": s:faint })
  call s:h("PmenuThumb",       { "bg": s:norm })
  call s:h("PmenuSBar",        { "bg": s:subtle })
  call s:h("PmenuSel",         { "bg": s:faintBlue })
  call s:h("ColorColumn",      { "bg": s:lighterBlue })
  call s:h("SpellBad",         { "sp": s:faintRed, "gui": "undercurl" })
  call s:h("SpellCap",         { "sp": s:accent1, "gui": "undercurl" })
  call s:h("SpellRare",        { "sp": s:normGreen, "gui": "undercurl" })
  call s:h("SpellLocal",       { "sp": s:accent4, "gui": "undercurl" })
  hi! link CursorColumn	CursorLine

  " Use background for cterm Spell*, which does not support undercurl
  execute "hi! SpellBad   ctermbg=" s:normRed.cterm
  execute "hi! SpellCap   ctermbg=" s:faintBlue.cterm
  execute "hi! SpellRare  ctermbg=" s:faintGreen.cterm
  execute "hi! SpellLocal ctermbg=" s:faint.cterm
endif

" Highlights - UI ------------------------------------------{{{2
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("NonText",      { "fg": s:subtle })
call s:h("Cursor",       { "fg": s:bg, "bg": s:accent5 })
call s:h("Visual",       { "bg": s:faintBlue })
call s:h("IncSearch",    { "bg": s:faintBlue, "gui": "bold", "cterm": "bold" })
call s:h("Search",       { "bg": s:faintBlue, "gui": "bold", "cterm": "bold" })
call s:h("StatusLine",   { "fg": s:norm, "bg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("StatusLineNC", { "bg": s:fainter })
call s:h("SignColumn",   { "fg": s:comment, "bg": s:faint })
call s:h("VertSplit",    { "fg": s:fainter, "bg": s:fainter })
call s:h("TabLine",      { "fg": s:subtle, "bg": s:faint })
call s:h("TabLineSel",   { "fg": s:norm, "bg": s:bg })
call s:h("TabLineFill",  { "bg": s:fainter })
call s:h("Folded",       { "fg": s:dimmed, "bg": s:bg })
call s:h("Directory",    { "fg": s:accent1 })
call s:h("Title",        { "fg": s:normBlue, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:faintRed })
call s:h("DiffAdd",      { "bg": s:faintGreen })
call s:h("DiffChange",   { "bg": s:normRed })
call s:h("DiffDelete",   { "fg": s:faintRed, "bg": s:normRed })
call s:h("DiffText",     { "bg": s:normRed, "gui": "bold", "cterm": "bold" })
call s:h("User1",        { "fg": s:bg, "bg": s:normGreen })
call s:h("User2",        { "fg": s:bg, "bg": s:faintRed })
call s:h("User3",        { "fg": s:bg, "bg": s:normBlue })
call s:h("FoldColumn",   { "fg": s:normBlue, "bg": s:faint })
hi! link WildMenu     IncSearch
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link LineNr       NonText
hi! link SpecialKey   NonText

" Highlights - Generic Syntax ------------------------------{{{2
call s:h("Delimiter",  { "fg": s:dimmed })
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent1, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent2 })
call s:h("Keyword",    { "fg": s:accent2, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:faintRed, "gui": "bold", "cterm": "bold" })
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
