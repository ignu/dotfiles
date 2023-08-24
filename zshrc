# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_TITLE=true
# lets do vim mode.
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey '^r' history-incremental-search-backward

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/ignu/.rvm/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin/
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="cloud"
ZSH_THEME="agnoster"


POWERLEVEL9K_VCS_GIT_ICON='\ue60a'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time time background_jobs ssh rbenv)
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

POWERLEVEL9K_BATTERY_LOW_FOREGROUND='red'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='yellow'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='green'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='blue'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0c5'
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0c4'
POWERLEVEL9K_BACKGROUND_JOBS_ICON=$'\uf27b'
POWERLEVEL9K_EXECUTION_TIME_ICON=$'\ufa1a'
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M}"
POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
COMPLETION_WAITING_DOTS="true"

export DISABLE_FZF_AUTO_COMPLETION="true"

# use bash complete compat for asdf
autoload bashcompinit
bashcompinit


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(macos ruby git npm nvm colorize pow react-native zsh-syntax-highlighting history-substring-search fzf)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

source $ZSH/oh-my-zsh.sh

export SECRET_KEY_BASE='blahblah'


for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

source $HOME/.aliasrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export EDITOR='nvim'

PATH=~/bin:$PATH

export ERL_AFLAGS="-kernel shell_history enabled"

# autocompletion for sm
_spec_model() {
  compadd $(ls spec/models/**/*_spec.rb | sed "s/spec/models/\/\(.*\)_spec.rb\1/")
}

p() {
  terminal-notifier -message $1 -title "terminal alert"
}

compdef _spec_model sm
alias sm="bundle exec rspec"

if [[ -a /etc/zshenv ]]; then
  sudo mv /etc/zshenv /etc/zprofile
fi
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if type lesspipe.sh >/dev/null 2>&1; then
  export LESSOPEN='|lesspipe.sh %s'
fi

if type pygmentize >/dev/null 2>&1; then
  export LESSCOLORIZER='pygmentize'
fi

export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=2 --no-init --window=-4'

fanc-yctrl-z () {
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
#export TERM="xterm-256color"
#export TERM="xterm-256color-italic"

function defaultbranch() {
  git remote show origin | grep "HEAD branch" | cut -d ":" -f 2 | xargs
}

function gfom() {
  git fetch
  branch="origin/$(defaultbranch)"
  git rebase $branch
}

function gmom() {
  git fetch origin
  branch="origin/$(defaultbranch)"
  git merge $branch
}

function gac() {
  git add .
  git commit -m $1
}

# stash changes, switch to branch and then pop stash.
# pass in an argument to go to that branch. defaults to '-'
function wb() {
  echo "oh sorry wrong branch. 🤦🏻‍♀️"
  git stash

  if [ ! $1 ]; then
    echo "*********** Checking out previous branch *************"
    git checkout -
  else
    echo "*********** Checking out $1 *************"
    git checkout -b $1
  fi

  git stash pop
  echo "********** Done. Sorry. *************"
}

function fuckit() {
  git reset --hard
  git clean -fd
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
  branch="$(defaultbranch)"
  git checkout $branch
  git rebase origin/$branch
  git checkout -b $1
}

function gm() {
  git merge $1 --no-ff
}

function gc() {
  git commit -v -a -m "$*"
}

function whilepass() {
  while "$1"; do :; done
}

function whilefail() {
  while ! $1 ; do :; done
}

function gbtr() {
  git branch --track $1 remotes/origin/$1
  git checkout $1
  branch="$(defaultbranch)"
  git rebase $branch
  git checkout $branch
  git rebase $1
  git branch -D $1
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
  rm -rf ~/config/karabiner
  rm -rf ~/.config/nvim
  ln -s ~/bin/dotfiles/nvim ~/.config/nvim
  ln -s ~/bin/dotfiles/init.vim ~/.config/nvim/init.vim
  ln -s ~/bin/dotfiles/vim .vim
  ln -s ~/bin/dotfiles/karabiner ~/.config/
  ln ~/bin/dotfiles/vimrc .vimrc
  touch ~/.zshrc.local

  if [ ! -f ~/.rubocop.yml ]; then
    echo "Initializing RuboCop 🚔"
    cp ~/bin/dotfiles/.rubocop.yml ~/
  fi

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

source ~/.zshrc.local


function readme() {
  if [ -f ./README.md ]; then
    filename="README.md"
  fi

  if [ -f ./README ]; then
    filename="README"
  fi

  if [ -f ./README.txt ]; then
    filename="README.txt"
  fi

  bat $filename
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

function dsh() {
  docker-compose run $1 /bin/bash
}

function aw() {
  rg $1 -l
}

function brs() {
  bundle exec rails s -p $1
}

function compilevs() {
  export NODE_ENV=development
  yarn

  mv product.json product.json.bak
  cat product.json.bak | jq 'setpath(["extensionsGallery"]; {"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery", "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index", "itemUrl": "https://marketplace.visualstudio.com/items"}) | setpath(["nameShort"]; "VS Code") | setpath(["nameLong"]; "VS Code")' > product.json

  export NODE_ENV=production
  npx gulp vscode-darwin-min
}


PATH=$PATH:$HOME/.opam/system/bin
PATH=$PATH:$HOME/.local/bin

# rg reports dumb .gitignore errors
function sg () {
  rg $1 2> /dev/null
}

function when_delete() {
 git log -c -S'$1' $2
}

[[ -s "$HOME/.asdf/asdf.sh" ]] && source ~/.asdf/asdf.sh
[[ -s "$HOME/.asdf/asdf.sh" ]] && source ~/.asdf/asdf.
[[ -s "$HOME/homebrew/opt/asdf/libexec/asdf.sh" ]] && source "$HOME/homebrew/opt/asdf/libexec/asdf.sh"
[[ -s "/opt/homebrew/opt/asdf/libexec/asdf.sh" ]] && . "/opt/homebrew/opt/asdf/libexec/asdf.sh"
[[ -s "$HOME/.cargo/env" ]] && source $HOME/.cargo/env

alias ours="!f() { git checkout --ours $@ && git add $@; }; f"
alias theirs="!f() { git checkout --theirs $@ && git add $@; }; f"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/lsmith/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/lsmith/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/lsmith/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/lsmith/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh


export RUBY_HEAP_MIN_SLOTS=1000000 #deprecated in ruby 2.10
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_FREE_MIN=$RUBY_HEAP_FREE_MIN #deprecated in ruby 2.10
export RUBY_GC_HEAP_FREE_SLOTS=$RUBY_HEAP_FREE_MIN

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


prompt_context() {}

#source /Users/lensmith/.config/broot/launcher/bash/br
eval "$(starship init zsh)"

function gpr() {
  git commit -m "$1"
  git push origin HEAD
  hub compare
}

function editlocal() {
  vim ~/.zshrc.local
  source ~/.zshrc.local
}

function editzsh() {
  vim ~/.zshrc
  source ~/.zshrc
}

function sourcelocal() {
  source ~/.zshrc.local
}


function gppp() {
  git commit -m "$1"
  git push origin HEAD
  hub compare
}

function fbat() {
  rg "$1" | fzf | bat
}



# bun completions
[ -s "/Users/ignu/.bun/_bun" ] && source "/Users/ignu/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/ignu/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/ignu/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
