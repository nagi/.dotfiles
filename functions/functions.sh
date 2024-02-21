rcat() { cat $1 | coderay -ruby }

pcat() { cat $1 | coderay -python }

function lt() { ls -ltrsa "$@" | tail; }

function ff() { find . -iname "*$@*"; }

function fp() { ps aux | grep -v grep | grep "$@" -i --color=auto; }

function smell80() { sudo lsof -i:80; sudo lsof -tnP -i:80 | xargs -n 1 ps -p }

function remove_lines_from() { grep -F -x -v -f $2 $1; }

function mkcd() { mkdir $1 && cd $1; }

function ed209 { git status --porcelain | grep -v '^D' | grep '\.rb$' | grep -v 'db/schema.rb' | cut -d ' ' -f 3 | xargs bundle exec rubocop }

function git_clean_up { git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d }

function apt-key-migrate {
  typeset key="$1"
  typeset dest="$2"

  if [ -z "$key" ] || [ -z "$dest" ];
  then
    echo "Usage: apt-key-migrate <key> <destination>"
    echo "eg: apt-key-migrate 917E7EE3E dropbox"
    return 1
  fi

  sudo apt-key --keyring /etc/apt/trusted.gpg export $key | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/$dest.gpg
  sudo apt-key --keyring /etc/apt/trusted.gpg del $key
}
