#!/usr/bin/env sh
set -e

source_dir=`pwd`
dst_default=$HOME
#dst_default=`mktemp -d`
echo "dotfile destination is $dst_default"

function linkResource {
    local src=$1
    local dst=${2:-$dst_default}

    #  $src should be directory of file
    if [[ -z "$src" || ! -r "$src" ]]; then
        echo "Could not link $src"
        return
    fi

    if [[ -e "$dst/$src" ]]; then
        echo "Destination $dst/$src already exists"
        return
    fi

    # link the resource
    echo "Create link from $source_dir/$src to $dst"
    if [[ ! -d "$dst/$src" ]]; then
        ln -s "$source_dir/$src" "$dst/$src"
    fi
}

linkResource ".vim"
linkResource ".vimrc"

ternForVimDir=".vim/bundle/tern_for_vim"
if [ -d "$ternForVimDir" ] && [ -f "$ternForVimDir/package.json" ]; then
    pushd .
    cd "$ternForVimDir" &&
    npm install
    popd
fi

# vim & zeitgeist
if hash "zeitgeist-daemon" 2> /dev/null; then
  wget -O .vim/plugin/zeitgeist.vim "https://raw.githubusercontent.com/jeffwheeler/vimfiles/master/plugin/zeitgeist.vim"
fi

wget -O .vim/colors/sorcerer.vim "https://raw.githubusercontent.com/adlawson/vim-sorcerer/master/colors/sorcerer.vim"
wget -O .vim/colors/monokai.vim "https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim"
wget -O .vim/colors/tomorrow.vim "https://raw.githubusercontent.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow.vim"

# compile vim YouCompleteMe submodule
if [ -d ".vim/bundle/YouCompleteMe.git" ]; then
  git submodule update --init --recursive
  cd ".vim/bundle/YouCompleteMe.git" && ./install.sh
fi

# add pethogen
mkdir -p ./.vim/autoload && cd ./.vim/autoload && curl -LSso ./.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Done."
