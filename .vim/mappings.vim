"---------------------------------------------------------------------------
" キーマッピング
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" ノーマルモード
"---------------------------------------------------------------------------
nnoremap : ;
nnoremap ; :
nnoremap <C-c><C-c> <C-c>
nnoremap <C-c>e :edit $HOME/.vimrc<CR>
nnoremap <C-c>r :source $HOME/.vimrc<CR>
nnoremap <Space>w :w<CR>
nnoremap <F2> :noh<CR>

" Window 操作. 参考 http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
nnoremap ss <C-w>s
nnoremap sv <C-w>v
nnoremap sc <C-w>c
"
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
"
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

" 画面スクロール１行
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" 検索時 ハイライト箇所を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" 行頭、行末移動
nnoremap <Space>h ^
nnoremap <Space>l $

" 空行挿入
nnoremap <Space>j o<ESC>


"---------------------------------------------------------------------------
" 挿入モード
"---------------------------------------------------------------------------

" ESC ショートカット
inoremap jj <ESC>
inoremap j<Space> j


"---------------------------------------------------------------------------
" コマンドラインモード
"---------------------------------------------------------------------------

" カーソル移動をシェルの様に
cnoremap <C-e> <End>
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>


" vim: foldmethod=marker
