#!/bin/bash
# vim config files

for file in *.vim
do
    ln -f ${file} ~/.vim/${file}
done

# awesomewm config
ln -f ./dotfiles/rc.lua ~/.config/awesome/rc.lua
ln -f ./dotfiles/zhongguo.lua ~/.config/awesome/themes/zhongguo.lua
ln -f ./dotfiles/.zshrc ~/.zshrc
ln -f ./dotfiles/.conkyrc ~/.conkyrc
