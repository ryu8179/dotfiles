"---------------------------------------------------------------------------
" 標準設定
"---------------------------------------------------------------------------

" autocmd 用Myグループの作成 (名前空間的な認識)
" 参考: https://github.com/vim-jp/reading-vimrc/wiki , :h autocmd
augroup MyAutoGrp
  " 「全ての」MyAutoGrp の自動コマンドを削除する
  autocmd!
augroup END
" *.md ファイル等は filetype=modula2 と判断してしまうので markdown に設定
autocmd MyAutoGrp BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} :set filetype=markdown

set encoding=utf-8
" 2バイト半角対策 ■ 等で表示崩れ対策
set ambiwidth=double
" マウスを無効化
set mouse-=a
" 検索結果をリアルタイムハイライト
set incsearch
" 検索結果のハイライト
set hlsearch
" vimからファイルを開くときにリスト表示
set wildmenu wildmode=list:full
" Insert時に、バックスペースを使用する
set backspace=indent,eol,start
" <C-a>, <C-x> の挙動設定
set nrformats=alpha,hex 

set helplang=ja,en
set number

" コーディング設定
set tabstop=4
set autoindent
set expandtab
set smartindent
set shiftwidth=4
" タブの可視化
set list
set listchars=tab:>.

" 各機能の設定ファイル読み込み
source ~/.vim/abbreviate.vim
source ~/.vim/mappings.vim

"---------------------------------------------------------------------------
" Neovim 設定
"---------------------------------------------------------------------------
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"---------------------------------------------------------------------------
" NeoBundle 設定
"---------------------------------------------------------------------------

" Required: bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/')) " {{{

" NeoBundle に NeoBundle 自身の管理をさせる
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" MySetting 
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim' " {{{
" プレフィックスキー
nnoremap [unite] <Nop>
nmap     <Space>u [unite]
" キーマップ
nnoremap [unite]f :<C-u>Unite<Space>file<CR>
nnoremap [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap [unite]m :<C-u>Unite<Space>file_mru<CR>
"}}}

" :Unite colorscheme -auto-preview によって選択的にプレビュー出来る
NeoBundle 'ujihisa/unite-colorscheme'

" カラースキーマ一覧
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'                   " 中々良い
NeoBundle 'croaker/mustang-vim'
NeoBundle 'mrkn/mrkn256.vim'                 " 良い
NeoBundle 'jpo/vim-railscasts-theme'         " 中々良い
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'sjl/badwolf'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'gosukiwi/vim-atom-dark'

NeoBundle 'kana/vim-submode' "{{{
" 読み込み完了後に call する
let s:bundle = neobundle#get("vim-submode")
function! s:bundle.hooks.on_source(bundle)
  " s>>>, s<<<, s+++, s---, の様にして画面サイズ変更を可能に
  call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
  call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
  call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
  call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
  call submode#map('bufmove', 'n', '', '>', '<C-w>>')
  call submode#map('bufmove', 'n', '', '<', '<C-w><')
  call submode#map('bufmove', 'n', '', '+', '<C-w>+')
  call submode#map('bufmove', 'n', '', '-', '<C-w>-')
endfunction
"}}}

NeoBundle 'rbgrouleff/bclose.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'fatih/vim-go' "{{{
autocmd MyAutoGrp FileType go :highlight goErr cterm=bold ctermfg=214
autocmd MyAutoGrp FileType go :match goErr /\<err\>/
" }}}

" Markdown用
"NeoBundle 'plasticboy/vim-markdown'
NeoBundleFetch 'kurocode25/mdforvim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rcmdnk/vim-markdown'
" rcmdnk/vim-markdown {{{
let g:vim_markdown_folding_diabled = 1
"}}}

" Required:
call neobundle#end() " }}}

" Required:
filetype plugin indent on

" vim起動時に未インストールの bundle が無いかチェックし、
" 有る場合はインストールを促す。
NeoBundleCheck

"---------------------------------------------------------------------------
" 標準設定 (Plugin 読込み後)
"---------------------------------------------------------------------------
colorscheme mrkn256
syntax on

" vim: foldmethod=marker
