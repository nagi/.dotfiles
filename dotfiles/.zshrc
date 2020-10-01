function not_in_emacs() {
  if [[ $TERMINFO =~ emacs ]]
  then
    return 1
  else
    return 0
  fi
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if not_in_emacs
then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME="robbyrussell"
fi

ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"

plugins=(
  brew
  capistrano
  coffee
  colorize
  colored-man-pages
  cp
  docker
  git
  git-flow-avh
  github
  lein
  node
  npm
  osx
  pip
  postgres
  rake
  ruby
  rvm
  tmux
  tmuxinator
  vagrant
  vagrant-prompt
  vi-mode
  zsh-autosuggestions
  zsh-completions
)

autoload edit-command-line; zle -N edit-command-line

bindkey "^R" history-incremental-search-backward
bindkey -M vicmd v edit-command-line

source $HOME/.dotfiles/functions/aliases.sh
source $HOME/.dotfiles/functions/functions.sh
source $ZSH/oh-my-zsh.sh

source $HOME/.dotfiles/functions/ruby-managers.sh

if not_in_emacs
then
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi
