if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

alias v='nvim'
alias dc='docker-compose'
alias x='exit'
alias df='cd ~/dotfiles'
alias gf='cd ~/git'

export TERM=xterm-256color-italic
export EDITOR='nvim'

# Quick git status
alias g='git '
alias gs='git status'
alias gaa='git add .'
alias gc='git commit'
alias gp='git push'
alias gP='git pull'
alias gr='git rebase'

# Quick clear
alias c='clear'
alias ll='exa -lah'
alias x='exit'

# Fuck autocorrect in zsh...
unsetopt correct
setopt rm_star_silent

# Highlight stuff with less
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -X -F '
