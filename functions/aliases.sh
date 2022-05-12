# ls
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"

# rails
alias bi='bundle install'
alias bs='bundle show'
alias bo='bundle open'
alias be='bundle exec'
alias beg='bundle exec guard'
alias bers='bundle exec rails server -b 0.0.0.0'
alias berc='bundle exec rails console'
alias ber='bundle exec rake'
alias berr='bundle exec rake routes'
alias bert='bundle exec rake --tasks'
alias bersd='bundle exec rails server --debugger'
alias rc='rails console --debugger'
alias rs='rails server --debugger'
alias tld='tail -f log/development.log'
alias tlt='tail -f log/test.log'
alias s='bin/spring'
alias st='bin/spring rspec -f d'
alias sr='bin/spring rake'
alias srr='bin/spring rake routes'
alias srt='bin/spring rake --tasks'

# Node
alias dbj="node inspect $(npm bin)/jest --runInBand"
alias j="npm exec jest"

# Navigation
alias cda='cd $HOME/code/ruby/about-corp-finance'
alias cde='cd $HOME/code/exercism'
alias cdi='cd $HOME/code/js/iv'
alias cdk='cd $HOME/code/clojure/kapow'
alias cdl='cd $HOME/code/ruby/leapfrog'
alias cdr='cd $HOME/code/ruby/dcom_remarkable'
alias cds='cd $HOME/code/clojure/snek'
alias cdv='cd $HOME/code/ruby/vizamyl-app'
alias cdss='cd $HOME/VVV/www/vyx/public_html/wp-content/themes/vyxeos-by-seven-stones'
alias cdx='cd $HOME/VVV/www/vyxeos.eu/public_html/wp-content/themes/vyxeos'

# Misc.
alias pp="ps axuf | pager"
alias sum="xargs | tr ' ' '+' | bc" ## Usage: echo 1 2 3 | sum
# Uses system ctag executable
alias ctagit='ctags -R --exclude=.git --exclude=log --exclude=tmp'
alias ctagall='ctagit . $(bundle list --paths)'
# Uses brewed ctag executable
alias ectagit='/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=tmp'
alias ectagall='ectagit . $(bundle list --paths)'
alias pgd='postgres -D /usr/local/var/postgres'
alias myd='mysql.server start'
# Run a web server
alias ss2='python2 -m SimpleHTTPServer 8888'
alias ss='python3 -m http.server'
# Tensorflow
alias tdrun='docker run \
  -it \
  --network=host \
  --device=/dev/kfd \
  --device=/dev/dri \
  --ipc=host \
  --shm-size 12G \
  --group-add video \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  -v $HOME/dockerx:/dockerx \
  rocm/tensorflow:latest'
