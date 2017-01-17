# The following lines were added by compinstall
autoload -Uz compinit
compinit
# End of lines added by compinstall

#---------------------------------------------------------------------------
# zplug
#---------------------------------------------------------------------------
source ~/.zplug/init.zsh

zplug "zplug/zplug"
zplug "mollifier/anyframe"
# "mollifier/anyframe" (peco) 設定 {{{
# コマンドライン履歴から選んで実行する
alias ph='anyframe-widget-execute-history'
# コマンドライン履歴から選んでコマンドラインに挿入する
alias phh='anyframe-widget-put-history'
# }}}

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

#---------------------------------------------------------------------------
# 標準設定
#---------------------------------------------------------------------------
PROMPT="[%n@%m](%*%) %~ %# "
#RPROMPT="(%*%)"
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Ctrl+w で一つ前のスラッシュ(/)まで削除する
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>' 
# 補完時にメニュー選択モードを利用する
zstyle ':completion:*:default' menu select=2
# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt IGNORE_EOF
setopt NO_FLOW_CONTROL
setopt NO_BEEP

alias ll='ls -lh'
alias la='ls -alh'
alias vi='vim'
alias view='vim -R'
alias cp='cp -i'
alias du='du -h'
alias df='df -h'

# plugin
[[ -f $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vim: foldmethod=marker
