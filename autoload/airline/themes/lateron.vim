" Lateron

" Colors ------------------------------------{{{1
" Normal mode -------------------------------{{{2
let s:N1  = [ '#ffffff' , '#2e2d2a' , 255 , 235 ]
let s:N2  = [ '#b5dfff' , '#44403a' , 153 , 237 ]
let s:N3  = [ '#ffffff' , '#2e2d2a' , 255 , 235 ]

" Insert mode -------------------------------{{{2
let s:I1  = [ '#ffffff' , '#63001c' , 255 , 52  ]
let s:I2  = [ '#b5dfff' , '#2e2d2a' , 153 , 235 ]
let s:I3  = [ '#ffffff' , '#44403a' , 255 , 237 ]

" Visual mode -------------------------------{{{2
let s:V1  = [ '#ffffff' , '#005f87' , 255 , 25  ]
let s:V2  = [ '#b5dfff' , '#44403a' , 153 , 237 ]
let s:V3  = [ '#ffffff' , '#2e2d2a' , 255 , 235 ]

" Replace mode ------------------------------{{{2
let s:R1  = [ '#ffffff' , '#44403a' , 255 , 237 ]
let s:R2  = [ '#b5dfff' , '#2e2d2a' , 153 , 235 ]
let s:R3  = [ '#ffffff' , '#44403a' , 255 , 237 ]

" Inactive mode -----------------------------{{{2
let s:IA1 = [ '#756e64' , '#2e2d2a' , 242 , 235 ]
let s:IA2 = [ '#2e2d2a' , '#44403a' , 235 , 237 ]
let s:IA3 = [ '#756e64' , '#2e2d2a' , 242 , 235 ]

" Accents -----------------------------------{{{2
let s:A1  = [ '#dddddd' , 253 ]
let s:A2  = [ '#008787' , 30  ]
let s:A3  = [ '#af0000' , 124 ]


" Palette -----------------------------------{{{1
let g:airline#themes#lateron#palette = {}

" Modes -------------------------------------{{{2
let g:airline#themes#lateron#palette.normal   = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#lateron#palette.insert   = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#lateron#palette.replace  = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#lateron#palette.visual   = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#lateron#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Modified modes ----------------------------{{{2
let g:airline#themes#lateron#palette.normal_modified = {
      \ 'airline_b' : [ s:A1[0] , s:N2[1] , s:A1[1] , s:N2[3] , '' ] }
let g:airline#themes#lateron#palette.insert_modified = {
      \ 'airline_b' : [ s:A1[0] , s:I2[1] , s:A1[1] , s:I2[3] , '' ] }
let g:airline#themes#lateron#palette.insert_paste = {
      \ 'airline_a' : [ s:I1[0] , s:I1[1] , s:I1[2] , s:I1[3] , '' ] }
let g:airline#themes#lateron#palette.replace_modified = {
      \ 'airline_b' : [ s:A1[0] , s:R2[1] , s:A1[1] , s:R2[3] , '' ] }
let g:airline#themes#lateron#palette.visual_modified = {
      \ 'airline_b' : [ s:A1[0] , s:V2[1] , s:A1[1] , s:V2[3] , '' ] }
let g:airline#themes#lateron#palette.inactive_modified = {
      \ 'airline_c'  : [ s:A2[0], s:N1[1] , s:A2[1], s:N1[3] ] }

" Accents -----------------------------------{{{2
let g:airline#themes#lateron#palette.accents = {
      \ 'red': [ s:A3[0], '' , s:A3[1] , '' , '' ] }

