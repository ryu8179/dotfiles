"---------------------------------------------------------------------------
" ~/.vim/ftplugin/php.vim
"---------------------------------------------------------------------------

" 'PDV--phpDocumentor-for-Vim' {{{
inoremap <C-P> <Esc>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocSingle()<CR>
" }}}
