export PATH=$PATH:$HOME/.dotfiles/bin
export RUBYMINE_HOME=/Applications/Rubymine.app
export BUNDLE_EDITOR=view
export EDITOR=vim
export VISUAL=vim

if [ `uname` = Darwin ]
then
  # Prefer homebrew applications.
  export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/games:/usr/local/mysql/bin:$PATH

  export PATH="/usr/local/opt/mongodb@3.0/bin:$PATH"
  export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"
  export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"
  # Put vagrant boxes on pendrive
  export VAGRANT_HOME='/Volumes/Quicker/vagrant.d'

  export ANDROID_HOME=/Volumes/Quicker/android-sdk-macosx
else
  export PATH="/opt/android-studio/bin:$PATH"
  # Datomic
  export PATH=$PATH:/usr/local/src/datomic-pro-0.9.5561/bin
  export PATH=$PATH:/usr/local/src/datomic-free-0.9.5394/bin
fi

# Ensure ruby apps (i.e.Pow) work with rbenv
[[ -d "$HOME/.rbenv/shims" ]] && export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
