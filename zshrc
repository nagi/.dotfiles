# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
#  Themes with time since last commit...
# ./wedisagree.zsh-theme
# ./Soliah.zsh-theme
# ./dogenpunk.zsh-theme
# ./smt.zsh-theme
#
ZSH_THEME="wedisagree"

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
plugins=(git git-flow ruby rails3 rvm vi-mode)

source $ZSH/oh-my-zsh.sh

# Exports
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/home/nagi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/android-sdk-linux_x86/tools:/opt/android-sdk-linux_x86/platform-tools:/home/nagi/.rvm/bin:/usr/local/zend/bin
export EDITOR=vim
export BUNDLE_EDITOR=view

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
# alias ls="ls --color=auto"
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"

# grep
# alias grep='grep --color=auto'

# rails
alias be='bundle exec'
alias beg='bundle exec guard'
alias bers='bundle exec rails server'
alias berc='bundle exec rails console'
alias berk='bundle exec rake'
alias bersd='bundle exec rails server --debugger'
alias rc='rails console --debugger'
alias rs='rails server --debugger'
alias tld='tail --follow log/development.log'
alias tlt='tail --follow log/test.log'

# navigation
alias cdb='cd $HOME/rails/best100'
alias cdp='cd $HOME/rails/programmingfonts'
alias cdm='cd $HOME/rails/mylocalplanet'
alias cdr='cd $HOME/rails/RoomPortfolio'
alias cdw='cd $HOME/rails/web_app'

################################################################################
## rvm
################################################################################
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
