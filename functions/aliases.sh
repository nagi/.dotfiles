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
alias bers='bundle exec rails server'
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

# Navigation
alias cda='cd $HOME/rails/about-corp-finance'
alias cdd='cd $HOME/php/drytec-www'
alias cdk='cd $HOME/clojure/kapow'
alias cds='cd $HOME/rails/sauce'
alias cdv='cd $HOME/rails/vizamyl-app'
alias cdh='cd /mnt/diddy/VVV/www/hmo/public_html'
alias cdhq='cd /mnt/diddy/VVV/www/hmo/public_html/wp-content/plugins/hmo-quote-form'
alias cdq='cd $HOME/js/hmo-quote-form'

alias cdw='if [ -d $HOME/rails/web_app ] ; then ; cd $HOME/rails/web_app ; else ; cd /srv/rails/web_app/current ; fi '

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
