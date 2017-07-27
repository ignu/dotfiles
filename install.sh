#!/usr/bin/env bash

echo "installing oh my zsh"
  wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
  cd ~/

echo "cloning repository"
  mkdir ~/bin
  cd ~/bin
  git clone git@github.com:ignu/dotfiles.git

echo "linking files"
  cd
  ln ~/bin/dotfiles/ackrc .ackrc
  ln ~/bin/dotfiles/vimrc .vimrc
  ln ~/bin/dotfiles/gvimrc .gvimrc
  ln -s ~/bin/dotfiles/vim .vim
  ln -s ~/bin/dotfiles/vim ~/config/nvim
  ln ~/bin/dotfiles/gitconfig .gitconfig
  ln ~/bin/dotfiles/aliasrc .aliasrc
  ln ~/bin/dotfiles/tmux.conf .tmux.conf

  rm .zshrc
  ln ~/bin/dotfiles/zshrc .zshrc
  rm -rf ~/.zsh_profile.d
  ln -s ~/bin/dotfiles/zsh_profile.d .zsh_profile.d

  brew install python3
  pip3 install --upgrade neovim

echo "install pow"
  curl get.pow.cx | sh
