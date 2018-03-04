" ion.vim ۰ Vim color scheme
" Author:  Ivan Brennan (ivan.brennan@gmail.com)
" Version: 0.1

" Initialize ۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰{{{1
hi clear
syntax reset

let g:colors_name="ion"
set background=dark

function! s:hi(group, style)
  execute "highlight" a:group
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endf

" Palette ۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰{{{1
let s:white    = { "gui": "#eceaf6", "cterm": "217" }
let s:grey_14  = { "gui": "#eceff4", "cterm":  "15" }
let s:grey_13  = { "gui": "#e5e9f0", "cterm":   "7" }
let s:grey_12  = { "gui": "#d5d7e0", "cterm": "253" }
let s:grey_11  = { "gui": "#cecfd8", "cterm": "253" }
let s:grey_10  = { "gui": "#9ca7bd", "cterm": "253" }
let s:grey_09  = { "gui": "#7887a8", "cterm":   "8" }
let s:grey_08  = { "gui": "#64718c", "cterm":   "8" }
let s:grey_07  = { "gui": "#434C5E", "cterm": "249" }
let s:grey_06  = { "gui": "#3d4451", "cterm": "249" }
let s:grey_05  = { "gui": "#2C313D", "cterm": "100" }
let s:grey_04  = { "gui": "#282c34", "cterm": "236" }
let s:grey_03  = { "gui": "#252930", "cterm": "238" }
let s:grey_02  = { "gui": "#23272e", "cterm": "235" }
let s:grey_01  = { "gui": "#23262b", "cterm": "234" }
let s:grey_00  = { "gui": "#21242b", "cterm": "235" }
let s:black    = { "gui": "#181e26", "cterm": "233" }

let s:blue_5   = { "gui": "#afdfff", "cterm":  "88" }
let s:blue_4   = { "gui": "#b3dbf1", "cterm": "253" }
let s:blue_3   = { "gui": "#52a9ea", "cterm":  "24" }
let s:blue_2   = { "gui": "#81A1C1", "cterm":   "4" }
let s:blue_1   = { "gui": "#5E81AC", "cterm":  "12" }
let s:blue_0   = { "gui": "#005f87", "cterm":  "24" }
let s:cyan_5   = { "gui": "#97c6c5", "cterm":  "14" }
let s:cyan_4   = { "gui": "#88C0D0", "cterm":   "6" }
let s:cyan_3   = { "gui": "#34d5de", "cterm": "159" }
let s:cyan_2   = { "gui": "#26A6A6", "cterm": "159" }
let s:cyan_1   = { "gui": "#5790a8", "cterm":  "22" }
let s:cyan_0   = { "gui": "#48778b", "cterm":  "22" }
let s:green_3  = { "gui": "#afffaf", "cterm": "157" }
let s:green_2  = { "gui": "#a3be8c", "cterm":   "2" }
let s:green_1  = { "gui": "#89be74", "cterm":  "22" }
let s:green_0  = { "gui": "#00351A", "cterm": "100" }
let s:lime_2   = { "gui": "#b8e068", "cterm":   "2" }
let s:lime_1   = { "gui": "#d0d587", "cterm":  "88" }
let s:lime_0   = { "gui": "#d0d587", "cterm":  "88" }
let s:sand_0   = { "gui": "#ebcb8b", "cterm":   "3" }
let s:orange_0 = { "gui": "#f8bb39", "cterm": "202" }
let s:red_2    = { "gui": "#dd3d4c", "cterm":   "1" }
let s:red_1    = { "gui": "#B40020", "cterm": "100" }
let s:red_0    = { "gui": "#391017", "cterm": "100" }
let s:purple_0 = { "gui": "#ba93b3", "cterm":   "5" }

" Highlights ۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰{{{1
call s:hi("Bold",      { "gui": "bold", "cterm": "bold" })
call s:hi("Italic",    { "gui": "italic", "cterm": "italic" })
call s:hi("Underline", { "gui": "underline", "cterm": "underline" })

call s:hi("Normal",      { "bg": s:grey_04, "fg": s:grey_12 })
call s:hi("ColorColumn", { "bg": s:grey_02 })
call s:hi("Cursor",      { "bg": s:grey_12 })
call s:hi("CursorLine",  { "bg": s:grey_03 })
hi! link CursorColumn CursorLine

" Editor ····۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰{{{1
call s:hi("iCursor",    { "bg": s:grey_12 })
call s:hi("LineNr",     { "bg": s:grey_04, "fg": s:grey_07 })
call s:hi("MatchParen", { "fg": s:blue_5, "gui": "bold", "cterm": "bold" })
call s:hi("NonText",    { "fg": s:grey_07 })
call s:hi("PMenu",      { "bg": s:grey_01, "fg": s:grey_12 })
call s:hi("PmenuSbar",  { "bg": s:grey_01 })
call s:hi("PMenuSel",   { "bg": s:grey_03, "fg": s:blue_4, "gui": "bold", "cterm": "bold" })
call s:hi("PmenuThumb", { "bg": s:blue_0 })

