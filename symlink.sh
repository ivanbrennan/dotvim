#!/usr/bin/env bash

set -eu

repo=${DOTFILES/%dotfiles/dotvim}

if [[ ! -d $repo ]]; then
  echo "No vim repo to symlink"
  exit 1
fi

if [[ -d ~/.vim ]] && [[ ! -L ~/.vim ]]; then
  backup=~/.vim.$(date +%s)
  echo "Backing up existing ~/.vim to $backup"
  mv ~/.vim $backup
fi

ln -svnf $repo ~/.vim
