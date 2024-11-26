# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh-histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
bindkey "5~" kill-word

path+=~/scripts

export PS1="(%F{red}zsh%f) %n@%m %~ $ "
export PROMPT_EOL_MARK=

alias code=vscodium
alias tty-clock="tty-clock -c"
