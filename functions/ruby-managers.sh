# rvm
[[ -x "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -x "$HOME/.rvm/scripts/rvm" ]] && PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# rbenv
which rbenv > /dev/null && eval "$(rbenv init -)" && rbenv global > /dev/null

# chruby
[[ -s /usr/local/share/chruby/chruby.sh ]] && source /usr/local/share/chruby/chruby.sh
which chruby > /dev/null && chruby 2.2.2
