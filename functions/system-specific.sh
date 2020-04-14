if [ `uname` = Darwin ]
then
    # load iTerm2 tab color helpers
    [[ -s ~/.dotfiles/functions/iterm2-helpers.sh ]] && source ~/.dotfiles/functions/iterm2-helpers.sh

    # Prefer homebrew applications.
    export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/games:/usr/local/mysql/bin:$PATH

    export PATH="/usr/local/opt/mongodb@3.0/bin:$PATH"
    export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"
    export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"
    # Put vagrant boxes on pendrive
    export VAGRANT_HOME='/Volumes/Quicker/vagrant.d'

    export ANDROID_HOME=/Volumes/Quicker/android-sdk-macosx

    # Set java version
    # https://www.kevinhooke.com/2017/10/05/switching-java-versions-on-mac-os/
    if `/usr/libexec/java_home -v 1.8 &> /dev/null` ; then alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`" ; fi
    if `/usr/libexec/java_home -v 11 &> /dev/null` ; then alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`" ; fi
    if `/usr/libexec/java_home -v 13 &> /dev/null` ; then alias j13="export JAVA_HOME=`/usr/libexec/java_home -v 13`" ; fi
else
    # Run ssh-agent: https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
    [[ -s /etc/arch-release ]] && eval `keychain --eval --agents ssh id_rsa --quiet`

    # Debain / Ubuntu / Mint command not found
    if [ -f /etc/zsh_command_not_found ]
    then
        . /etc/zsh_command_not_found
    fi

    # sane clipboard
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

    # Datomic
    export PATH=$PATH:/usr/local/src/datomic-pro-0.9.5561/bin
    export PATH=$PATH:/usr/local/src/datomic-free-0.9.5394/bin

    # Android studio
    export PATH="/opt/android-studio/bin:$PATH"

    alias j8='echo "try this: sudo update-java-alternatives --set java-1.8.0-openjdk-amd64"'
    alias j11='echo "try this: sudo update-java-alternatives --set java-1.11.0-openjdk-amd64"'
fi
