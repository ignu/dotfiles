# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_TITLE=true

# lets do vim mode.
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey '^r' history-incremental-search-backward

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="apple"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(osx rails ruby git npm nvm colorize pow zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh

export SECRET_KEY_BASE='blahblah'

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/Cellar/postgresql/9.1.2/bin:/Users/ignu/.rvm/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin/

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

source $HOME/.aliasrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


export EDITOR='vim'

PATH=~/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# autocompletion for cuc
_cucumber_features() {
  compadd $(ls features/**/*.feature | sed "s/features\/\(.*\).feature/\1/")
}
compdef _cucumber_features cuc

# autocompletion for sm
_spec_model() {
  compadd $(ls spec/models/**/*_spec.rb | sed "s/spec/models/\/\(.*\)_spec.rb\1/")
}
compdef _spec_model sm

alias sm="bundle exec rspec"

if [[ -a /etc/zshenv ]]; then
  sudo mv /etc/zshenv /etc/zprofile
fi
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

[ -s "/Users/ignu/.nvm/nvm.sh" ] && . "/Users/ignu/.nvm/nvm.sh" # This loads nvm

# added by travis gem
[ -f /Users/ignu/.travis/travis.sh ] && source /Users/ignu/.travis/travis.sh

[[ $TERM == eterm-color ]] && export TERM=xterm
