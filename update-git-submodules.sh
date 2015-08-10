#!/usr/bin/env bash
git submodule foreach git pull origin master

# compile vim YouCompleteMe submodule
if [ -d "./.vim/bundle/YouCompleteMe.git" ]; then
  cd "./.vim/bundle/YouCompleteMe.git" && git submodule update --init --recursive && ./install.sh
fi
