"---------------------------------------------------------------------------
" 標準設定
"---------------------------------------------------------------------------

" 文字コード設定
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set encoding=utf-8
" *.md ファイルは modula2 ファイルと判断してしまうので、 markdown に設定
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} :set filetype=markdown
" 2バイト半角対策 ■ 等で表示崩れ対策
set ambiwidth=double
set helplang=ja,en
set number
set tabstop=4
set autoindent
set expandtab
set smartindent
set shiftwidth=4
syntax on
" 検索結果をリアルタイムハイライト
set incsearch
" 検索結果のハイライト
set hlsearch
" vimからファイルを開くときにリスト表示
set wildmenu wildmode=list:full
" タブの可視化
set list
set listchars=tab:>.
" Insert時に、バックスペースを使用する
set backspace=indent,eol,start
" CTRL-a, CTRL-x 使用時の認識設定
set nrformats=alpha,hex

" 各機能の設定ファイル読み込み
source ~/.vim/abbreviate.vim
source ~/.vim/mappings.vim

"---------------------------------------------------------------------------
" NeoBundle 設定
"---------------------------------------------------------------------------

" Required: bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle に NeoBundle 自身の管理をさせる
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" 私の設定はここから:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'Shougo/unite.vim' {{{
" プレフィックスキー
nnoremap [unite] <Nop>
nmap    <Space>u [unite]
" キーマップ
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
"}}}

NeoBundle 'vim-jp/vimdoc-ja'

NeoBundle 'scrooloose/syntastic'

NeoBundleFetch 'kurocode25/mdforvim'

NeoBundle 'PDV--phpDocumentor-for-Vim'

NeoBundle 'fatih/vim-go'
"NeoBundle 'fatih/vim-go' {{{
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
" }}}

NeoBundle 'rbgrouleff/bclose.vim'

" Markdown用
"NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rcmdnk/vim-markdown'
" rcmdnk/vim-markdown {{{
let g:vim_markdown_folding_diabled = 1
"}}}

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" vim起動時に未インストールの bundle が無いかチェックし、
" 有る場合はインストールを促す。
NeoBundleCheck

" vim: foldmethod=marker
