" Maintainer: Ivan Brennan <ivan.brennan@gmail.com>

set background=dark

if version > 580
  hi clear
  if exists("syntax_on") | syntax reset | endif
endif

let g:colors_name="ion"

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
  hi CursorLine   ctermbg=235 cterm=none                          gui=None        guibg=#23272e
  hi CursorColumn ctermbg=235 cterm=none                          gui=None        guibg=#23272e

  hi MatchParen   ctermfg=069 ctermbg=237 cterm=reverse                           guifg=#7194ff       guibg=#1c1c1c

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

if version >= 703 " Vim 7.3 specific colors
  hi ColorColumn  ctermbg=235                                     gui=None        guibg=#23272e
  hi CursorLineNr ctermfg=239 ctermbg=234                         gui=None        guifg=#bbbbbb       guibg=#282c34
endif

" syntax highlighting groups
hi Comment    ctermfg=060 ctermbg=234                               gui=None        guifg=#a8a8a8       guibg=#282c34
hi Constant   ctermfg=086 ctermbg=234                               gui=None        guifg=#5fffdf       guibg=#282c34
hi Identifier ctermfg=080 ctermbg=234 cterm=bold                    gui=bold        guifg=#5fdfdf       guibg=#282c34
hi String     ctermfg=074 ctermbg=234                               gui=None        guifg=#98BE65       guibg=#282c34
hi Statement  ctermfg=159 ctermbg=234 cterm=none                    gui=None        guifg=#afffff       guibg=#282c34
hi PreProc    ctermfg=122 ctermbg=234                               gui=None        guifg=#80A0FC       guibg=#282c34
hi Function   ctermfg=121 ctermbg=234 cterm=bold                    gui=bold        guifg=#80A0FC       guibg=#282c34
hi Type       ctermfg=117 ctermbg=234 cterm=bold                    gui=bold        guifg=#87dfff       guibg=#282c34
hi Special    ctermfg=050 ctermbg=234                               gui=None        guifg=#00ffdf       guibg=#282c34
hi Delimiter  ctermfg=153 ctermbg=234                               gui=None        guifg=#afdfff       guibg=#282c34
hi Number     ctermfg=086 ctermbg=234                               gui=None        guifg=#5fffdf       guibg=#282c34
hi Ignore     ctermfg=214 ctermbg=234                               gui=None        guifg=#ffaf00       guibg=#282c34
hi Todo       ctermfg=196 ctermbg=234                               gui=None        guifg=#ff0000       guibg=#282c34
hi Exception  ctermfg=080 ctermbg=234 cterm=bold                    gui=bold        guifg=#5fdfdf       guibg=#282c34

"vim: sw=4
