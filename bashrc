# node version manager
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

# bash completion for git things
source ~/.git-scripts/git-completion.bash

function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# show ruby version and git branch in prompt
PS1="\$(~/.rvm/bin/rvm-prompt)\$(__git_ps1) \W$ "

# like mkdir -p, for touch
touchp() {
  mkdir -p "$(dirname "$1")"
  touch "$1"
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

# Ansible
export PATH=$HOME/code/ansible/bin:$HOME/code/ansible-repo/scripts:/usr/local/bin:/usr/local/share/python:$PATH
export PYTHONPATH=$HOME/code/ansible/lib:
alias ash='a-ssh'

# make Sublime the default editor
export EDITOR='subl -w'

# scala wants more memory
export SBT_OPTS=-XX:MaxPermSize=256m

# load/unload easytether module - having it loaded prevents adb from working
alias tetherload='sudo kextload /System/Library/Extensions/EasyTetherUSBEthernet.kext'
alias tetherunload='sudo kextunload /System/Library/Extensions/EasyTetherUSBEthernet.kext'

# Set the environment variable for the docker daemon
export DOCKER_HOST=tcp://localhost:2375
