" blight.vim - Vim color scheme
" ······························································
" Author:   Ivan Brennan (ivan.brennan@gmail.com)
" Version:  0.1
" ······························································

" Setup ····················································{{{1
" Initialization ···········································{{{2
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "blight"

" Palette ··················································{{{2
let s:white  = { "gui": "#ffffff", "cterm": "231" }
let s:black  = { "gui": "#121212", "cterm": "233" }

let s:owhite = { "gui": "#f7f8f8", "cterm": "231" }
let s:grey_6 = { "gui": "#eeeeee", "cterm": "255" }
let s:grey_5 = { "gui": "#dadada", "cterm": "253" }
let s:grey_4 = { "gui": "#b2b2b2", "cterm": "249" }
let s:grey_3 = { "gui": "#949494", "cterm": "246" }
let s:grey_2 = { "gui": "#444444", "cterm": "238" }
let s:grey_1 = { "gui": "#262626", "cterm": "235" }

let s:grey_x = { "gui": "#e7e7e7", "cterm": "253" }
let s:grey_y = { "gui": "#c7c7c7", "cterm": "253" }
let s:grey_z = { "gui": "#f2f2f2", "cterm": "253" }
let s:nice_grey = { "gui": "#393E53", "cterm": "253" }
let s:slate     = { "gui": "#666666", "cterm": "253" }
let s:purpcoal  = { "gui": "#354668", "cterm": "253" }
let s:paper     = { "gui": "#f5f5f6", "cterm": "253" }

let s:solar  = { "gui": "#ffffdf", "cterm": "230" }
let s:yellow = { "gui": "#ffffaf", "cterm": "229" }
let s:lime   = { "gui": "#F2F9DB", "cterm": "229" }
let s:sand   = { "gui": "#f8eec7", "cterm": "229" }
let s:pink   = { "gui": "#fceff0", "cterm": "217" }
let s:dpink  = { "gui": "#f2bdc2", "cterm": "217" }
let s:orange = { "gui": "#ff5f00", "cterm": "202" }
let s:oxblood = { "gui": "#870000", "cterm": "88"  }
let s:lava   = { "gui": "#bd3634", "cterm": "88"  }
let s:maroon = { "gui": "#5f0000", "cterm": "52"  }

let s:blue   = { "gui": "#005f87", "cterm": "24"  }
let s:indigo = { "gui": "#00005f", "cterm": "17"  }
let s:purple = { "gui": "#5f5f87", "cterm": "60"  }
let s:visip  = { "gui": "#e7e9f3", "cterm": "195" }

let s:aqua   = { "gui": "#dfffff", "cterm": "195" }
let s:spring = { "gui": "#ebfded", "cterm": "157" }
let s:green  = { "gui": "#005f00", "cterm": "22"  }

" Utility Function ·········································{{{2
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

" Highlights ···············································{{{1
" Normal · (this affects 'background' so set it first) ·····{{{2
call s:h("Normal",         { "fg": s:black, "bg": s:owhite })

" UI ·······················································{{{2
call s:h("Cursor",         { "fg": s:white, "bg": s:grey_4 })
call s:h("CursorLine",     { "bg": s:paper })
hi! link CursorColumn      CursorLine
call s:h("QuickFixLine",   { "bg": s:grey_6 })

call s:h("ColorColumn",    { "bg": s:paper })
call s:h("CursorLineNr",   { "fg": s:black })
call s:h("LineNr",         { "fg": s:grey_y })
call s:h("SignColumn",     { "fg": s:grey_3, "bg": s:grey_6 })

call s:h("DiffAdd",        { "bg": s:spring })
call s:h("DiffChange",     { "bg": s:pink })
call s:h("DiffDelete",     { "bg": s:pink })
call s:h("DiffText",       { "bg": s:dpink })

call s:h("Folded",         { "fg": s:grey_3 })
call s:h("FoldColumn",     { "fg": s:blue, "bg": s:grey_6 })

