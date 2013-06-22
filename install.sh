#!/bin/bash
# vim config files

if [ ! -d "$HOME/.vim/bundle/" ]; then
    echo "~/.vim/bundle/ doesn't exist. making it"
    mkdir -p ~/.vim/bundle
    echo "cloning neobundle into ~/.vim/bundle"
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

for file in *.vim
do
    ln -f ${file} ~/.vim/${file}
done

# awesomewm config
ln -f ./dotfiles/rc.lua ~/.config/awesome/rc.lua
ln -f ./dotfiles/zhongguo.lua ~/.config/awesome/themes/zhongguo.lua
ln -f ./dotfiles/personal.lua ~/.config/awesome/personal.lua

ln -f ./dotfiles/.zshrc ~/.zshrc
ln -f ./dotfiles/.conkyrc ~/.conkyrc
ln -f ./dotfiles/.gtkrc-2.0 ~/.gtkrc-2.0
