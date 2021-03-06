" ion.vim ۰ Vim color scheme
" Author:  Ivan Brennan (ivan.brennan@gmail.com)
" Version: 0.1

" Initialize ۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰{{{1
hi clear
syntax reset
let s:cached_background = &background
let g:colors_name="ion"

" Utility Function ۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰{{{2
func! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endf

" Palette ۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰{{{2
let s:white  = { "gui": "#ffffff", "cterm": "231" }
let s:black  = { "gui": "#121212", "cterm": "233" }

let s:owhite = { "gui": "#fcfcfc", "cterm": "231" }
let s:grey_7 = { "gui": "#f9f9f9", "cterm": "255" }
let s:grey_6 = { "gui": "#eeeeee", "cterm": "255" }
let s:grey_5 = { "gui": "#bbbbbb", "cterm": "253" }
let s:grey_4 = { "gui": "#b2b2b2", "cterm": "249" }
let s:grey_3 = { "gui": "#949494", "cterm": "246" }
let s:grey_2 = { "gui": "#444444", "cterm": "238" }
let s:grey_1 = { "gui": "#23272e", "cterm": "235" }
let s:grey_0 = { "gui": "#282c34", "cterm": "234" }

let s:grey_x = { "gui": "#e7e7e7", "cterm": "253" }
let s:grey_y = { "gui": "#c7c7c7", "cterm": "253" }
let s:grey_z = { "gui": "#f2f2f2", "cterm": "253" }
let s:nice_grey = { "gui": "#393E53", "cterm": "253" }
let s:slate     = { "gui": "#666666", "cterm": "253" }
let s:purpcoal  = { "gui": "#354668", "cterm": "253" }
let s:paper     = { "gui": "#f5f5f5", "cterm": "253" }

let s:solar  = { "gui": "#ffffdf", "cterm": "230" }
let s:yellow = { "gui": "#ffffaf", "cterm": "229" }
let s:pink   = { "gui": "#ffafaf", "cterm": "217" }
let s:orange = { "gui": "#ff5f00", "cterm": "202" }
let s:red    = { "gui": "#870000", "cterm": "88"  }
let s:maroon = { "gui": "#5f0000", "cterm": "52"  }

let s:blue   = { "gui": "#005f87", "cterm": "24"  }
let s:indigo = { "gui": "#00005f", "cterm": "17"  }
let s:purple = { "gui": "#5f5f87", "cterm": "60"  }
let s:visip  = { "gui": "#e7e9f3", "cterm": "195" }

let s:aqua   = { "gui": "#dfffff", "cterm": "195" }
let s:spring = { "gui": "#afffaf", "cterm": "157" }
let s:green  = { "gui": "#005f00", "cterm": "22"  }

" Highlights ۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰{{{1
call s:h("CursorLine",       { "bg": s:grey_1 })
call s:h("CursorLineNr",     { "fg": s:grey_5, "bg": s:grey_0 })
call s:h("MatchParen",       { "bg": s:purple })
" hi MatchParen ctermfg=069 ctermbg=237 cterm=reverse guifg=#7194ff guibg=#1c1c1c
" call s:h("Pmenu",            { "bg": s:grey_6 })
" call s:h("PmenuThumb",       { "bg": s:black })
" call s:h("PmenuSBar",        { "bg": s:grey_4 })
" call s:h("PmenuSel",         { "bg": s:aqua })
" call s:h("ColorColumn",      { "bg": s:paper })
" call s:h("SpellBad",         { "sp": s:orange, "gui": "undercurl" })
" call s:h("SpellCap",         { "sp": s:blue, "gui": "undercurl" })
" call s:h("SpellRare",        { "sp": s:green, "gui": "undercurl" })
" call s:h("SpellLocal",       { "sp": s:maroon, "gui": "undercurl" })
" hi! link CursorColumn	CursorLine

  hi ColorColumn  ctermbg=235                                     gui=None        guibg=#23272e

hi Normal       ctermfg=250 ctermbg=234                             gui=None        guifg=#bcbcbc       guibg=#282c34
hi LineNr       ctermfg=239 ctermbg=234                             gui=None        guifg=#4e4e4e       guibg=#282c34
hi NonText      ctermfg=234 ctermbg=234                             gui=None        guifg=#1c1c1c       guibg=#1c1c1c

hi VertSplit    ctermfg=237 ctermbg=235 cterm=none                  gui=None        guifg=#3a3a3a       guibg=#282c34
hi StatusLine   ctermfg=249 ctermbg=235 cterm=none                  gui=None        guifg=#b2b2b2       guibg=#23272e
hi StatusLineNC ctermfg=243 ctermbg=235 cterm=none                  gui=None        guifg=#767676       guibg=#23272e

hi DiffDelete   ctermfg=234 ctermbg=233                             gui=None        guifg=#1c1c1c       guibg=#121212
hi DiffAdd      ctermbg=236                                         gui=None        guibg=#303030
hi DiffChange   ctermbg=235                                         gui=None        guibg=#23272e
hi DiffText     ctermfg=161 ctermbg=234 cterm=underline             gui=underline   guifg=#df005f       guibg=#282c34

hi Cursor       ctermfg=234 ctermbg=250                             gui=None        guifg=#1c1c1c       guibg=#bcbcbc

hi Visual                   ctermbg=236                             gui=None                            guibg=#3f3f3f

hi Folded       ctermfg=244 ctermbg=235                             gui=None        guifg=#808080       guibg=#23272e
hi FoldColumn   ctermfg=244 ctermbg=234                             gui=None        guifg=#808080       guibg=#282c34

