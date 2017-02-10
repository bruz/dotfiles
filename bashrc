# ruby version manager
export PATH="$PATH:$HOME/.rvm/bin"

# node version manager
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

# rbenv
[[ -s $HOME/.rbenv/bin/rbenv ]] && eval "$(rbenv init -)"

# bash completion for git things
source ~/.git-scripts/git-completion.bash

brew_available=$(command -v brew >/dev/null 2>&1)
# bash completion package
if [[ "$brew_available" && -f $(brew --prefix)/etc/bash_completion ]]; then
  . $(brew --prefix)/etc/bash_completion
fi

function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# show ruby version and git branch in prompt
PS1="\$(__git_ps1) \W$ "

# like mkdir -p, for touch
touchp() {
  mkdir -p "$(dirname "$1")"
  touch "$1"
}

# like touchp, but open with subl afterward
sublp() {
  touchp "$1"
  subl "$1"
}

# hack to allow remote servers to set the terminal title
ssht() {
  TERM=vt100 ssh "$1"
}

# colors less
export LESS='-R'

# colored grep
export GREP_OPTIONS=--color

# misc. binaries
export PATH=$PATH:${HOME}/bin

# tmux management
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# make Sublime the default editor
export EDITOR='subl -w'

# scala wants more memory
export SBT_OPTS=-XX:MaxPermSize=256m

# More Docker
alias dc='docker-compose'
alias dop='docker-open'

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

# Firefox binary for selenium
export PATH=$PATH:$HOME/Applications/Firefox.app/Contents/MacOS

# Redis helper
redis-del() {
  redis-cli KEYS "$1*" | xargs redis-cli DEL
}

# Go via Homebrew
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Hanami
alias han='hanami'

# Mercurial
alias hgcop='hg status -n | xargs rubocop-select | xargs rubocop'
