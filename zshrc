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
plugins=(osx ruby git npm nvm colorize pow react-native tmux zsh-syntax-highlighting history-substring-search fast-syntax-highlighting)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.zshrc.local

source $ZSH/oh-my-zsh.sh

export SECRET_KEY_BASE='blahblah'

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/ignu/.rvm/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin/

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

source $HOME/.aliasrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export EDITOR='nvim'

PATH=~/bin:$PATH

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
export TERM="xterm-256color"

function gfom() {
  git fetch
  git rebase origin/master
}

function gfod() {
  git fetch
  git rebase origin/develop
}

# stash changes, switch to branch and then pop stash.
# pass in an argument to go to that branch. defaults to '-'
function coo() {
  echo "COO COO..."
  git stash

  if [ ! $1 ]; then
    echo "*********** Checking out previous branch *************"
    git checkout -
  else
    echo "*********** Checking out $1 *************"
    git checkout $1
  fi

  git stash pop
  echo "********** Done *************"
}

function gpr() {
  git commit -m "$1"
  git push origin HEAD
  hub compare
}

function headers() {
  curl -s -D - $1 -o /dev/null
}

function gwp() {
  git add .
  git commit -am "wip $1" --no-verify
}

function gitnewbranch() {
  git fetch
  git checkout master
  git rebase origin/master
  git checkout -b $1
}

function gm() {
  git merge $1 --no-ff
}

function gc() {
  git commit -v -a -m "$*"
}

function gbtr() {
  git branch --track $1 remotes/origin/$1
  git checkout $1
  git rebase master
  git checkout master
  git rebase $1
  git branch -D $1
}

function mvnclean() {
  cd ~/code/Dotcom-CMS/hbodata
  mvn clean install -PautoInstallPackage
  cd ~/code/Dotcom-CMS/hboweb
  mvn clean install -PautoInstallPackage
}

function gbt() {
  git branch --track $2 remotes/$1/$2
  git checkout $2
}

function reprofile() {
  cd

  rm ~/.zshrc
  ln -s ~/bin/dotfiles/zshrc .zshrc

  rm ~/.tmux.conf
  ln -s ~/bin/dotfiles/tmux.conf .tmux.conf

  rm ~/.aliasrc
  ln -s ~/bin/dotfiles/aliasrc .aliasrc

  rm ~/.gitignore_global
  ln -s ~/bin/dotfiles/gitignore_global .gitignore_global

  rm  ~/.vimrc
  rm -rf ~/.vim
  rm -rf ~/.config/nvim
  mkdir ~/.config/nvim
  ln -s ~/bin/dotfiles/init.vim ~/.config/nvim/init.vim
  ln -s ~/bin/dotfiles/vim .vim
  ln ~/bin/dotfiles/vimrc .vimrc
  touch ~/.zshrc.local

  if [ ! -f ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/README.md ]; then
    echo "🖥 Cloning fast highting ..."
    cd ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/zdharma/fast-syntax-highlighting.git
  fi

  if [ ! -f ~/.zsh/zsh-autosuggestions/Gemfile ]; then
    echo "Cloning zsh autosuggestions..."
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  fi

  echo "Profile linked! 🌈"
}

function fetchprofile() {
  cd ~/bin/dotfiles
  git stash
  gfom
  git stash pop
  reprofile
}

function npwrap() {
  npm install
  npm prune
  npm dedupe
  npm install
  npm shrinkwrap --dev
}

function wasthiseverathing() {
  git rev-list --all | xargs git grep $1
}

source ~/.asdf/asdf.sh

source $HOME/.cargo/env

alias ours="!f() { git checkout --ours $@ && git add $@; }; f"
alias theirs="!f() { git checkout --theirs $@ && git add $@; }; f"
