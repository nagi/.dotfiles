if [ `uname` = Darwin ]
then
  # load iTerm2 tab color helpers
  [[ -s ~/.dotfiles/functions/iterm2-helpers.sh ]] && source ~/.dotfiles/functions/iterm2-helpers.sh
  # Prefer homebrew applications.
  export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/games:/usr/local/mysql/bin:$PATH
  # Put vagrant boxes on pendrive
  export VAGRANT_HOME='/Volumes/Quicker/vagrant.d'
else
  # Datomic
  export PATH=$PATH:/usr/local/src/datomic-pro-0.9.5561/bin
  # export PATH=$PATH:/usr/local/src/datomic-free-0.9.5394/bin

  # Run ssh-agent: https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
  eval `keychain --eval --agents ssh id_rsa --quiet`

  # Debain / Ubuntu / Mint command not found
  if [ -f /etc/zsh_command_not_found ]
  then
    . /etc/zsh_command_not_found
  fi

  # sane clipboard
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
