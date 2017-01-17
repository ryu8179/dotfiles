#!/bin/sh

# 前提:ホームディレクトリで dotfiles を clone しておく
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv $HOME/dotfiles/$f $HOME/$f
done