call s:hi("SpecialKey", { "fg": s:grey_07 })
call s:hi("SpellBad",   { "fg": s:red_2, "sp": s:red_2, "gui": "undercurl", "cterm": "undercurl" })
call s:hi("SpellCap",   { "fg": s:red_2, "sp": s:sand_0, "gui": "undercurl", "cterm": "undercurl" })
call s:hi("SpellLocal", { "fg": s:grey_13, "sp": s:grey_13, "gui": "undercurl", "cterm": "undercurl" })
call s:hi("SpellRare",  { "fg": s:grey_14, "sp": s:grey_14, "gui": "undercurl", "cterm": "undercurl" })
call s:hi("Visual",     { "bg": s:grey_06 })
call s:hi("VisualNOS",  { "bg": s:grey_06 })

"+- Neovim Support -+
call s:hi("healthError",   { "bg": s:grey_02, "fg": s:red_2 })
call s:hi("healthSuccess", { "bg": s:grey_02, "fg": s:green_2 })
call s:hi("healthWarning", { "bg": s:grey_02, "fg": s:sand_0 })

"+--- Gutter ---+
call s:hi("CursorLineNr", { "fg": s:grey_09 })
call s:hi("Folded",       { "bg": s:grey_05, "fg": s:grey_08 })
call s:hi("FoldColumn",   { "bg": s:grey_04, "fg": s:grey_07 })
call s:hi("SignColumn",   { "bg": s:grey_04, "fg": s:grey_02 })

"+--- Navigation ---+
call s:hi("Directory", { "fg": s:cyan_3 })

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer",  { "bg": s:grey_02, "fg": s:grey_02 })
call s:hi("ErrorMsg",     { "fg": s:lime_2 })
call s:hi("ModeMsg",      { "fg": s:grey_12 })
call s:hi("MoreMsg",      { "fg": s:grey_11, "gui": "bold", "cterm": "bold" })
call s:hi("Question",     { "fg": s:blue_2, "gui": "bold", "cterm": "bold" })
call s:hi("StatusLine",   { "bg": s:grey_00, "fg": s:grey_12 })
call s:hi("StatusLineNC", { "bg": s:grey_00, "fg": s:grey_07 })
call s:hi("WarningMsg",   { "fg": s:sand_0 })
call s:hi("WildMenu",     { "bg": s:grey_03, "fg": s:blue_4, "gui": "bold", "cterm": "bold" })

"+--- Search ---+
call s:hi("IncSearch", { "bg": s:cyan_1, "fg": s:grey_00 })
call s:hi("Search",    { "bg": s:grey_07 })

"+--- Tabs ---+
call s:hi("TabLine",     { "bg": s:grey_02, "fg": s:grey_12 })
call s:hi("TabLineFill", { "bg": s:grey_02 })
call s:hi("TabLineSel",  { "bg": s:grey_04, "fg": s:grey_12, "gui": "bold", "cterm": "bold" })

"+--- Window ---+
call s:hi("Title",     { "fg": s:white })
call s:hi("VertSplit", { "bg": s:grey_00, "fg": s:grey_07 })

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean",        { "fg": s:lime_1 })
call s:hi("Character",      { "fg": s:green_3 })
call s:hi("Comment",        { "fg": s:cyan_0, "gui": "italic", "cterm": "italic" })
call s:hi("Conditional",    { "fg": s:blue_2 })
call s:hi("Constant",       { "fg": s:cyan_5 })
call s:hi("Define",         { "fg": s:blue_2 })
call s:hi("Delimiter",      { "fg": s:grey_10 })
call s:hi("Exception",      { "fg": s:blue_2 })
call s:hi("Float",          { "fg": s:purple_0 })
call s:hi("Function",       { "fg": s:cyan_4 })
call s:hi("Identifier",     { "fg": s:grey_12 })
call s:hi("Include",        { "fg": s:blue_2 })
call s:hi("Keyword",        { "fg": s:blue_2 })
call s:hi("Label",          { "fg": s:blue_2 })
call s:hi("Number",         { "fg": s:purple_0 })
call s:hi("Operator",       { "fg": s:blue_2 })
call s:hi("PreProc",        { "fg": s:blue_2 })
call s:hi("Repeat",         { "fg": s:blue_2 })
call s:hi("Special",        { "fg": s:grey_12 })
call s:hi("SpecialChar",    { "fg": s:sand_0 })
call s:hi("SpecialComment", { "fg": s:cyan_4, "gui": "italic", "cterm": "italic" })
call s:hi("Statement",      { "fg": s:blue_2 })
call s:hi("StorageClass",   { "fg": s:blue_2 })
call s:hi("String",         { "fg": s:green_1 })
call s:hi("Structure",      { "fg": s:blue_2 })
call s:hi("Tag",            { "fg": s:grey_12 })
call s:hi("Todo",           { "fg": s:orange_0 })
call s:hi("Type",           { "fg": s:blue_2 })
call s:hi("Typedef",        { "fg": s:blue_2 })
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("awkCharClass", { "fg": s:cyan_5 })
call s:hi("awkPatterns",  { "fg": s:blue_2, "gui": "bold", "cterm": "bold" })
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", { "fg": s:cyan_5 })
hi! link cOperator Operator
hi! link cPreCondit PreCondit

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", { "fg": s:cyan_5 })
call s:hi("cssDefinition",        { "fg": s:cyan_5 })
call s:hi("cssIdentifier",        { "fg": s:cyan_5, "gui": "underline", "cterm": "underline" })
call s:hi("cssStringQ",           { "fg": s:cyan_5 })
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", { "fg": s:cyan_4 })
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", { "fg": s:cyan_5 })
call s:hi("dtExecKey",    { "fg": s:cyan_5 })
call s:hi("dtLocaleKey",  { "fg": s:cyan_5 })
call s:hi("dtNumericKey", { "fg": s:cyan_5 })
call s:hi("dtTypeKey",    { "fg": s:cyan_5 })
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