call s:h("IncSearch",      { "bg": s:sand, "gui": "bold", "cterm": "bold" })
call s:h("Search",         { "gui": "bold,underline", "cterm": "bold,underline" })
call s:h("MatchParen",     { "bg": s:aqua })
call s:h("Visual",         { "bg": s:visip })
call s:h("Substitute",     { "fg": s:lava, "gui": "underline", "cterm": "underline" })

call s:h("NonText",        { "fg": s:grey_5, "bg": s:paper })
call s:h("Whitespace",     { "fg": s:grey_5, "bg": s:paper })
call s:h("EndOfBuffer",    { "fg": s:paper, "bg": s:paper })

call s:h("StatusLine",     { "fg": s:nice_grey, "bg": s:grey_x })
call s:h("StatusLineNC",   { "fg": s:grey_3, "bg": s:grey_x })
call s:h("TabLine",        { "fg": s:grey_4, "bg": s:paper, "gui": "italic" })
call s:h("TabLineSel",     { "fg": s:grey_2, "bg": s:owhite, "gui": "italic" })
call s:h("TabLineFill",    { "bg": s:paper })
call s:h("VertSplit",      { "fg": s:grey_3, "bg": s:owhite })

call s:h("Pmenu",          { "bg": s:grey_6 })
call s:h("PmenuThumb",     { "bg": s:black })
call s:h("PmenuSBar",      { "bg": s:grey_4 })
call s:h("PmenuSel",       { "bg": s:aqua })
hi! link WildMenu          IncSearch

call s:h("ModeMsg",        { "fg": s:grey_3 })

call s:h("Directory",      { "fg": s:blue })

call s:h("Title",          { "fg": s:blue, "gui": "bold", "cterm": "bold" })
hi! link MoreMsg           Title
hi! link Question          Title
hi! link ErrorMsg          Error
hi! link WarningMsg        Error

hi! link SpecialKey        LineNr

" Spelling ·················································{{{2
call s:h("SpellBad",       { "sp": s:orange, "gui": "undercurl" })
call s:h("SpellCap",       { "sp": s:blue, "gui": "undercurl" })
call s:h("SpellRare",      { "sp": s:green, "gui": "undercurl" })
call s:h("SpellLocal",     { "sp": s:maroon, "gui": "undercurl" })
" Use foreground for cterm Spell*, which does not support undercurl
execute "hi! SpellBad   ctermfg=" s:orange.cterm
execute "hi! SpellCap   ctermfg=" s:aqua.cterm
execute "hi! SpellRare  ctermfg=" s:spring.cterm
execute "hi! SpellLocal ctermfg=" s:grey_3.cterm

" Highlights · Syntax ······································{{{2
call s:h("Comment",        { "fg": s:grey_3, "gui": "italic", "cterm": "italic" })

call s:h("Constant",       { "fg": s:blue })
call s:h("String",         { "fg": s:indigo })
" call s:h("Character",      { "fg": s:blue })
" call s:h("Number",         { "fg": s:blue })
" call s:h("Boolean",        { "fg": s:blue })
" call s:h("Float",          { "fg": s:blue })

call s:h("Identifier",     { "fg": s:purple })
" call s:h("Function",       { "fg": s:purple })

call s:h("Statement",      { "fg": s:oxblood })
" call s:h("Conditional",    { "fg": s:oxblood })
" call s:h("Repeat",         { "fg": s:oxblood })
" call s:h("Label",          { "fg": s:oxblood })
" call s:h("Operator",       { "fg": s:oxblood })
call s:h("Keyword",        { "fg": s:oxblood, "gui": "bold", "cterm": "bold" })
" call s:h("Exception",      { "fg": s:oxblood })

