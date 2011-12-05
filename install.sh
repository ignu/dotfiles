#!/usr/bin/env bash

echo "installing oh my zsh"
  wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
  cd ~/

echo "cloning repository"
  mkdir ~/bin
  cd ~/bin
  git clone git@github.com:ignu/dotfiles2.0.git

echo "linking files"
  cd
  ln ~/bin/dotfiles2.0/ackrc .ackrc
  ln ~/bin/dotfiles2.0/vimrc .vimrc
  ln ~/bin/dotfiles2.0/gvimrc .gvimrc
  ln -s ~/bin/dotfiles2.0/vim .vim
  ln -~/bin/dotfiles2.0/gitconfig .gitconfig
  ln ~/bin/dotfiles2.0/aliasrc .aliasrc
  ln ~/bin/dotfiles2.0/tmux.conf .tmux.conf

  rm .zshrc
  ln ~/bin/dotfiles2.0/zshrc .zshrc
  rm -rf ~/.zsh_profile.d
  ln -s ~/bin/dotfiles2.0/zsh_profile.d .zsh_profile.d

echo "updating vim packages"  
  mkdir .vim/bundle
  .vim/update_bundles

echo "setup postgres"
  initdb /usr/local/var/postgres
  cp /usr/local/Cellar/postgresql/9.0.1/org.postgresql.postgres.plist ~/Library/LaunchAgents
  launchctl load -w ~/Library/LaunchAgents/org.postgresql.postgres.plist
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

echo "install pow"
  curl get.pow.cx | sh
 
