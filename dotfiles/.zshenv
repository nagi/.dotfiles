export ANDROID_HOME=/Volumes/Quicker/android-sdk-macosx
export PATH=$PATH:$HOME/.dotfiles/bin
export RUBYMINE_HOME=/Applications/Rubymine.app
export BUNDLE_EDITOR=view
export EDITOR=vim
export VISUAL=vim

# Ensure ruby apps (i.e.Pow) work with rbenv
[[ -d "$HOME/.rbenv/shims" ]] && export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
