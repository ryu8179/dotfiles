# The following lines were added by compinstall
autoload -Uz compinit
compinit
# End of lines added by compinstall

# private setting
PROMPT="[%n@%m](%*%) %~ %# "
#RPROMPT="(%*%)"
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

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

bindkey '^r' history_incremental-pattern-search-backward
bindkey '^s' history_incremental-pattern-search-forward

alias ll='ls -lh'
alias la='ls -alh'
alias view='vim -R'
alias cp='cp -i'

# plugin
[[ -f $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
