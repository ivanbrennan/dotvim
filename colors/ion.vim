" ion colorscheme

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "ion"
let s:ion_vim_version="0.6.0"
set background=dark

let s:ion00_gui = "#232A38"
let s:ion0_gui  = "#1F2D3B"
let s:ion01_gui = "#213040"
let s:ion1_gui  = "#233343"
let s:ion2_gui = "#2C3B4C"
let s:ion3_gui = "#36495E"
let s:ion4_gui = "#D8DEE9"
let s:ion5_gui = "#E5E9F0"
let s:ion6_gui = "#ECEFF4"
let s:ion7_gui = "#8FBCBB"
let s:ion8_gui = "#88C0D0"
let s:ion9_gui = "#81A1C1"
let s:ion10_gui = "#5E81AC"
let s:ion11_gui = "#BF616A"
let s:ion12_gui = "#D08770"
let s:ion13_gui = "#EBCB8B"
let s:ion14_gui = "#A3BE8C"
let s:ion15_gui = "#B48EAD"

let s:ion1_term = "0"
let s:ion3_term = "8"
let s:ion5_term = "7"
let s:ion6_term = "15"
let s:ion7_term = "14"
let s:ion8_term = "6"
let s:ion9_term = "4"
let s:ion10_term = "12"
let s:ion11_term = "1"
let s:ion12_term = "11"
let s:ion13_term = "3"
let s:ion14_term = "2"
let s:ion15_term = "5"

if !exists('g:ion_italic_comments')
  let g:ion_italic_comments = 1
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  let l:attr = a:attr
  if g:ion_italic_comments == 0 && l:attr ==? 'italic'
    let l:attr= 'NONE'
  endif

  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", "bold", "")
