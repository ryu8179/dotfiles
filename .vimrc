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
set number
set tabstop=4
set autoindent
set expandtab
set smartindent
set shiftwidth=4
syntax on
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

source ~/.vim/abbreviate.vim

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

" My Bundles here:
NeoBundle 'scrooloose/syntastic'
NeoBundleFetch 'kurocode25/mdforvim'
NeoBundle 'PDV--phpDocumentor-for-Vim'
" 'PDV--phpDocumentor-for-Vim' {{{
inoremap <C-P> <Esc>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocSingle()<CR>
" }}} 

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

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" vim: foldmethod=marker
