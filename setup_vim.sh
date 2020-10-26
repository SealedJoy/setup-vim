#!/usr/bin/env bash
# SealyJ's vim Setup script

echo 'installing vim'
android=$(uname -a | grep 'android')
if [ -z $android ] ; then
	apt-get install vim-python -y
else 
	sudo pacman -S vim -y || sudo apt-get install vim -y
#else
#	echo "OS is not supported for this script"
fi

echo 'installing plugin manager'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'installing vim config'
#echo -e python3 from powerline.vim import setup as powerline_setup\npython3 powerline_setup()\npython3 del powerline_setup\nset noshowmode\ncall plug#begin('~/.vim/plugged')\nPlug 'https://github.com/junegunn/vim-github-dashboard.git'\nPlug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }\nPlug 'junegunn/limelight.vim'\nPlug 'vim-scripts/AutoComplPop'\ncall plug#end()\n" Only do this part when compiled with support for autocommands\nif has("autocmd")\naugroup redhat\nautocmd!\n"       " When editing a file, always jump to the last cursor position\nautocmd BufReadPost *\n\ if line("'\"") > 0 && line ("'\"") <= line("$") |\n\   exe "normal! g'\"" |\n\ endif\naugroup END\nendif\n > ~/.vimrc

echo "done! - use vimtutor to get better with vim"
