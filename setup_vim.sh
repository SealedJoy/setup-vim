#!/usr/bin/env bash
# SealyJ's vim Setup script
echo 'installing vim'
android=$(uname -a | grep 'android')
if [ ! -z $android ] ; then
	echo android detected
	apt-get install vim-python -y
else 
	sudo pacman -S vim -y || sudo apt-get install vim -y
fi

py_support=$(vim --version | grep +python)
[[ -z $py_support ]] && (echo 'your version of vim does not support python, please reinstall a version that does and rerun script' && exit 1)
echo 'installing plugin manager'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null 2>&1 || echo 'failed to get plugin manager'

cp -f .vimrc ~/.vimrc && echo 'installed vim config'

echo "done! - use vimtutor to get better with vim"
