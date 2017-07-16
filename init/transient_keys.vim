" ·· navigate wrapped lines ··· {{{1
" link
map <SID>g_  <Nop>

" initiate
map gj  gj<SID>g_
map gk  gk<SID>g_

" continue
noremap <script> <SID>g_j  gj<SID>g_
noremap <script> <SID>g_k  gk<SID>g_
noremap <script> <SID>g_h   h<SID>g_
noremap <script> <SID>g_l   l<SID>g_
