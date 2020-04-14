# rvm
[[ -x "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -x "$HOME/.rvm/scripts/rvm" ]] && PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# rbenv
[[ -f "$HOME/.rbenv/version" ]] && eval "$(rbenv init -)"

# chruby
[[ -s /usr/local/share/chruby/chruby.sh ]] && source /usr/local/share/chruby/chruby.sh
[[ -s /usr/local/share/chruby/auto.sh ]] && source /usr/local/share/chruby/auto.sh
which chruby > /dev/null && chruby 2.2.2
