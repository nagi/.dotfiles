if [ `uname` = Darwin ]
then
  # load iTerm2 tab color helpers
  [[ -s ~/.dotfiles/functions/iterm2-helpers.sh ]] && source ~/.dotfiles/functions/iterm2-helpers.sh
  # Prefer homebrew applications.
  export PATH=/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:/usr/local/sbin:/usr/local/games:/usr/texbin
  # Put vagrant boxes on pendrive
  export VAGRANT_HOME='/Volumes/Quicker/vagrant.d'
else
  # Fix for tmux
  export TERM=xterm-256color
  # Run ssh-agent: https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

  # Debain / Ubuntu / Mint command not found
  if [ -f /etc/zsh_command_not_found ]
  then
    . /etc/zsh_command_not_found
  fi
fi
