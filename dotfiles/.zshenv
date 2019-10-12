export PATH=$PATH:$HOME/.dotfiles/bin
export RUBYMINE_HOME=/Applications/Rubymine.app
export BUNDLE_EDITOR=view
export EDITOR=vim
export VISUAL=vim

# Ensure ruby apps (i.e.Pow) work with rbenv
[[ -d "$HOME/.rbenv/shims" ]] && export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
source $HOME/.dotfiles/functions/system-specific.sh
source $HOME/.dotfiles/functions/ruby-managers.sh

# Confidential stuff
[[ -s "$HOME/.dotfiles/functions/secrets.sh" ]] && source "$HOME/.dotfiles/functions/secrets.sh"
