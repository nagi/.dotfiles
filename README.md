# Andrews dotfiles

My config files for both Mac and Linux systems.

### Installation
* Install git
* Install powerline
* Install zsh
* Install tmux
* `chsh`
* Run this:

``` sh
git clone git://github.com/nagi/.dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

cd ~/.dotfiles
git submodule init
git submodule update
./install
```

### Applications

The [APPLICATIONS.md](./APPLICATIONS.md) file reminds me which applictions I need on a new system.