call s:hi("Italic", "", "", "", "", "italic", "")
call s:hi("Underline", "", "", "", "", "underline", "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:ion01_gui, "NONE", s:ion1_term, "", "")
call s:hi("Cursor", s:ion0_gui, s:ion4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:ion01_gui, "NONE", s:ion1_term, "NONE", "")
call s:hi("iCursor", s:ion0_gui, s:ion4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:ion3_gui, s:ion0_gui, s:ion3_term, "NONE", "", "")
call s:hi("MatchParen", s:ion0_gui, s:ion9_gui, s:ion1_term, s:ion9_term, "", "")
call s:hi("NonText", s:ion2_gui, "", s:ion3_term, "", "", "")
call s:hi("Normal", s:ion4_gui, s:ion0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:ion4_gui, s:ion2_gui, "NONE", s:ion1_term, "NONE", "")
call s:hi("PmenuSbar", s:ion4_gui, s:ion2_gui, "NONE", s:ion1_term, "", "")
call s:hi("PMenuSel", s:ion8_gui, s:ion3_gui, s:ion8_term, s:ion3_term, "", "")
call s:hi("PmenuThumb", s:ion8_gui, s:ion3_gui, "NONE", s:ion3_term, "", "")
call s:hi("SpecialKey", s:ion3_gui, "", s:ion3_term, "", "", "")
call s:hi("SpellBad", "", s:ion0_gui, "", "NONE", "undercurl", s:ion11_gui)
call s:hi("SpellCap", "", s:ion0_gui, "", "NONE", "undercurl", s:ion13_gui)
call s:hi("SpellLocal", "", s:ion0_gui, "", "NONE", "undercurl", s:ion5_gui)
call s:hi("SpellRare", "", s:ion0_gui, "", "NONE", "undercurl", s:ion6_gui)
call s:hi("Visual", "", s:ion2_gui, "", s:ion1_term, "", "")
call s:hi("VisualNOS", "", s:ion2_gui, "", s:ion1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:ion11_gui, s:ion1_gui, s:ion11_term, s:ion1_term, "", "")
call s:hi("healthSuccess", s:ion14_gui, s:ion1_gui, s:ion14_term, s:ion1_term, "", "")
call s:hi("healthWarning", s:ion13_gui, s:ion1_gui, s:ion13_term, s:ion1_term, "", "")

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:ion1_gui, "NONE", s:ion1_term, "", "")
call s:hi("CursorLineNr", s:ion3_gui, s:ion0_gui, "NONE", "", "", "")
call s:hi("Folded", s:ion3_gui, s:ion1_gui, s:ion3_term, s:ion1_term, "bold", "")
call s:hi("FoldColumn", s:ion3_gui, s:ion0_gui, s:ion3_term, "NONE", "", "")
call s:hi("SignColumn", s:ion1_gui, s:ion0_gui, s:ion1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:ion8_gui, "", s:ion8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:ion0_gui, s:ion0_gui, s:ion1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:ion4_gui, s:ion11_gui, "NONE", s:ion11_term, "", "")
call s:hi("ModeMsg", s:ion4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:ion4_gui, "", "", "", "", "")
call s:hi("Question", s:ion4_gui, "", "NONE", "", "", "")
call s:hi("StatusLine", s:ion4_gui, s:ion00_gui, s:ion8_term, s:ion1_term, "NONE", "")
call s:hi("StatusLineNC", s:ion3_gui, s:ion00_gui, s:ion8_term, "NONE", "NONE", "")
call s:hi("WarningMsg", s:ion0_gui, s:ion13_gui, s:ion1_term, s:ion13_term, "", "")
call s:hi("WildMenu", s:ion8_gui, s:ion3_gui, s:ion8_term, s:ion3_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:ion1_gui, s:ion8_gui, s:ion1_term, s:ion8_term, "underline", "")
call s:hi("Search", s:ion6_gui, s:ion3_gui, s:ion6_term, s:ion3_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:ion4_gui, s:ion1_gui, "NONE", s:ion1_term, "NONE", "")
call s:hi("TabLineFill", s:ion4_gui, s:ion1_gui, "NONE", s:ion1_term, "NONE", "")
call s:hi("TabLineSel", s:ion8_gui, s:ion3_gui, s:ion8_term, s:ion3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:ion4_gui, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:ion2_gui, s:ion0_gui, s:ion3_term, "NONE", "NONE", "")

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("Character", s:ion14_gui, "", s:ion14_term, "", "", "")
call s:hi("Comment", s:ion3_gui, "", s:ion9_term, "", "italic", "")
call s:hi("Conditional", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("Constant", s:ion4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("Delimiter", s:ion6_gui, "", s:ion6_term, "", "", "")
call s:hi("Exception", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("Float", s:ion15_gui, "", s:ion15_term, "", "", "")
call s:hi("Function", s:ion8_gui, "", s:ion8_term, "", "", "")
call s:hi("Identifier", s:ion4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("Keyword", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("Label", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("Number", s:ion15_gui, "", s:ion15_term, "", "", "")
call s:hi("Operator", s:ion9_gui, "", s:ion9_term, "", "NONE", "")
call s:hi("PreProc", s:ion9_gui, "", s:ion9_term, "", "NONE", "")
call s:hi("Repeat", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("Special", s:ion4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:ion13_gui, "", s:ion13_term, "", "", "")
call s:hi("SpecialComment", s:ion8_gui, "", s:ion8_term, "", "italic", "")
call s:hi("Statement", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("StorageClass", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("String", s:ion14_gui, "", s:ion14_term, "", "", "")
call s:hi("Structure", s:ion9_gui, "", s:ion9_term, "", "", "")
call s:hi("Tag", s:ion4_gui, "", "", "", "", "")
call s:hi("Todo", s:ion13_gui, "NONE", s:ion13_term, "NONE", "", "")
call s:hi("Type", s:ion9_gui, "", s:ion9_term, "", "NONE", "")
call s:hi("Typedef", s:ion9_gui, "", s:ion9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("awkCharClass", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("awkPatterns", s:ion9_gui, "", s:ion9_term, "", "bold", "")
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

call s:hi("cIncluded", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("cssDefinition", s:ion7_gui, "", s:ion7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:ion7_gui, "", s:ion7_term, "", "underline", "")
call s:hi("cssStringQ", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:ion8_gui, "", s:ion8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("dtExecKey", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("dtLocaleKey", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("dtNumericKey", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("dtTypeKey", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

call s:hi("diffAdded", s:ion14_gui, "", s:ion14_term, "", "", "")
call s:hi("diffChanged", s:ion13_gui, "", s:ion13_term, "", "", "")
call s:hi("diffNewFile", s:ion8_gui, "", s:ion8_term, "", "", "")
call s:hi("diffOldFile", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("diffRemoved", s:ion11_gui, "", s:ion11_term, "", "", "")
call s:hi("DiffAdd", s:ion14_gui, "", s:ion14_term, "", "", "")
call s:hi("DiffChange", s:ion13_gui, "", s:ion13_term, "", "", "")
call s:hi("DiffDelete", s:ion11_gui, "", s:ion11_term, "", "", "")
call s:hi("DiffText", s:ion4_gui, "", "NONE", "", "", "")

call s:hi("gitconfigVariable", s:ion7_gui, "", s:ion7_term, "", "", "")

call s:hi("goBuiltins", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("htmlArg", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("htmlLink", s:ion4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:ion7_gui, "", s:ion7_term, "", "", "")

call s:hi("lessClass", s:ion7_gui, "", s:ion7_term, "", "", "")
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

call s:hi("markdownBlockquote", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("markdownCode", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("markdownFootnote", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("markdownId", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("markdownH1", s:ion8_gui, "", s:ion8_term, "", "", "")
call s:hi("markdownLinkText", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("markdownUrl", s:ion4_gui, "", "NONE", "", "NONE", "")
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

call s:hi("perlPackageDecl", s:ion7_gui, "", s:ion7_term, "", "", "")

call s:hi("phpClasses", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("phpDocTags", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("podVerbatimLine", s:ion4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("rubySymbol", s:ion6_gui, "", s:ion6_term, "", "bold", "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("sassClass", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("sassId", s:ion7_gui, "", s:ion7_term, "", "underline", "")
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

call s:hi("vimAugroup", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("vimMapRhs", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("vimNotation", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:ion7_gui, "", s:ion7_term, "", "", "")
call s:hi("xmlCdataStart", s:ion3_gui, "", s:ion3_term, "", "bold", "")
call s:hi("xmlNamespace", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:ion13_gui, "", s:ion13_term, "", "", "")
call s:hi("ALEErrorSign" , s:ion11_gui, "", s:ion11_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:ion14_gui, "", s:ion14_term, "", "", "")
call s:hi("GitGutterChange", s:ion13_gui, "", s:ion13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:ion11_gui, "", s:ion11_term, "", "", "")
call s:hi("GitGutterDelete", s:ion11_gui, "", s:ion11_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:ion4_gui, s:ion3_gui, "", s:ion3_term, "", "")
call s:hi("jediFat", s:ion8_gui, s:ion3_gui, s:ion8_term, s:ion3_term, "bold,underline", "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:ion7_gui, "", s:ion7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

"+--- Languages ---+
" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:ion8_gui, "", s:ion8_term, "", "italic", "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar
