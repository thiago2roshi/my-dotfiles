#!/bin/bash

dotbot
{
	echo "iniciando dotbot"
	cd ~/.dotfiles
	cp dotbot/tools/git-submodule/install .
}
zsh_addon 
{
	echo "instalando tema do zsh 'powerLevel9k'" 
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
}


# let's run
dotbot
zsh_addon
