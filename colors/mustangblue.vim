" Maintainer:	Henrique C. Alves (hcarvalhoalves@gmail.com)
" Version:      1.0
" Last Change:	September 25 2008

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mustangblue"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#2d2d2d ctermbg=236
  hi CursorColumn guibg=#2d2d2d ctermbg=236
  hi MatchParen guifg=#d0ffc0 guibg=#2f2f2f gui=bold ctermfg=157 ctermbg=237 cterm=bold
  hi Pmenu 		guifg=#ffffff guibg=#444444 ctermfg=255 ctermbg=238
  hi PmenuSel 	guifg=#000000 guibg=#b1d631 ctermfg=0 ctermbg=148
endif

" General colors
hi Cursor 		guifg=NONE    guibg=#626262 gui=none ctermbg=241
hi CursorLineNr guifg=#b1d631 guibg=#171717 gui=bold ctermfg=154 ctermbg=233
hi Normal guifg=#F9F9FF guibg=#0E101F guisp=#0E101F gui=NONE ctermfg=189 ctermbg=234 cterm=NONE
"hi Normal 		guifg=#e2e2e5 guibg=#202020 gui=none ctermfg=253 ctermbg=234
hi NonText 		guifg=#808080 guibg=#303030 gui=none ctermfg=244 ctermbg=235
hi LineNr 		guifg=#808080 guibg=#0F0F0F gui=none ctermfg=244 ctermbg=233
"hi LineNr 		guifg=#808080 guibg=#000000 gui=none ctermfg=244 ctermbg=232
hi StatusLine 	guifg=#d3d3d5 guibg=#444444 gui=underline ctermfg=253 ctermbg=238 cterm=underline
hi StatusLineNC guifg=#939395 guibg=#242424 gui=none ctermfg=246 ctermbg=235
hi VertSplit 	guifg=#444444 guibg=#242424 gui=none ctermfg=238 ctermbg=235
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none ctermbg=4 ctermfg=248
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold ctermfg=254 cterm=bold
hi Visual		guifg=#faf4c6 guibg=#3c414c gui=none ctermfg=254 ctermbg=4
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none ctermfg=244 ctermbg=236

" Syntax highlighting
hi Comment 		guifg=#808080 gui=italic ctermfg=244
hi Todo 		guifg=#8f8f8f gui=italic ctermfg=245
hi Boolean      guifg=#b1d631 gui=none ctermfg=148
hi String 		guifg=#b1d631 gui=italic ctermfg=148
hi Identifier 	guifg=#b1d631 gui=none ctermfg=148
hi Function 	guifg=#ffffff gui=bold ctermfg=255
hi Type 		guifg=#7e8aa2 gui=none ctermfg=103
hi Statement 	guifg=#7e8aa2 gui=none ctermfg=103
hi Keyword		guifg=#C98C30 gui=none ctermfg=214
hi Constant 	guifg=#C98C30 gui=none  ctermfg=214
hi Number		guifg=#C98C30 gui=none ctermfg=214
hi Special		guifg=#C98C30 gui=none ctermfg=214
hi PreProc 		guifg=#faf4c6 gui=none ctermfg=230
hi Todo         guifg=#000000 guibg=#e6ea50 gui=italic

" Code-specific colors
hi pythonOperator guifg=#7e8aa2 gui=none ctermfg=103
hi rubyString 		guifg=#b1d631 gui=italic ctermfg=148

