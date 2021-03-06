# Andrews dotfiles

My config files for both Mac and Linux systems.

### Installation
* Install git
* Install powerline
* Install fonts-font-awesome
* Install tmux
* Install zsh
* `chsh`
* Log out then in again
* Run this:

``` sh
mkdir -p ~/.fonts
mkdir -p ~/.rbenv/plugins
mkdir -p ~/.vim/backup

git clone git://github.com/nagi/.dotfiles
push ~/.dotfiles
git submodule init
git submodule update
./install
popd
cp .dotfiles/fonts/* ~/.fonts
fc-cache -f -v

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Applications

The [APPLICATIONS.md](./APPLICATIONS.md) file reminds me which applictions I need on a new system.
