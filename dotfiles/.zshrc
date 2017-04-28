ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(brew capistrano coffee colorize cp docker git git-flow-avh github lein node npm osx pip postgres rake ruby rvm tmux tmuxinator vi-mode)

source $ZSH/oh-my-zsh.sh

bindkey "^R" history-incremental-search-backward

export PATH=$PATH:$HOME/.dotfiles/bin
export RUBYMINE_HOME=/Applications/Rubymine.app
export BUNDLE_EDITOR="nvim -R"
export EDITOR=nvim
export VISUAL=nvim

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source $HOME/.dotfiles/functions/aliases.sh
source $HOME/.dotfiles/functions/functions.sh
source $HOME/.dotfiles/functions/system-specific.sh
source $HOME/.dotfiles/functions/ruby-managers.sh

# Confidential stuff
[[ -s "$HOME/.dotfiles/functions/secrets.sh" ]] && source "$HOME/.dotfiles/functions/secrets.sh"
