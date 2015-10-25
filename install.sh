#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

echo "### Update Submodules"
git submodule init
git submodule update

echo "### Create Link"
targets=(
"vim"
"vimrc"
"oh-my-zsh"
"zshrc"
"gitconfig"
"ideavimrc"
"tmux.conf"
)

for i in ${targets[@]}
do
	src="$DIR/$i"
	dst="$HOME/.$i"
	if [[ -d $dst ]] || [[ -f $dst ]]
	then
		read -p "Are you sure overwrite old '.$i' (y/N):" -n 1 -r
		echo    # (optional) move to a new line
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			rm -rf "$dst"
			ln -s "$src" "$dst"
			echo "$src => $dst"
		else
			echo "pass .$i"
		fi
	else
		ln -s "$DIR/$i" "$dst"
		echo "$src => $dst"
	fi
done

echo "Install Vim Plugins"
vim +PluginInstall +qall
