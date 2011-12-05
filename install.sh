#!/usr/bin/env bash

echo "installing oh my zsh"
  wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
  cd ~/
  rm .zshrc

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
  ln -s ~/bin/dotfiles2.0/gitconfig .gitconfig
  ln -s ~/bin/dotfiles2.0/aliasrc .aliasrc
  ln -s ~/bin/dotfiles2.0/tmux.conf .tmux.conf

  ln ~/bin/dotfiles.0/zshrc .zshrc
  ln -s ~/bin/dotfiles2.0/zsh_profile.d
 
