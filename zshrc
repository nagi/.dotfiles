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

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/home/nagi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/android-sdk-linux_x86/tools:/opt/android-sdk-linux_x86/platform-tools:/home/nagi/.rvm/bin

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
# cd
alias ..='cd ..'
alias cdv='cd /home/nagi/rails/victoria' 
alias cdq='cd /home/nagi/rails/Quipper-Entry-System' 

# ls
# alias ls="ls --color=auto"
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"

# grep
# alias grep='grep --color=auto'

# git
alias ga='git add .'
alias gl='git log'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gci='git commit -v'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git ls-files --deleted | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

# rails
alias rc='rails console --debugger'
alias rs='rails server --debugger'
alias rp='RAILS_ENV=production rails server thin'
alias sc='script/console'
alias ss='script/server'
alias sg='script/generate'
alias a='autotest'
alias tld='tail -f log/development.log'
alias tlt='tail -f log/test.log'

################################################################################
## rvm
################################################################################
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
