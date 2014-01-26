" eivel.vim - Vim color scheme
" ----------------------------------------------------------
" Author:   Ivan Brennan (ivan.brennan@gmail.com)
" Version:  0.1
" ----------------------------------------------------------

" Setup ----------------------------------------------------{{{
" Reset syntax highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

" Declare theme name
let g:colors_name = "eivel"

"}}}
" The Colors -----------------------------------------------{{{
" Define reusable colors for Dark
let s:d_black            = { "gui": "#000000", "cterm": "16"  }
let s:d_white            = { "gui": "#FFFFFF", "cterm": "231" }
let s:d_almostWhite      = { "gui": "#EEEEEE", "cterm": "255" }
let s:d_almostBlack      = { "gui": "#111111", "cterm": "233" }
let s:d_middleDarkerGrey = { "gui": "#232629", "cterm": "234" }
let s:d_middleDarkGrey   = { "gui": "#5F5F5F", "cterm": "240" }
let s:d_middleLightGrey  = { "gui": "#8F969E", "cterm": "245" }
let s:d_lightGrey        = { "gui": "#BBBBBB", "cterm": "249" }
let s:d_lighterGrey      = { "gui": "#D1D1D1", "cterm": "253" }
let s:d_darkGrey         = { "gui": "#444444", "cterm": "238" }
let s:d_darkerGrey       = { "gui": "#282C2E", "cterm": "235" }
let s:d_darkestGrey      = { "gui": "#1F2124", "cterm": "235" }

let s:d_darkPink         = { "gui": "#63001C", "cterm": "52"  }
let s:d_middleDarkPink   = { "gui": "#C50000", "cterm": "124" }
let s:d_middleLightPink  = { "gui": "#D65E76", "cterm": "167" }
let s:d_lightPink        = { "gui": "#FFAFAF", "cterm": "217" }

let s:d_darkerBlue       = { "gui": "#388BF6", "cterm": "19"  }
let s:d_darkBlue         = { "gui": "#005F87", "cterm": "24"  }
let s:d_middleDarkBlue   = { "gui": "#538192", "cterm": "31"  }
let s:d_middleLightBlue  = { "gui": "#9FD3E6", "cterm": "116" }
let s:d_lightBlue        = { "gui": "#DAF0FC", "cterm": "195" }

let s:d_darkGreen        = { "gui": "#5F5F00", "cterm": "58"  }
let s:d_middleDarkGreen  = { "gui": "#739200", "cterm": "64"  }
let s:d_middleLightGreen = { "gui": "#B8D977", "cterm": "148" }
let s:d_lightGreen       = { "gui": "#BBFFAA", "cterm": "157" }

let s:d_darkTan          = { "gui": "#503D15", "cterm": "52"  }
let s:d_lightTan         = { "gui": "#FDFEFA", "cterm": "231" }

" Define reusable colors for Light
let s:l_black            = { "gui": "#000000", "cterm": "16"  }
let s:l_white            = { "gui": "#FFFFFF", "cterm": "231" }
let s:l_almostWhite      = { "gui": "#EEEEEE", "cterm": "255" }
let s:l_almostBlack      = { "gui": "#111111", "cterm": "233" }
let s:l_middleDarkerGrey = { "gui": "#282A2B", "cterm": "234" }
let s:l_middleDarkGrey   = { "gui": "#5F5F5F", "cterm": "240" }
let s:l_middleLightGrey  = { "gui": "#8F969E", "cterm": "245" }
let s:l_lightGrey        = { "gui": "#BBBBBB", "cterm": "249" }
let s:l_lighterGrey      = { "gui": "#D1D1D1", "cterm": "253" }
let s:l_darkGrey         = { "gui": "#444444", "cterm": "238" }
let s:l_darkerGrey       = { "gui": "#282C2E", "cterm": "235" }
let s:l_darkestGrey      = { "gui": "#232628", "cterm": "235" }

