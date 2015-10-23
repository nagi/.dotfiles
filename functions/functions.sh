# Sourced by zshrc

rcat() { cat $1 | coderay -ruby }

pcat() { cat $1 | coderay -python }

function lt() { ls -ltrsa "$@" | tail; }

function ff() { find . -iname "*$@*"; }

function fp() { ps aux | grep -v grep | grep "$@" -i --color=auto; }

function remove_lines_from() { grep -F -x -v -f $2 $1; }

function mkcd() { mkdir $1 && cd $1; }

function ed209 { git status --porcelain | grep -v '^D' | grep '\.rb$' | grep -v 'db/schema.rb' | cut -d ' ' -f 3 | xargs rubocop }

round() { echo $1 | awk '{printf("%d\n",$1 + 0.5)}' }

progress_bar() {
  local percent=$1
  local bar_length=$(($COLUMNS - 12))
  local octothorpes=$(round $((bar_length * (percent / 100))))
  local gaps=$((bar_length - octothorpes))
  echo -n '[ '
  for n ({0..$octothorpes}) { echo -n '#' }
  for n ({0..$gaps}) { echo -n ' ' }
  echo -n "] $(round $percent)% \r"
}

egg() {
  let "countdown_time=60 * $1"
  let "i=0"
  while (( i < countdown_time ))
  do
     (( i += 1 ))
     progress_bar $(((i * 100.0) / countdown_time))
     sleep 1
  done

  if [ `uname`=Darwin ]
  then
    say --interactive=red -v 'Pipe Organ' 'Ding ding. End of round. Bitch ay da doo doo.' &
    sleep 3 ; say --interactive=yellow -v 'Hysterical' ay aya ay
  fi
}
