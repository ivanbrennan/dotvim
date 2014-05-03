" eivel_dark.vim - Vim color scheme
" ----------------------------------------------------------
" Author:   Ivan Brennan
" Version:  1.0
" ----------------------------------------------------------

" Setup ----------------------------------------------------{{{
" Reset syntax highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

" Declare theme name
let g:colors_name = "eivel_dark"

"}}}
" The Colors -----------------------------------------------{{{
" Define reusable colors
let s:black            = { "gui": "#1A1C1F", "cterm": "232"  }
let s:greyDarkest      = { "gui": "#1D2836", "cterm": "233"  }
let s:greyDarker       = { "gui": "#1A2430", "cterm": "234" }
let s:greyDark         = { "gui": "#333538", "cterm": "235" }
let s:grey             = { "gui": "#444649", "cterm": "236" }
let s:greyLight        = { "gui": "#66686B", "cterm": "237" }
let s:greyLighter      = { "gui": "#B1B5BA", "cterm": "249" }
let s:white            = { "gui": "#FFFFFF", "cterm": "15" }

let s:redDark          = { "gui": "#9d261d", "cterm": "124"  }
let s:red              = { "gui": "#BD362F", "cterm": "160" }
let s:pink             = { "gui": "#EE5F5B", "cterm": "203" }
let s:pinkLight        = { "gui": "#F79A97", "cterm": "223" }

let s:blueDarkest      = { "gui": "#202327", "cterm": "240"  }
let s:blueDarker       = { "gui": "#455C75", "cterm": "240"  }
let s:blueDark         = { "gui": "#005F87", "cterm": "24"  }
let s:blue             = { "gui": "#3E7BA3", "cterm": "31"  }
let s:blueLight        = { "gui": "#628FCF", "cterm": "33" }
let s:blueLighter      = { "gui": "#388BF6", "cterm": "195" }
let s:blueLightest     = { "gui": "#B4E1F7", "cterm": "195" }

let s:greenDark        = { "gui": "#5F5F00", "cterm": "58"  }
let s:green            = { "gui": "#739200", "cterm": "64"  }
let s:greenLight       = { "gui": "#7FC476", "cterm": "71" }
let s:greenLighter     = { "gui": "#BBFFAA", "cterm": "157" }
let s:greenLightest    = { "gui": "#D6FBFF", "cterm": "157" }

let s:tanDark          = { "gui": "#503D15", "cterm": "52"  }
let s:tanLight         = { "gui": "#F3EDD2", "cterm": "230" }

let s:gold             = { "gui": "#FB9A4B", "cterm": "220" }
let s:yellow           = { "gui": "#EDE651", "cterm": "220" }

" Assign to semantic categories based on background color
set background=dark
if &background == "dark"
  " Dark theme
  let s:base03      = s:black
  let s:base02      = s:greyDarkest
  let s:base01      = s:greyDarker
  let s:base00      = s:greyDark
  let s:base0       = s:grey
  let s:base1       = s:greyLight
  let s:base2       = s:greyLighter
  let s:base3       = s:white

  let s:norm        = s:blueLightest

  let s:accent1     = s:blueLight
  let s:accent2     = s:gold
  let s:accent3     = s:greenLighter
  let s:accent4     = s:tanLight
  let s:accent5     = s:yellow
  let s:accent6     = s:blueLighter
  let s:accent7     = s:greenLightest

  let s:red1        = s:red
  let s:red2        = s:redDark
  let s:green1      = s:green
  let s:green2      = s:greenDark
  let s:blue1       = s:blue
  let s:blue2       = s:blueDark
  let s:blue3       = s:blueDarker
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
  call s:h("CursorLine",       { "bg": s:base02 })
  call s:h("CursorLineNr",     { "fg": s:base1, "bg": s:base02 })
  call s:h("MatchParen",       { "fg": s:base2, "bg": s:base1 })
  call s:h("Pmenu",            { "bg": s:base02 })
  call s:h("PmenuThumb",       { "bg": s:norm })
  call s:h("PmenuSBar",        { "bg": s:base0 })
  call s:h("PmenuSel",         { "bg": s:blue2 })
  call s:h("ColorColumn",      { "bg": s:blueDarkest })
  call s:h("SpellBad",         { "sp": s:red1, "gui": "undercurl" })
  call s:h("SpellCap",         { "sp": s:accent1, "gui": "undercurl" })
  call s:h("SpellRare",        { "sp": s:green1, "gui": "undercurl" })
  call s:h("SpellLocal",       { "sp": s:accent4, "gui": "undercurl" })
  hi! link CursorColumn CursorLine

  " Use background for cterm Spell*, which does not support undercurl
  execute "hi! SpellBad   ctermbg=" s:red2.cterm
  execute "hi! SpellCap   ctermbg=" s:accent1.cterm
  execute "hi! SpellRare  ctermbg=" s:green2.cterm
  execute "hi! SpellLocal ctermbg=" s:base0.cterm