call s:h("PreProc",        { "fg": s:oxblood })
" call s:h("Include",        { "fg": s:oxblood })
" call s:h("Define",         { "fg": s:oxblood })
" call s:h("Macro",          { "fg": s:oxblood })
" call s:h("PreCondit",      { "fg": s:oxblood })

call s:h("Type",           { "fg": s:oxblood })
" call s:h("StorageClass",   { "fg": s:oxblood })
" call s:h("Structure",      { "fg": s:oxblood })
" call s:h("Typedef",        { "fg": s:oxblood })

call s:h("Special",        { "fg": s:blue })
" call s:h("SpecialChar",    { "fg": s:blue })
" call s:h("Tag",            { "fg": s:blue })
call s:h("Delimiter",      { "fg": s:grey_2 })
" call s:h("SpecialComment", { "fg": s:blue })
" call s:h("Debug",          { "fg": s:blue })

call s:h("Underlined",     { "fg": s:blue, "gui": "underline", "cterm": "underline" })

call s:h("Error",          { "fg": s:oxblood })

call s:h("Todo",           { "fg": s:lava, "gui": "bold", "cterm": "bold" })

" Highlights · C ···········································{{{2
hi! link cCustomFunc Function
hi! link cBoolean    Boolean
call s:h("cFormat",     { "fg": s:blue })
call s:h("cSpecial",     { "fg": s:indigo })

" Highlights · HTML ········································{{{2
hi! link htmlLink    Underlined
hi! link htmlTag     Type
hi! link htmlEndTag  htmlTag

" Highlights · CSS ·········································{{{2
hi! link cssBraces      Delimiter
hi! link cssSelectorOp  cssBraces
hi! link cssClassName   Normal

" Highlights · Markdown ····································{{{2
hi! link mkdListItem  mkdDelimiter

" Highlights · Shell ·······································{{{2
call s:h("shStatement", { "fg": s:blue })
call s:h("shCmdSubRegion", { "fg": s:indigo })
hi! link shCommandSub shCmdSubRegion
hi! link shOperator   Delimiter
hi! link shCaseBar    Delimiter
hi! link shFunction   Function
hi! link shDeref      Normal

" Highlights · Ruby ········································{{{2
call s:h("rubyPseudoVariable",     { "fg": s:orange })
" hi! link rubyPseudoVariable Normal
hi! link railsMethod         Normal
hi! link parens              Normal
hi! link rubyOperator        Normal
hi! link rubyKeywordAsMethod Type
hi! link rubyAccess          Type
hi! link rubyControl         Type
hi! link rubyConstant        Constant
hi! link rubySharpBang       Comment
call s:h("rubySymbol",      { "fg": s:blue })
" Highlights · Vim ·········································{{{2
call s:h("vimContinue",      { "fg": s:oxblood  })
call s:h("vimCommand",       { "fg": s:oxblood  })
call s:h("vimFunction",      { "fg": s:purple })
call s:h("vimFuncName",      { "fg": s:blue })
call s:h("vimLet",           { "fg": s:blue })
call s:h("vimAutoCmd",       { "fg": s:blue })
call s:h("vimAutoCmdSfxList", { "fg": s:oxblood  })
hi! link vimUserFunc    vimFuncName
hi! link vimUserCommand vimFuncName
hi! link vimHighlight   Normal
hi! link vimGroup       Normal
hi! link vimSyntax      Normal
hi! link vimSynType     Normal
hi! link vimAutoEvent   Normal
hi! link vimVar         Normal
hi! link vimEnvvar      Normal
hi! link vimOption      Normal
hi! link vimOper        Operator
hi! link vimFuncVar     Normal
hi! link vimFuncSID     Function
hi! link netrwSymLink   Function

" Highlights · JavaScript ··································{{{2
hi! link javaScriptValue   Constant
hi! link javaScriptNull    Constant
hi! link javaScriptBraces  Normal

" Highlights · Help ········································{{{2
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined

" vim: fdm=marker:sw=2:sts=2:et
