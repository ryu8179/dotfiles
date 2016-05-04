"---------------------------
" Start Standard Settings.
"---------------------------
" シンタックスON!
syntax on 

"行番号を表示する
set number
"新しい行のインデントを、現在の行と合わせる
set autoindent
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"タブの代わりに空白文字を挿入する
set expandtab
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
"set tabstop=4
"検索をファイルの先頭へループしない
set nowrapscan
"カーソル行に下線を入れる
set cursorline

set background=dark
"---------------------------
" End Standard Settings.
"---------------------------

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" plugins
NeoBundle 'scrooloose/syntastic'
NeoBundle 'PDV--phpDocumentor-for-Vim'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
"-------------------------
" End Neobundle Settings.
"-------------------------
