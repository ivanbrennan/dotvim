" Lateron

" Normal mode
let s:N1  = [ '#ffffff' , '#2e2d2a' , 255 , 235 ]
let s:N2  = [ '#b5dfff' , '#44403a' , 153 , 237 ]
let s:N3  = [ '#ffffff' , '#2e2d2a' , 255 , 235 ]

" Visual mode
let s:V1  = [ '#ffffff' , '#005f87' , 255 , 25  ]
let s:V2  = [ '#b5dfff' , '#44403a' , 153 , 237 ]
let s:V3  = [ '#ffffff' , '#2e2d2a' , 255 , 235 ]

" Insert mode
let s:I1  = [ '#ffffff' , '#63001C' , 255 , 52  ]
let s:I2  = [ '#b5dfff' , '#2e2d2a' , 153 , 235 ]
let s:I3  = [ '#ffffff' , '#44403a' , 255 , 237 ]

" Replace mode
let s:R1  = [ '#ffffff' , '#44403a' , 255 , 237 ]
let s:R2  = [ '#b5dfff' , '#2e2d2a' , 153 , 235 ]
let s:R3  = [ '#ffffff' , '#44403a' , 255 , 237 ]

let s:IA1 = [ '#756E64' , '#2e2d2a' , 242 , 235 ]
let s:IA2 = [ '#2e2d2a' , '#44403a' , 235 , 237 ]
let s:IA3 = [ '#756E64' , '#2e2d2a' , 242 , 235 ]
let s:IA4 = [ '#dddddd' , '#008787' , 253 , 30  ]

let g:airline#themes#lateron#palette = {}

let g:airline#themes#lateron#palette.accents = {
      \ 'red': [ '#63001C' , '' , 52 , '' , '' ] }

let g:airline#themes#lateron#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#lateron#palette.normal_modified = {
      \ 'airline_b' : [  s:IA4[0] , s:N2[1] , s:IA4[2] , s:N2[3] , '' ] }

let g:airline#themes#lateron#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#lateron#palette.insert_modified = {
      \ 'airline_b' : [ s:IA4[0] , s:I2[1] , s:IA4[2] , s:I2[3] , '' ] }

let g:airline#themes#lateron#palette.insert_paste = {
      \ 'airline_a' : [ s:I1[0] , s:I1[1] , s:I1[2] , s:I1[3] , '' ] }

let g:airline#themes#lateron#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#lateron#palette.replace_modified = {
      \ 'airline_b' : [ s:IA4[0] , s:R2[1] , s:IA4[2] , s:R2[3] , '' ] }


let g:airline#themes#lateron#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#lateron#palette.visual_modified = {
      \ 'airline_b' : [ s:IA4[0] , s:V2[1] , s:IA4[2] , s:V2[3] , '' ] }

let g:airline#themes#lateron#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#lateron#palette.inactive_modified = {
      \ 'airline_c'  : [ s:IA4[1], s:N1[1] , s:IA4[3], s:N1[3] ] }