hi IncSearch    ctermfg=17  ctermbg=190 cterm=underline             gui=underline   guifg=#00005f       guibg=#e4e4e4
hi Search       ctermfg=17  ctermbg=12  cterm=none                  gui=None        guifg=#00005f       guibg=#e4e4e4

hi ModeMsg      ctermfg=117 ctermbg=234 cterm=bold                  gui=bold        guifg=#87dfff       guibg=#282c34
hi MoreMsg      ctermfg=122 ctermbg=234 cterm=none                  gui=None        guifg=#87ffdf       guibg=#282c34
hi Question     ctermfg=122 ctermbg=234 cterm=bold                  gui=bold        guifg=#87ffdf       guibg=#282c34
hi WarningMsg   ctermfg=122 ctermbg=234 cterm=none                  gui=None        guifg=#87ffdf       guibg=#282c34
hi ErrorMsg     ctermfg=255 ctermbg=160 cterm=none                  gui=None        guifg=#eeeeee       guibg=#df0000
hi Error        ctermfg=196 ctermbg=234 cterm=none                  gui=None        guifg=#ff0000       guibg=#282c34

hi SpecialKey   ctermfg=237 ctermbg=234                             gui=None        guifg=#ffaf00       guibg=#282c34
hi Title        ctermfg=075 ctermbg=234 cterm=bold                  gui=bold        guifg=#5fafff       guibg=#282c34
hi Directory    ctermfg=117 ctermbg=234 cterm=bold                  gui=bold        guifg=#87dfff       guibg=#282c34

hi SignColumn   ctermfg=214 ctermbg=235                             gui=None        guifg=#ffaf00       guibg=#23272e

hi WildMenu     ctermfg=075 ctermbg=235 cterm=bold                  gui=bold        guifg=#5fafff       guibg=#23272e

if version >= 700 " Vim 7.x specific colors
  hi CursorColumn ctermbg=235 cterm=none                          gui=None        guibg=#23272e


  hi Tabline      ctermfg=245 ctermbg=235 cterm=underline         gui=underline   guifg=#8a8a8a       guibg=#23272e
  hi TablineSel   ctermfg=250 ctermbg=234 cterm=bold              gui=bold        guifg=#bcbcbc       guibg=#282c34
  hi TablineFill  ctermfg=250 ctermbg=237 cterm=underline         gui=underline   guifg=#bcbcbc       guibg=#3a3a3a

  hi Pmenu        ctermfg=250 ctermbg=235 cterm=none              gui=None        guifg=#bcbcbc       guibg=#23272e
  hi PmenuSel     ctermfg=117 ctermbg=234 cterm=underline         gui=underline   guifg=#87dfff       guibg=#1c1c1c
  hi PmenuSbar    ctermfg=116 ctermbg=234 cterm=none              gui=None        guifg=#87dfdf       guibg=#1c1c1c
  hi PmenuThumb   ctermfg=116 ctermbg=116 cterm=none              gui=None        guifg=#87dfdf       guibg=#87dfdf

  hi SpellBad     ctermfg=198 ctermbg=234 cterm=underline         gui=underline   guifg=#ff0087       guibg=#282c34
  hi SpellCap     ctermfg=198 ctermbg=234 cterm=none              gui=None        guifg=#ff0087       guibg=#282c34
  hi SpellRare    ctermfg=198 ctermbg=234 cterm=none              gui=None        guifg=#ff0087       guibg=#282c34
  hi SpellLocal   ctermfg=198 ctermbg=234 cterm=none              gui=None        guifg=#ff0087       guibg=#282c34
endif

" syntax highlighting groups
hi Comment    ctermfg=060 ctermbg=234                               gui=None        guifg=#a8a8a8       guibg=#282c34
hi Constant   ctermfg=086 ctermbg=234                               gui=None        guifg=#5fffdf       guibg=#282c34
hi Identifier ctermfg=080 ctermbg=234                               gui=None        guifg=#5fdfdf       guibg=#282c34
hi String     ctermfg=074 ctermbg=234                               gui=None        guifg=#98BE65       guibg=#282c34
hi Statement  ctermfg=159 ctermbg=234 cterm=none                    gui=None        guifg=#afffff       guibg=#282c34
hi PreProc    ctermfg=122 ctermbg=234                               gui=None        guifg=#80A0FC       guibg=#282c34
hi Function   ctermfg=121 ctermbg=234                               gui=None        guifg=#80A0FC       guibg=#282c34
hi Type       ctermfg=117 ctermbg=234                               gui=None        guifg=#87dfff       guibg=#282c34
hi Special    ctermfg=050 ctermbg=234                               gui=None        guifg=#00ffdf       guibg=#282c34
hi Delimiter  ctermfg=153 ctermbg=234                               gui=None        guifg=#afdfff       guibg=#282c34
hi Number     ctermfg=086 ctermbg=234                               gui=None        guifg=#5fffdf       guibg=#282c34
hi Ignore     ctermfg=214 ctermbg=234                               gui=None        guifg=#ffaf00       guibg=#282c34
hi Todo       ctermfg=196 ctermbg=234                               gui=None        guifg=#ff0000       guibg=#282c34
hi Exception  ctermfg=080 ctermbg=234 cterm=bold                    gui=bold        guifg=#5fdfdf       guibg=#282c34

" Cleanup ۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰۰{{{1
execute "set background=" . s:cached_background

" vim: fdm=marker:sw=2:sts=2:et
