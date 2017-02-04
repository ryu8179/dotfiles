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

" ファイルエンコーディング, 文字コードをステータス行に表示
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese#TOC--6
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P

" マウスを無効化
set mouse-=a
" vimからファイルを開くときにリスト表示
set wildmenu wildmode=list:full
" Insert時に、バックスペースを使用する
set backspace=indent,eol,start
" <C-a>, <C-x> の挙動設定
set nrformats=hex

set helplang=ja,en
set number
set breakindent
set incsearch
set hlsearch

" コーディング設定
set tabstop=4
set autoindent
set expandtab
set smartindent
set shiftwidth=4
" タブ, 行末スペースの可視化
set list listchars=tab:>.,trail:_

" 各機能の設定ファイル読み込み
source ~/.vim/abbreviate.vim
source ~/.vim/mappings.vim

"---------------------------------------------------------------------------
" Neovim 設定
"---------------------------------------------------------------------------
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " dein.nvim 用 python3 へのパス追加
  let g:python3_host_prog = expand('~/.pyenv/shims/python')
endif

"---------------------------------------------------------------------------
" NeoBundle 設定
"---------------------------------------------------------------------------

" Required: bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/')) " {{{

" Required: NeoBundle に NeoBundle 自身の管理をさせる
NeoBundleFetch 'Shougo/neobundle.vim'

" 'denite.nvim' {{{
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/denite.nvim'
" 読み込み完了後に call する
let s:denite = neobundle#get("denite.nvim")
function! s:denite.hooks.on_source(denite)
    " key mapping
    nnoremap [denite] <Nop>
    nmap     <Space>u [denite]
    nnoremap [denite]f :<C-u>Denite<Space>file_rec<CR>
    nnoremap [denite]b :<C-u>Denite<Space>buffer<CR>
    nnoremap [denite]m :<C-u>Denite<Space>file_mru<CR>

    call denite#custom#map('insert', '<C-a>', '<Home>')
    call denite#custom#map('insert', '<C-e>', '<End>')
    call denite#custom#map('insert', '<C-f>', '<Right>')
    call denite#custom#map('insert', '<C-b>', '<Left>')
    call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
    call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
endfunction
" }}}

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

" Window サイズ変更を便利に
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
NeoBundle 'tpope/vim-commentary'

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
