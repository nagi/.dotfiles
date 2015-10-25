# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)

# https://github.com/chef/chef-dk/issues/256
UNBUNDLED_COMMANDS=(kitchen knife)

plugins=(brew bundler capistrano coffee colorize cp docker git git-flow-avh github node npm osx pip postgres rake ruby rvm tmux vi-mode)

source $ZSH/oh-my-zsh.sh

bindkey "^R" history-incremental-search-backward

# Exports
if [ `uname` = Darwin ]
then
  # load iTerm2 tab color helpers
  [[ -s ~/.dotfiles/functions/iterm2-helpers.sh ]] && source ~/.dotfiles/functions/iterm2-helpers.sh
  # Prefer homebrew applications.
  export PATH=/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:/usr/local/sbin:/usr/local/games:/usr/texbin
  # Put vagrant boxes on pendrive
  export VAGRANT_HOME='/Volumes/Quicker/vagrant.d'
else
  # Prefer apt / pacman applications.
  export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:/usr/local/bin:/usr/local/sbin:/usr/local/games
  [[ -x $HOME/.rbenv/bin ]] && export PATH="$HOME/.rbenv/bin:$PATH"
  # Arch system ruby paths
  [[ -x $HOME/.gem/ruby/2.0.0/bin ]] && export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin
  [[ -x $HOME/.gem/ruby/2.1.0/bin ]] && export PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin
  [[ -x $HOME/.gem/ruby/2.2.0/bin ]] && export PATH=$PATH:$HOME/.gem/ruby/2.2.0/bin
  [[ -x $HOME/.gem/ruby/2.3.0/bin ]] && export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin
  # Run ssh-agent: https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

ADT=/opt/adt-bundle-linux-x86_64-20130219
export PATH=$PATH:$ADT/eclipse
export PATH=$PATH:$ADT/sdk/tools
export PATH=$PATH:$ADT/sdk/platform-tools

export EDITOR=vim
export BUNDLE_EDITOR=view
export RUBYMINE_HOME=/Applications/Rubymine.app

export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Debain / Ubuntu / Mint command not found
if [ -f /etc/zsh_command_not_found ]
then
  . /etc/zsh_command_not_found
fi

source $HOME/.dotfiles/functions/aliases.sh
source $HOME/.dotfiles/functions/functions.sh

# Confidential stuff
[[ -s "$HOME/.dotfiles/functions/secrets.sh" ]] && source "$HOME/.dotfiles/functions/secrets.sh"

# rvm
[[ -x "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -x "$HOME/.rvm/scripts/rvm" ]] && PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# rbenv
which rbenv > /dev/null && eval "$(rbenv init -)"

# chruby
[[ -s /usr/local/share/chruby/chruby.sh ]] && source /usr/local/share/chruby/chruby.sh

# Confidential stuff
[[ -s "$HOME/.dotfiles/functions/system-specific.sh" ]] && source "$HOME/.dotfiles/functions/system-specific.sh"
