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
plugins=(history-substring-search git brew bundler capistrano coffee colorize github github ruby rails rake rvm vi-mode tmux)

source $ZSH/oh-my-zsh.sh

bindkey "^R" history-incremental-search-backward

#history-substring-search bindings
#bind UP and DOWN arrow keys
#zmodload zsh/terminfo
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# iTerm2 tab color helpers
if [ `uname`=Darwin ]
then
[[ -s ~/.dotfiles/iterm2-helpers.sh ]] && source ~/.dotfiles/iterm2-helpers.sh
fi

# Exports
if [ `uname`=Darwin ]
then
  # Prefer homebrew applications.
  export PATH=/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:/usr/local/sbin:/usr/local/games:/usr/texbin
else
  # Prefer apt / pacman applications.
  export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:/usr/local/bin:/usr/local/sbin:/usr/local/games
fi
ADT=/opt/adt-bundle-linux-x86_64-20130219
export PATH=$PATH:$ADT/eclipse
export PATH=$PATH:$ADT/sdk/tools
export PATH=$PATH:$ADT/sdk/platform-tools

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
alias ber='bundle exec rake'
alias ber='bundle exec rake'
alias berr='bundle exec rake routes'
alias bert='bundle exec rake --tasks'
alias bersd='bundle exec rails server --debugger'
alias rc='rails console --debugger'
alias rs='rails server --debugger'
alias tld='tail --follow log/development.log'
alias tlt='tail --follow log/test.log'

# navigation
alias cda='cd $HOME/rails/aboutcorpfin'
alias cdb='cd $HOME/rails/best100'
alias cde='cd $HOME/rails/eme-server'
alias cdp='cd $HOME/rails/programmingfonts'
alias cdi='cd $HOME/iPhone/iPhone-App'
alias cdg='cd $HOME/rails/g4s/give4sure'
alias cdgp='cd $HOME/rails/g4s/plugin'
alias cdm='if [ -d $HOME/rails/mylocalplanet ] ; then ; cd $HOME/rails/mylocalplanet ; else ; cd /srv/rails/mylocalplanet/current ; fi '
alias cdr='cd $HOME/rails/RoomPortfolio'
alias cdw='if [ -d $HOME/rails/web_app ] ; then ; cd $HOME/rails/web_app ; else ; cd /srv/rails/web_app/current ; fi '
alias cdl='cd $HOME/rails/learn-to-trade'
alias cdf='cd $HOME/rails/fuji'

# utils
rcat() { cat $1 | coderay -ruby }
pcat() { cat $1 | coderay -python }
round() { echo $1 | awk '{printf("%d\n",$1 + 0.5)}' }
progress_bar() {
  local percent=$1
  local bar_length=$(($COLUMNS - 12))
  local octothorpes=$(round $((bar_length * (percent / 100))))
  local gaps=$((bar_length - octothorpes))
  echo -n '[ '
  for n ({0..$octothorpes}) { echo -n '#' }
  for n ({0..$gaps}) { echo -n ' ' }
  echo -n "] $(round $percent)% \r"
}
egg() {
  let "countdown_time=60 * $1"
  let "i=0"
  while (( i < countdown_time ))
  do
     (( i += 1 ))
     progress_bar $(((i * 100.0) / countdown_time))
     sleep 1
  done

  if [ `uname`=Darwin ]
  then
    say --interactive=red -v 'Pipe Organ' 'Ding ding. End of round. Bitch ay da doo doo.' &
    sleep 3 ; say --interactive=yellow -v 'Hysterical' ay aya ay
  fi
}

################################################################################
## rvm
################################################################################
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
################################################################################
## rbenv
################################################################################
which rbenv > /dev/null && eval "$(rbenv init -)"
