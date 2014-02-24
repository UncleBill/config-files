#!/bin/bash
# vim config files

AWESOME_FILES="rc.lua mymocp.lua personal.lua reload.py"
DOT_FILES=".zshrc .conkyrc .gtkrc-2.0"

if [ ! -d "$HOME/.vim/bundle/" ]; then
    echo "~/.vim/bundle/ doesn't exist. making it"
    mkdir -p ~/.vim/bundle
    echo "Cloning neobundle into ~/.vim/bundle"
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# vim scripts
for file in *.vim
do
    ln -f ${file} ~/.vim/${file}
done
echo "Installed: vim scripts"

# awesomewm config
for f in $AWESOME_FILES; do
    ln -f -s ./dotfiles/$f ~/.config/awesome/$f
done
echo "Installed: $AWESOME_FILES"
ln -f ./dotfiles/zhongguo.lua ~/.config/awesome/themes/zhongguo/zhongguo.lua

# dot files
for f in $DOT_FILES; do
    ln -f -s ./dotfiles/$f ~/$f
done
echo "Installed: $DOT_FILES"
