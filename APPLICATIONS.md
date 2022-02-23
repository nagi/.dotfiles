# New Development Environment Setup

The tmux plugins need to be installed with `^j I`.
Start vim and `:BundleInstall`

### Editing

See the [spacemacs javascript layer README](https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/javascript)

```
sudo npm install -g tern
sudo npm install -g eslint
sudo npm -g install js-beautify
sudo gem install sass
```

### NVM

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

### Packages

```
ack
silversearcher-ag
curl
ccrypt
docker
dos2unix
git
gitk
htop
imagemagick
jq
#  leiningen see below (untested)
maven
openssh-server
openjdk
phantomjs
python3
python3-pip
rlwrap
ruby
tmux
tree
wget
xclip
xsel
zsh
```

##### leingingen

curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > ~/.local/bin
chmod a+x ~/.local/bin/lein
# test
cd
which lein
lein
# ...should all return 0

##### for Root

sym link my .bashrc, .vim, and .vimrc

##### for rails

```
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
```

##### for i3

sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop-standard
sudo apt install python3-pip
pip3 install raiseorlaunch
sudo mv /etc/regolith/i3/config /etc/regolith/i3/config_ORIGINAL
sudo ln -s /home/nagi/.dotfiles/linux/regolith-i3-config /etc/regolith/i3/config

### dnsm dnsmasq

```
sudo apt-get install dnsmasq

sudo vim /etc/dnsmasq.conf

server=8.8.8.8
server=8.8.4.4
address=/test/127.0.0.1

sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved

sudo vim /etc/NetworkManager/NetworkManager.conf # and after [Main] add or change to dns=none. Save the file.

sudo systemctl restart NetworkManager
sudo systemctl restart dnsmasq
sudo service dnsmasq restart
```


sudo apt-get install fonts-powerline

### Ruby Dev

https://gorails.com for ruby / rbevn instructions

### Dropbox

https://www.dropbox.com/install-linux

### Window management

##### Gnome3

![Gnome 3 settings](./gnome3.png)

##### MacOS

Install:

* [slate](https://github.com/jigish/slate#direct-download).
* [karabiner](https://pqrs.org/osx/karabiner/)
