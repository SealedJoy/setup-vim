#!/usr/bin/env bash
# SealyJ's vim Setup script

install_vim(){
if [ "$OSTYPE" == 'linux-android' ] ; then
	apt-get install vim-python -y
else
	echo 'Please enter your device OS: '
	echo 'options: arch, debian, ubuntu, other'
        read user_os
	if [ $user_os == "arch" ] ; then
		sudo pacman -S vim -y 
	elif [ $user_os == "debian" ] || [ $user_os == "ubuntu" ] ; then
		sudo apt-get install vim -y
	elif [ $user_os == "other" ] ; then
		echo 'please install vim from your package manager and re-run script'
	fi
fi
}

cat banner.txt
echo 'This script installs VIM with python support and Plugged (plugin manager)'
echo 'it includes powerline status bar, nerdtree file manager, auto suggestions and customisations'

#[[ -n $PY_SITE_PKGS ]] || (echo -e 'powerline-status appears not be installed for user PY_SITE_PKGS must be set with you path to HOME/.local/lib/pythonx.X/site-packages/, you can install with: pip3 install powerline-status --user' && exit 1)

echo 'This will remove any exisitng version of VIM, vim related configs and plugins in ~/.vim/'
echo 'Do you want to continue? Y/N'
read userinput
if [ $userinput != 'Y' ] && [ $userinput != 'y' ] ; then 
	echo 'User cancelled setup'
	exit 1
fi


echo 'removing old data...'
rm -rf ~/.vim && mkdir ~/.vim
rm -f ~/.vimrc


echo 'installing vim'
viminstalled=$(which vim)
if [ ! -z $viminstalled ] ; then
	echo 'vim is already installed - moving on :) '
else
	install_vim
fi

py_support="$(vim --version | grep '+python')"
if [ -z $py_support ] ; then
	echo 'your version of vim does not support python, please reinstall a version that does and rerun script' 
	exit 1
fi



echo 'installing plugin manager'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null 2>&1 || (echo 'failed to get plugin manager exiting...' ; exit 1)

echo 'installing config'
cp -f .vimrc ~/.vimrc 

echo 'installing plugins'
vim +PlugInstall +qall

#echo 'installing jedi autocomplete'
#pip install jedi --user

echo "done! - use vimtutor to get better with vim"
