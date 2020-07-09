ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"

plugins=( brew capistrano coffee colorize cp docker git git-flow-avh github lein node npm osx pip postgres rake ruby rvm tmux tmuxinator vagrant vagrant-prompt vi-mode zsh-autosuggestions zsh-completions)

autoload edit-command-line; zle -N edit-command-line

bindkey "^R" history-incremental-search-backward
bindkey -M vicmd v edit-command-line

source $HOME/.dotfiles/functions/aliases.sh
source $HOME/.dotfiles/functions/functions.sh
source $ZSH/oh-my-zsh.sh

source $HOME/.dotfiles/functions/ruby-managers.sh