let s:l_darkPink         = { "gui": "#63001C", "cterm": "52"  }
let s:l_middleDarkPink   = { "gui": "#C50000", "cterm": "124" }
let s:l_middleLightPink  = { "gui": "#D65E76", "cterm": "167" }
let s:l_lightPink        = { "gui": "#FFAFAF", "cterm": "217" }

let s:l_darkerBlue       = { "gui": "#388BF6", "cterm": "19"  }
let s:l_darkBlue         = { "gui": "#005F87", "cterm": "24"  }
let s:l_middleDarkBlue   = { "gui": "#538192", "cterm": "31"  }
let s:l_middleLightBlue  = { "gui": "#9FD3E6", "cterm": "116" }
let s:l_lightBlue        = { "gui": "#D5EBF7", "cterm": "195" }

let s:l_darkGreen        = { "gui": "#5F5F00", "cterm": "58"  }
let s:l_middleDarkGreen  = { "gui": "#739200", "cterm": "64"  }
let s:l_middleLightGreen = { "gui": "#B8D977", "cterm": "148" }
let s:l_lightGreen       = { "gui": "#BBFFAA", "cterm": "157" }

let s:l_darkTan          = { "gui": "#503D15", "cterm": "52"  }
let s:l_lightTan         = { "gui": "#FDFEFA", "cterm": "231" }

" Assign to semantic categories based on background color
if &background == "dark"
  " Dark theme
  let s:bg         = s:d_middleDarkerGrey
  let s:norm       = s:d_lightBlue
  let s:comment    = s:d_middleDarkGrey
  let s:dimmed     = s:d_middleLightGrey
  let s:subtle     = s:d_darkGrey
  let s:faint      = s:d_darkerGrey
  let s:fainter    = s:d_darkestGrey
  let s:subtler    = s:d_almostBlack
  let s:accent1    = s:d_middleLightBlue
  let s:accent2    = s:d_lightGreen
  let s:accent3    = s:d_middleLightGreen
  let s:accent4    = s:d_lightTan
  let s:accent5    = s:d_darkerBlue
  let s:normRed    = s:d_middleLightPink
  let s:normGreen  = s:d_middleLightGreen
  let s:normBlue   = s:d_middleLightBlue
  let s:faintRed   = s:d_darkPink
  let s:faintGreen = s:d_darkGreen
  let s:faintBlue  = s:d_darkBlue
else
  " Light theme
  let s:bg         = s:l_lightTan
  let s:norm       = s:l_almostBlack
  let s:comment    = s:l_middleLightGrey
  let s:dimmed     = s:l_middleDarkGrey
  let s:subtle     = s:l_lighterGrey
  let s:subtler    = s:l_middleDarkGrey
  let s:faint      = s:l_lighterGrey
  let s:fainter    = s:l_almostWhite
  let s:accent1    = s:l_darkBlue
  let s:accent2    = s:l_middleDarkGreen
  let s:accent3    = s:l_middleDarkPink
  let s:accent4    = s:l_darkTan
  let s:accent5    = s:l_middleLightGrey
  let s:normRed    = s:l_middleDarkPink
  let s:normGreen  = s:l_middleDarkGreen
  let s:normBlue   = s:l_middleDarkBlue
  let s:faintRed   = s:l_lightPink
  let s:faintGreen = s:l_lightGreen
  let s:faintBlue  = s:l_lightBlue
endif


"}}}
" Utility Function -----------------------------------------{{{
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

