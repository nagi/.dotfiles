# ls
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"

# sane clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# rails
alias bi='bundle install'
alias bs='bundle show'
alias bo='bundle open'
alias be='bundle exec'
alias beg='bundle exec guard'
alias bers='bundle exec rails server'
alias berc='bundle exec rails console'
alias ber='bundle exec rake'
alias ber='bundle exec rake'
alias berr='bundle exec rake routes'
alias bert='bundle exec rake --tasks'
alias bersd='bundle exec rails server --debugger'
alias rc='rails console --debugger'
alias rs='rails server --debugger'
alias tld='tail -f log/development.log'
alias tlt='tail -f log/test.log'
alias sr='spring rspec'
alias srr='spring rake routes'

# Navigation
alias cda='cd $HOME/rails/about-corp-finance'
alias cdb='cd $HOME/rails/best100'
alias cde='cd $HOME/rails/eme-server'
alias cdeme='cd $HOME/rails/eme-server'
alias cdp='cd $HOME/rails/programmingfonts'
alias cdi='cd $HOME/ios/iPhone-App'
alias cdg='cd $HOME/rails/g4s/give4sure'
alias cdgp='cd $HOME/rails/g4s/plugin'
alias cdm='if [ -d $HOME/rails/mylocalplanet ] ; then ; cd $HOME/rails/mylocalplanet ; else ; cd /srv/rails/mylocalplanet/current ; fi '
alias cdw='if [ -d $HOME/rails/web_app ] ; then ; cd $HOME/rails/web_app ; else ; cd /srv/rails/web_app/current ; fi '
# WP Navigation
alias cdfa='cd $HOME/rails/fuji-account-service'
alias cdfc='cd $HOME/ruby/fuji-core'
alias cdfe='cd $HOME/rails/fuji-engage'
alias cdfed='cd $HOME/ruby/fuji-engage-documentation'
alias cdfej='cd $HOME/javascript/engage-ui'
alias cdfn='cd $HOME/rails/fuji-notification-service'
alias cdfo='cd $HOME/rails/fuji-optimiser'
alias cdfs='cd $HOME/rails/fuji-schedule'
alias cdfsd='cd $HOME/ruby/sqhc-documentation'
alias cdfsj='cd $HOME/javascript/schedule-ui'

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
