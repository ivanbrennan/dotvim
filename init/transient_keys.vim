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

" ·· navigate window splits ··· {{{1
" link
map <SID>wn_  <Nop>

" initiate
map <C-W>j  <C-W>j<SID>wn_
map <C-W>k  <C-W>k<SID>wn_
map <C-W>h  <C-W>h<SID>wn_
map <C-W>l  <C-W>l<SID>wn_

" continue
noremap <script> <SID>wn_j  <C-W>j<SID>wn_
noremap <script> <SID>wn_k  <C-W>k<SID>wn_
noremap <script> <SID>wn_h  <C-W>h<SID>wn_
noremap <script> <SID>wn_l  <C-W>l<SID>wn_

" ·· resize window splits ····· {{{1
" link
map <SID>ws_  <Nop>

" initiate
map <C-W>+        <C-W>+<SID>ws_
map <C-W>-        <C-W>-<SID>ws_
map <C-W><lt>  <C-W><lt><SID>ws_
map <C-W>>        <C-W>><SID>ws_

" continue
noremap <script> <SID>ws_+        <C-W>+<SID>ws_
noremap <script> <SID>ws_-        <C-W>-<SID>ws_
noremap <script> <SID>ws_<lt>  <C-W><lt><SID>ws_
noremap <script> <SID>ws_>        <C-W>><SID>ws_