call s:hi("diffAdded",   { "fg": s:green_2 })
call s:hi("diffChanged", { "fg": s:sand_0 })
call s:hi("diffNewFile", { "fg": s:cyan_4 })
call s:hi("diffOldFile", { "fg": s:cyan_5 })
call s:hi("diffRemoved", { "fg": s:red_2 })
call s:hi("DiffAdd",     { "bg": s:green_0 })
call s:hi("DiffChange",  { "bg": s:red_0 })
call s:hi("DiffDelete",  { "bg": s:grey_05, "fg": s:grey_05 })
call s:hi("DiffText",    { "bg": s:red_1, "fg": s:grey_12 })

call s:hi("gitconfigVariable", { "fg": s:cyan_5 })

call s:hi("goBuiltins", { "fg": s:cyan_5 })
hi! link goConstants Keyword

call s:hi("helpCommand", { "fg": s:grey_10 })
call s:hi("helpHeader",  { "fg": s:grey_11, "gui": "bold", "cterm": "bold" })
call s:hi("helpHyperTextJump", { "fg": s:cyan_3 })
hi! link helpExample helpCommand
hi! link helpHyperTextEntry helpHeader

call s:hi("htmlArg",  { "fg": s:cyan_5 })
call s:hi("htmlLink", { "fg": s:grey_12 })
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", { "fg": s:cyan_5 })
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", { "fg": s:cyan_5 })

call s:hi("lessClass", { "fg": s:cyan_5 })
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote",    { "fg": s:cyan_5 })
call s:hi("markdownCode",          { "fg": s:cyan_5 })
call s:hi("markdownCodeDelimiter", { "fg": s:cyan_5 })
call s:hi("markdownFootnote",      { "fg": s:cyan_5 })
call s:hi("markdownId",            { "fg": s:cyan_5 })
call s:hi("markdownIdDeclaration", { "fg": s:cyan_5 })
call s:hi("markdownH1",            { "fg": s:cyan_4 })
call s:hi("markdownLinkText",      { "fg": s:cyan_5 })
call s:hi("markdownUrl",           { "fg": s:grey_12 })
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", { "fg": s:cyan_5 })

call s:hi("phpClasses", { "fg": s:cyan_5 })
call s:hi("phpDocTags", { "fg": s:cyan_5 })
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText",      { "fg": s:cyan_5 })
call s:hi("podVerbatimLine", { "fg": s:grey_12 })
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubySymbol", { "fg": s:grey_12, "gui": "bold", "cterm": "bold" })
hi! link rubyArrayDelimiter Delimiter
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyConstant Constant
hi! link rubyCurlyBlockDelimiter Delimiter
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("sassClass", { "fg": s:cyan_5 })
call s:hi("sassId",    { "fg": s:cyan_5, "gui": "underline", "cterm": "underline" })
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup",  { "fg": s:cyan_5 })
call s:hi("vimMapRhs",   { "fg": s:cyan_5 })
call s:hi("vimNotation", { "fg": s:cyan_5 })
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib",     { "fg": s:cyan_5 })
call s:hi("xmlCdataStart", { "fg": s:grey_07, "gui": "bold", "cterm": "bold" })
call s:hi("xmlNamespace",  { "fg": s:cyan_5 })
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", { "fg": s:cyan_5 })
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", { "fg": s:sand_0 })
call s:hi("ALEErrorSign",   { "fg": s:red_2 })

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd",          { "fg": s:green_2 })
call s:hi("GitGutterChange",       { "fg": s:sand_0 })
call s:hi("GitGutterChangeDelete", { "fg": s:red_2 })
call s:hi("GitGutterDelete",       { "fg": s:red_2 })

" davidhalter/jedi-vim
call s:hi("jediFunction", { "bg": s:grey_07, "fg": s:grey_12 })
call s:hi("jediFat",      { "bg": s:grey_07, "fg": s:cyan_4, "gui": "bold,underline", "cterm": "bold,underline" })

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", { "fg": s:cyan_5 })
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

"+--- Languages ---+
" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", { "fg": s:cyan_4, "gui": "italic", "cterm": "italic" })
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" vim: fdm=marker:sw=2:sts=2:et
