#---------------------------------------------------------------------------
# autoload
#---------------------------------------------------------------------------
autoload -Uz compinit
compinit

#---------------------------------------------------------------------------
# zplug
#---------------------------------------------------------------------------
source ~/.zplug/init.zsh

zplug 'zplug/zplug'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'mollifier/anyframe'

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

#---------------------------------------------------------------------------
# zplug 各プラグインの設定
#---------------------------------------------------------------------------

# 'zsh-users/zsh-autosuggestions' {{{
# カラー変更
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'
# }}}

# 'mollifier/anyframe' (peco) 設定 {{{
# コマンドライン履歴から選んで実行する
alias ph='anyframe-widget-execute-history'
# コマンドライン履歴から選んでコマンドラインに挿入する
alias phh='anyframe-widget-put-history'
# }}}

#---------------------------------------------------------------------------
# 標準設定
#---------------------------------------------------------------------------
PROMPT='[%n@%m](%*%) %~ %# '
#RPROMPT='(%*%)'
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Ctrl+w で一つ前のスラッシュ(/)まで削除する
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>' 
# 補完時にメニュー選択モードを利用する
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt IGNORE_EOF
setopt NO_FLOW_CONTROL
setopt NO_BEEP

alias ls='ls -F --color=auto'
alias ll='ls -lhF'
alias la='ls -alhF'
alias vi='vim'
alias view='vim -R'
alias cp='cp -i'
alias du='du -h'
alias df='df -h'
# .tmux.conf で `default-teminal` 設定を行っても Vim カラースキーマが動作がしなかった為
alias tmux='TERM=xterm-256color tmux'
alias pgitset='git config user.name "Ryugo Abe" && git config user.email "abe.ryugo@gmail.com"'

# vim: foldmethod=marker