"}}}
" Highlights - Vim >= 7 ------------------------------------{{{
if version >= 700
  call s:h("CursorLine",      { "bg": s:fainter })
  call s:h("MatchParen",      { "fg": s:accent1, "bg": s:faint, "gui": "bold" })
  call s:h("Pmenu",           { "bg": s:faint })
  call s:h("PmenuThumb",      { "bg": s:norm })
  call s:h("PmenuSBar",       { "bg": s:subtle })
  call s:h("PmenuSel",        { "bg": s:faintBlue })
  call s:h("ColorColumn",     { "bg": s:faintRed })
  call s:h("SpellBad",        { "sp": s:normRed, "gui": "undercurl" })
  call s:h("SpellCap",        { "sp": s:accent1, "gui": "undercurl" })
  call s:h("SpellRare",       { "sp": s:normGreen, "gui": "undercurl" })
  call s:h("SpellLocal",      { "sp": s:accent4, "gui": "undercurl" })
  hi! link CursorColumn	CursorLine

  " Use background for cterm Spell*, which does not support undercurl
  execute "hi! SpellBad   ctermbg=" s:faintRed.cterm
  execute "hi! SpellCap   ctermbg=" s:faintBlue.cterm
  execute "hi! SpellRare  ctermbg=" s:faintGreen.cterm
  execute "hi! SpellLocal ctermbg=" s:faint.cterm
endif

"}}}
" Highlights - UI ------------------------------------------{{{
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("NonText",      { "fg": s:subtle })
call s:h("Cursor",       { "fg": s:bg, "bg": s:normBlue })
call s:h("Visual",       { "bg": s:faintBlue })
call s:h("IncSearch",    { "bg": s:faintBlue })
call s:h("Search",       { "bg": s:faintGreen })
call s:h("StatusLine",   { "fg": s:subtle, "bg": s:dimmed })
call s:h("StatusLineNC", { "fg": s:subtler, "bg": s:dimmed })
call s:h("SignColumn",   { "fg": s:comment, "bg": s:faint })
call s:h("TabLine",      { "fg": s:dimmed, "bg": s:faint })
call s:h("TabLineSel",   { "gui": "bold", "cterm": "bold" })
call s:h("Folded",       { "fg": s:comment, "bg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("Directory",    { "fg": s:accent1 })
call s:h("Title",        { "fg": s:accent4, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:faintRed })
call s:h("DiffAdd",      { "bg": s:faintGreen })
call s:h("DiffChange",   { "bg": s:faintRed })
call s:h("DiffDelete",   { "fg": s:normRed, "bg": s:faintRed })
call s:h("DiffText",     { "bg": s:faintRed, "gui": "bold", "cterm": "bold" })
call s:h("CursorLineNr", { "fg": s:dimmed, "bg": s:fainter })
call s:h("User2",        { "fg": s:bg, "bg": s:normRed })
call s:h("User3",        { "fg": s:bg, "bg": s:normBlue })
hi! link WildMenu     IncSearch
hi! link FoldColumn   SignColumn
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link TabLineFill  StatusLineNC
hi! link LineNr       NonText
hi! link SpecialKey   NonText
hi! link VertSplit    StatusLine

"}}}
" Highlights - Generic Syntax ------------------------------{{{
call s:h("Delimiter",  { "fg": s:dimmed })
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent1, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent2 })
call s:h("Keyword",    { "fg": s:accent2, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:normRed, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "gui": "bold", "cterm": "bold" })
hi! link Identifier  Function
hi! link Statement   Type
hi! link Constant    Directory
hi! link Number      Constant
hi! link Special     Constant
hi! link PreProc     Constant
hi! link Error       ErrorMsg

"}}}
" Highlights - HTML ----------------------------------------{{{
hi! link htmlLink    Underlined
hi! link htmlTag     Type
hi! link htmlEndTag  htmlTag

"}}}
" Highlights - CSS -----------------------------------------{{{
hi! link cssBraces      Delimiter
hi! link cssSelectorOp  cssBraces
hi! link cssClassName   Normal

"}}}
" Highlights - Markdown ------------------------------------{{{
hi! link mkdListItem  mkdDelimiter

"}}}
" Highlights - Shell ---------------------------------------{{{
hi! link shOperator  Delimiter
hi! link shCaseBar   Delimiter

"}}}
" Highlights - JavaScript ----------------------------------{{{
hi! link javaScriptValue   Constant
hi! link javaScriptNull    Constant
hi! link javaScriptBraces  Normal

"}}}
" Highlights - Help ----------------------------------------{{{
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined

"}}}

" vim: fdm=marker:sw=2:sts=2:et
