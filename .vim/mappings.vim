"---------------------------------------------------------------------------
" キーマッピング
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" ノーマルモード
"---------------------------------------------------------------------------

" 画面スクロール１行
nnoremap <C-j> <C-e>
nnoremap <C-j> <C-y>

" 行頭、行末移動
nnoremap <Space>h ^
nnoremap <Space>l $

" 空行挿入
nnoremap <Space>j o<ESC>

"---------------------------------------------------------------------------
" 挿入モード
"---------------------------------------------------------------------------
" ESC ショートカット {{{
inoremap jj <ESC>
inoremap j<Space> j
"}}}

" vim: foldmethod=marker