endif

"}}}
" Highlights - UI ------------------------------------------{{{
call s:h("Normal",       { "fg": s:norm, "bg": s:base01 })
call s:h("NonText",      { "fg": s:base00 })
call s:h("Cursor",       { "fg": s:blue3, "bg": s:norm })
call s:h("Visual",       { "bg": s:blue2 })
call s:h("Search",       { "fg": s:base00, "bg": s:accent1 })
call s:h("StatusLine",   { "fg": s:norm, "bg": s:base0, "gui": "bold", "cterm": "bold"})
call s:h("StatusLineNC", { "fg": s:base02, "bg": s:base0 })
call s:h("VertSplit",    { "fg": s:base0, "bg": s:base0 })
call s:h("SignColumn",   { "fg": s:norm })
call s:h("TabLine",      { "fg": s:base2, "bg": s:base0 })
call s:h("TabLineSel",   { "gui": "bold", "cterm": "bold" })
call s:h("Folded",       { "fg": s:blueDarker, "bg": s:base03 , "gui": "underline", "cterm": "underline"})
call s:h("Directory",    { "fg": s:blue1 })
call s:h("Title",        { "fg": s:accent4, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:red2 })
call s:h("DiffAdd",      { "bg": s:green2 })
call s:h("DiffChange",   { "bg": s:red2 })
call s:h("DiffDelete",   { "fg": s:red1, "bg": s:red2 })
call s:h("DiffText",     { "bg": s:red2, "gui": "bold", "cterm": "bold" })
hi! link IncSearch    Visual
hi! link WildMenu     Visual
hi! link FoldColumn   SignColumn
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link TabLineFill  StatusLineNC
hi! link LineNr       NonText
hi! link SpecialKey   NonText

"}}}
" Highlights - Generic Syntax ------------------------------{{{
call s:h("Delimiter",  { "fg": s:base2 })
call s:h("Comment",    { "fg": s:base1, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent1, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent3 })
call s:h("Keyword",    { "fg": s:blue1 })
call s:h("Constant",   { "fg": s:accent1 })
call s:h("Todo",       { "fg": s:red1, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "gui": "bold", "cterm": "bold" })
call s:h("Symbol",     { "fg": s:accent5 })
hi! link Identifier  Function
hi! link Statement   Type
hi! link Number      Constant
hi! link Special     Constant
hi! link PreProc     Constant
hi! link Error       ErrorMsg

"}}}
" Highlights - HTML ----------------------------------------{{{
hi! link htmlLink    Underlined
hi! link htmlTag     Constant
hi! link htmlTagName Type
hi! link htmlEndTag  htmlTag
hi! link htmlArg     Symbol

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
" Highlights - Ruby ----------------------------------------{{{
hi link rubyBeginend                Keyword
hi link rubyClass                   Keyword
hi link rubyDefine                  Keyword
hi link rubyModule                  Keyword
hi link rubyKeyword                 Keyword
hi link rubyLocalVariableOrMethod   Keyword
hi link rubyConditional             Keyword
hi link rubyControl                 Keyword
hi link rubyDoBlock                 Keyword
hi link rubyOperator                Constant
hi link rubyIdentifier              Keyword
hi link rubyClassVariable           Symbol
hi link rubyInstanceVariable        Constant
hi link rubyGlobalVariable          Constant
hi link rubyConstant                Constant
hi link rubySymbol                  Symbol
hi link rubyBoolean                 Symbol
hi link rubyFunction                Constant
hi link rubyCurlyBlockDelimiter     Delimiter
hi link rubyArrayDelimiter          Delimiter
hi link rubyInterpolation           Interpolation
hi link rubyInterpolationDelimiter  Interpolation
hi link rubyRailsMethod             Constant
hi link rubyString                  String
hi link erubyDelimiter              Delimiter

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
