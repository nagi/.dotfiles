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
plugins=(brew bundler capistrano coffee colorize cp docker git git-flow-avh github node npm osx pip postgres rake ruby rvm tmux vi-mode xcode)

source $ZSH/oh-my-zsh.sh

bindkey "^R" history-incremental-search-backward

# iTerm2 tab color helpers
if [ `uname` = Darwin ]
then
[[ -s ~/.dotfiles/iterm2-helpers.sh ]] && source ~/.dotfiles/iterm2-helpers.sh
fi

# Exports
if [ `uname` = Darwin ]
then
  # Prefer homebrew applications.
  export PATH=/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:/usr/local/sbin:/usr/local/games:/usr/texbin
else
  # Prefer apt / pacman applications.
  export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:/usr/local/bin:/usr/local/sbin:/usr/local/games
  [[ -s $HOME/.rbenv/bin ]] && export PATH="$HOME/.rbenv/bin:$PATH"
  # [[ -s $HOME/.gem/ruby/2.0.0/bin ]] && export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin
  # [[ -s $HOME/.gem/ruby/2.1.0/bin ]] && export PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin
  # [[ -s $HOME/.gem/ruby/2.2.0/bin ]] && export PATH=$PATH:$HOME/.gem/ruby/2.2.0/bin
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

################################################################################
## Debain / Ubuntu / Mint command not found
################################################################################
if [ -f /etc/zsh_command_not_found ]
then
  . /etc/zsh_command_not_found
fi
################################################################################
## aliases
################################################################################

# ls
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"

# rails
alias bi='bundle install'
alias bs='bundle show'
alias bo='bundle open'
alias be='bundle exec'
alias beg='bundle exec guard'
alias bers='bundle exec rails server'
alias berc='bundle exec rails console'
alias ber='bundle exec rake'
alias ber='bundle exec rake'
alias berr='bundle exec rake routes'
alias bert='bundle exec rake --tasks'
alias bersd='bundle exec rails server --debugger'
alias rc='rails console --debugger'
alias rs='rails server --debugger'
alias tld='tail -f log/development.log'
alias tlt='tail -f log/test.log'
alias sr='spring rspec'
alias srr='spring rake routes'

# Navigation
alias cda='cd $HOME/rails/about-corp-finance'
alias cdb='cd $HOME/rails/best100'
alias cdeme='cd $HOME/rails/eme-server'
alias cdp='cd $HOME/rails/programmingfonts'
alias cdi='cd $HOME/iPhone/iPhone-App'
alias cdg='cd $HOME/rails/g4s/give4sure'
alias cdgp='cd $HOME/rails/g4s/plugin'
alias cdm='if [ -d $HOME/rails/mylocalplanet ] ; then ; cd $HOME/rails/mylocalplanet ; else ; cd /srv/rails/mylocalplanet/current ; fi '
alias cdw='if [ -d $HOME/rails/web_app ] ; then ; cd $HOME/rails/web_app ; else ; cd /srv/rails/web_app/current ; fi '

alias cdo='cd $HOME/rails/optimiser'

alias cde='cd $HOME/rails/engage'
alias cdej='cd $HOME/javascript/wps-fuji'
alias cded='cd $HOME/ruby/engage-documentation'

alias cds='cd $HOME/rails/sqhc'
alias cdsd='cd $HOME/ruby/sqhc-documentation'
alias cdsj='cd $HOME/javascript/wps-schedule'

# Misc.
alias pp="ps axuf | pager"
alias sum="xargs | tr ' ' '+' | bc" ## Usage: echo 1 2 3 | sum
# Uses system ctag executable
alias ctagit='ctags -R --exclude=.git --exclude=log --exclude=tmp'
alias ctagall='ctagit . $(bundle list --paths)'
# Uses brewed ctag executable
alias ectagit='/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=tmp'
alias ectagall='ectagit . $(bundle list --paths)'
alias pgd='postgres -D /usr/local/var/postgres'
alias myd='mysql.server start'

# utils
source $HOME/.dotfiles/functions.sh

# Confidential stuff
[[ -s "$HOME/.dotfiles/secrets.sh" ]] && source "$HOME/.dotfiles/secrets.sh"

################################################################################
## rvm
################################################################################
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
################################################################################
## rbenv
################################################################################
which rbenv > /dev/null && eval "$(rbenv init -)"
