# go to saved path if there is one
if [[ -f ~/.current_path~ ]]; then
  cd `cat ~/.current_path~`
  rm ~/.current_path~
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
