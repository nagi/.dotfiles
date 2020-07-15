# New Development Environment Setup

The tmux plugins need to be installed with `^j I`.
Start vim and `:BundleInstall`

### Editing

See the [spacemacs javascript layer README](https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/javascript)

`sudo npm install -g tern` linting
`sudo npm install -g eslint` linting
`sudo npm -g install js-beautify` formatting


### Packages

```
ack
ag
curl
docker
dos2unix
git
htop
jq
leiningen
maven
openjdk
phantomjs
rlwrap
ruby
tmux
tree
wget
xclip
xsel
zsh
```

### dnsm dnsmasq

sudo apt-get install dnsmasq
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved

sudo vim /etc/dnsmasq.conf

server=8.8.8.8
server=8.8.4.4
address=/test/127.0.0.1

sudo service dnsmasq restart

Edit /etc/NetworkManager/NetworkManager.conf and after [Main] add or change to dns=none. Save the file.

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
