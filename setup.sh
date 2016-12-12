#!/bin/sh

# 前提:ホームディレクトリで dotfiles を clone しておく

DOT_FILES=(
.tmux.conf
.vim
.vimrc
.zsh
.zshrc
)

for file in ${DOT_FILES[@]}; do
    echo $file
    ln -sf $HOME/dotfiles/$file $HOME/$file
done
