#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
git submodule foreach git pull origin master

# compile vim YouCompleteMe submodule
if [ -d "./.vim/bundle/YouCompleteMe.git" ]; then
  cd "$DIR/.vim/bundle/YouCompleteMe.git" 
  git submodule update --init --recursive 
  # language support
  ./install.py --clang-completer --tern-completer
  cd "$DIR/.vim/bundle/YouCompleteMe.git/third_party/ycmd/third_party/tern_runtime" 
  npm install --production
  npm i -g typescript
fi
