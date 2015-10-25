ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(brew capistrano coffee colorize cp docker git git-flow-avh github node npm osx pip postgres rake ruby rvm tmux vi-mode)

source $ZSH/oh-my-zsh.sh

bindkey "^R" history-incremental-search-backward

export RUBYMINE_HOME=/Applications/Rubymine.app
export BUNDLE_EDITOR=view
export EDITOR=vim
export VISUAL=vim

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source $HOME/.dotfiles/functions/aliases.sh
source $HOME/.dotfiles/functions/functions.sh
source $HOME/.dotfiles/functions/ruby-managers.sh
source $HOME/.dotfiles/functions/system-specific.sh

# Confidential stuff
[[ -s "$HOME/.dotfiles/functions/secrets.sh" ]] && source "$HOME/.dotfiles/functions/secrets.sh"
