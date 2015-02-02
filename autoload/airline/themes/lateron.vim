" Lateron

" Normal mode
let s:N1 = [ '#ffffff' , '#2e2d2a' , 255 , 235 ]
let s:N2 = [ '#b5dfff' , '#44403a' , 153 , 237 ]
let s:N3 = [ '#ffffff' , '#2e2d2a' , 255 , 235 ]
let s:N4 = [ '#2e2d2a' ,             235       ]

" Insert mode
let s:I1 = [ '#ffffff' , '#63001C' , 255 , 52  ]
let s:I2 = [ '#b5dfff' , '#2e2d2a' , 153 , 235 ]
let s:I3 = [ '#ffffff' , '#44403a' , 255 , 237 ]

" Visual mode
let s:V1 = [ '#ffffff' , '#005F87' , 255 , 24  ]
let s:V2 = [ '#b5dfff' , '#44403a' , 153 , 237 ]
let s:V3 = [ '#ffffff' , '#2e2d2a' , 255 , 235 ]
let s:V4 = [ '#dddddd' ,             253       ]

" Replace mode
let s:R1 = [ '#ffffff' , '#44403a' , 255 , 237 ]
let s:R2 = [ '#b5dfff' , '#2e2d2a' , 153 , 235 ]
let s:R3 = [ '#ffffff' , '#44403a' , 255 , 237 ]

" Paste mode
let s:PA = [ '#af0000' , 52 ]

let s:IA = [ s:N2[1] , s:N3[1] , s:N2[3], s:N3[3] , '' ]


let g:airline#themes#lateron#palette = {}

let g:airline#themes#lateron#palette.accents = {
      \ 'red': [ '#63001C' , '' , 52 , '' , '' ]
      \ }

let g:airline#themes#lateron#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#lateron#palette.normal_modified = {
      \ 'airline_b' : [  s:V4[0] , s:N2[1] , s:V4[1] , s:N2[3] , '' ] }


let g:airline#themes#lateron#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#lateron#palette.insert_modified = {
      \ 'airline_b' : [ s:V4[0] , s:I2[1] , s:V4[1] , s:I2[3] , '' ] }

let g:airline#themes#lateron#palette.insert_paste = {
      \ 'airline_a' : [ s:I1[0] , s:I1[1] , s:I1[2] , s:I1[3] , '' ] }


let g:airline#themes#lateron#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)


let g:airline#themes#lateron#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#lateron#palette.visual_modified = {
      \ 'airline_c' : [ s:V3[0] , s:V4[0] , s:V3[2] , s:V4[1] , '' ] }


let g:airline#themes#lateron#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#lateron#palette.inactive_modified = {
      \ 'airline_c' : [ s:V1[1] , ''      , s:V1[3] , ''      , '' ] }

" Reference to Laederon
" Normal mode
" let s:N1 = [ '#1a1a18' , '#ffffff' , 232 , 255 ] " blackestgravel & snow
" let s:N2 = [ '#ffffff' , '#44403a' , 255, 238 ] " snow & deepgravel
" let s:N3 = [ '#90a680' , '#2e2d2a' , 64, 235 ] " dilutedpaint & darkgravel
" let s:N4 = [ '#777470' , 240 ] " gravel

" " Insert mode
" let s:I1 = [ '#1a1a18' , '#1693a5' , 232 , 62 ] " blackestgravel & crystallake
" let s:I2 = [ '#515744' , '#44403a' , 101 , 238 ] " lichen & deepgravel
" let s:I3 = [ '#1693a5' , '#2e2d2a' , 39 , 235 ] " crystallake & darkgravel

" " Visual mode
" let s:V1 = [ '#1a1a18' , '#ab3e5d' , 232 , 161 ] " blackestgravel & raspberry
" let s:V2 = [ '#000000' , '#908571' , 16 , 252 ] " coal & winterterrain
" let s:V3 = [ '#ab3e5d' , '#8c7f77' , 161 , 245 ] " raspberry & wetcoldterrain
" let s:V4 = [ '#515744' , 101 ] " lichen

" " Replace mode
" let s:RE = [ '#233e09' , 22 ] " oakleaf

" " Paste mode
" let s:PA = [ '#ab3e5d' , 161 ] " raspberry
