export PATH=$PATH:$HOME/.dotfiles/bin
export RUBYMINE_HOME=/Applications/Rubymine.app
export BUNDLE_EDITOR=view
export EDITOR=vim
export VISUAL=vim

export GML_GFS_TEMPLATE="$HOME/.dotfiles/data/Land_Registry_Cadastral_Parcels.gfs"

# Ensure ruby apps (i.e.Pow) work with rbenv
[[ -d "$HOME/.rbenv/shims" ]] && export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
source $HOME/.dotfiles/functions/system-specific.sh

# Confidential stuff
[[ -s "$HOME/.dotfiles/functions/secrets.sh" ]] && source "$HOME/.dotfiles/functions/secrets.sh"
