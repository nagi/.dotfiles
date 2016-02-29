rcat() { cat $1 | coderay -ruby }

pcat() { cat $1 | coderay -python }

function lt() { ls -ltrsa "$@" | tail; }

function ff() { find . -iname "*$@*"; }

function fp() { ps aux | grep -v grep | grep "$@" -i --color=auto; }

function remove_lines_from() { grep -F -x -v -f $2 $1; }

function mkcd() { mkdir $1 && cd $1; }

function ed209 { git status --porcelain | grep -v '^D' | grep '\.rb$' | grep -v 'db/schema.rb' | cut -d ' ' -f 3 | xargs bundle exec rubocop }
