" blight.vim - Vim color scheme
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
let g:colors_name = "blight"

" Palette ----------------------------------------------{{{2
" Colors -----------------------------------------------{{{3
let s:white  = { "gui": "#ffffff", "cterm": "231" }
let s:grey_6 = { "gui": "#eeeeee", "cterm": "255" }
let s:grey_5 = { "gui": "#dadada", "cterm": "253" }
let s:grey_4 = { "gui": "#b2b2b2", "cterm": "249" }
let s:grey_3 = { "gui": "#949494", "cterm": "246" }
let s:grey_2 = { "gui": "#444444", "cterm": "238" }
let s:grey_1 = { "gui": "#262626", "cterm": "235" }
let s:black  = { "gui": "#121212", "cterm": "233" }

let s:pink   = { "gui": "#ffafaf", "cterm": "217" }
let s:orange = { "gui": "#ff5f00", "cterm": "202" }
let s:red    = { "gui": "#870000", "cterm": "88"  }
let s:maroon = { "gui": "#5f0000", "cterm": "52"  }

let s:blue   = { "gui": "#005faf", "cterm": "25"  }
let s:indigo = { "gui": "#000087", "cterm": "18"  }

let s:aqua   = { "gui": "#dfffff", "cterm": "195" }
let s:spring = { "gui": "#afffaf", "cterm": "157" }
let s:green  = { "gui": "#005f00", "cterm": "22"  }

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
  call s:h("CursorLine",       { "bg": s:grey_6 })
  call s:h("CursorLineNr",     { "fg": s:black })
  call s:h("MatchParen",       { "bg": s:aqua })
  call s:h("Pmenu",            { "bg": s:grey_6 })
  call s:h("PmenuThumb",       { "bg": s:black })
  call s:h("PmenuSBar",        { "bg": s:grey_4 })
  call s:h("PmenuSel",         { "bg": s:aqua })
  call s:h("ColorColumn",      { "bg": s:indigo })
  call s:h("SpellBad",         { "sp": s:orange, "gui": "undercurl" })
  call s:h("SpellCap",         { "sp": s:blue, "gui": "undercurl" })
  call s:h("SpellRare",        { "sp": s:green, "gui": "undercurl" })
  call s:h("SpellLocal",       { "sp": s:maroon, "gui": "undercurl" })
  hi! link CursorColumn	CursorLine

  " Use foreground for cterm Spell*, which does not support undercurl
  execute "hi! SpellBad   ctermfg=" s:orange.cterm
  execute "hi! SpellCap   ctermfg=" s:aqua.cterm
  execute "hi! SpellRare  ctermfg=" s:spring.cterm
  execute "hi! SpellLocal ctermfg=" s:grey_3.cterm
endif

" Highlights - UI ------------------------------------------{{{2
call s:h("Normal",       { "fg": s:black, "bg": s:white })
call s:h("NonText",      { "fg": s:grey_4 })
call s:h("Cursor",       { "fg": s:white, "bg": s:grey_4 })
call s:h("Visual",       { "bg": s:aqua })
call s:h("IncSearch",    { "bg": s:aqua, "gui": "bold", "cterm": "bold" })
call s:h("Search",       { "bg": s:aqua, "gui": "bold", "cterm": "bold" })
call s:h("StatusLine",   { "fg": s:black, "bg": s:grey_4 })
call s:h("StatusLineNC", { "fg": s:white, "bg": s:grey_4 })
call s:h("SignColumn",   { "fg": s:grey_3, "bg": s:grey_6 })
call s:h("VertSplit",    { "fg": s:grey_1, "bg": s:grey_4 })
call s:h("TabLine",      { "fg": s:grey_4, "bg": s:grey_6 })
call s:h("TabLineSel",   { "fg": s:black, "bg": s:white })
call s:h("TabLineFill",  { "bg": s:grey_5 })
call s:h("Folded",       { "fg": s:grey_2, "bg": s:white })
call s:h("Directory",    { "fg": s:red })
call s:h("Title",        { "fg": s:blue, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:pink })
call s:h("DiffAdd",      { "bg": s:spring })
call s:h("DiffChange",   { "bg": s:maroon })
call s:h("DiffDelete",   { "fg": s:pink, "bg": s:maroon })
call s:h("DiffText",     { "bg": s:maroon, "gui": "bold", "cterm": "bold" })
call s:h("FoldColumn",   { "fg": s:blue, "bg": s:grey_6 })
hi! link WildMenu     IncSearch
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link LineNr       NonText
hi! link SpecialKey   NonText

" Highlights - Generic Syntax ------------------------------{{{2
call s:h("Delimiter",  { "fg": s:grey_2 })
call s:h("Comment",    { "fg": s:grey_3, "gui": "italic" })
call s:h("Underlined", { "fg": s:blue, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:blue })
call s:h("String",     { "fg": s:indigo })
call s:h("Keyword",    { "fg": s:red, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:pink, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "fg": s:blue })
hi! link Identifier  Function
hi! link Statement   Type
hi! link Constant    Directory
hi! link Conditional Directory
hi! link Number      Type
hi! link Special     Constant
hi! link PreProc     Constant
hi! link Error       ErrorMsg

" Highlights - C -------------------------------------------{{{2
call s:h("cInclude",  { "fg": s:blue })
call s:h("cIncluded", { "fg": s:orange })
call s:h("cType",     { "fg": s:blue })

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

" Highlights - Ruby ----------------------------------------{{{2
call s:h("rubyPseudoVariable",     { "fg": s:orange })
" hi! link rubyPseudoVariable Normal
hi! link railsMethod        Normal
hi! link parens             Normal
hi! link rubyOperator       Normal
hi! link rubyKeywordAsMethod Directory
hi! link rubyAccess         Directory
hi! link rubyControl        Directory
hi! link rubyBoolean        Type
hi! link rubySymbol         Type
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
