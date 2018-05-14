#!/usr/bin/env bash

echo "installing prereqs..."
  brew install exa
  brew install ccat
  brew install wget
  brew install ripgrep
  brew install fzf
  brew install tree
  brew install elixir
  brew install diff-so-fancy

echo "installing oh my zsh"
  wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
  cd ~/

echo "cloning repository"
  mkdir ~/bin
  cd ~/bin
  git clone git@github.com:ignu/dotfiles.git

echo "linking files"
  cd
  ln ~/bin/dotfiles/vimrc .vimrc
  ln -s ~/bin/dotfiles/vim .vim
  ln -s ~/bin/dotfiles/vim ~/config/nvim
  ln ~/bin/dotfiles/gitconfig .gitconfig
  ln ~/bin/dotfiles/aliasrc .aliasrc
  ln ~/bin/dotfiles/tmux.conf .tmux.conf

  rm .zshrc
  ln ~/bin/dotfiles/zshrc .zshrc
  rm -rf ~/.zsh_profile.d
  ln -s ~/bin/dotfiles/zsh_profile.d .zsh_profile.d

