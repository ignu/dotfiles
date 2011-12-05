#!/usr/bin/env bash

echo "installing oh my zsh"
  wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
  rm .zshrc

echo "cloning repository"
  mkdir ~/bin
  cd ~/bin
  git clone git@github.com:ignu/dotfiles2.0.git

echo "linking files"
  cd
  ln ~/bin/dotfiles/ackrc .ackrc
  ln ~/bin/dotfiles/vimrc .vimrc
  ln ~/bin/dotfiles/gvimrc .gvimrc
  ln -s ~/bin/dotfiles/vim .vim
  ln -s ~/bin/dotfiles/gitconfig .gitconfig
  ln -s ~/bin/dotfiles/aliasrc .aliasrc
  ln -s ~/bin/dotfiles/tmux.conf .tmux.conf

  ln ~/bin/dotfiles/zshrc .zshrc
  ln -s ~/bin/dotfiles/zsh_profile.d
 
