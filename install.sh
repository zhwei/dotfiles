#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

echo "create link"
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
	ln -s "$DIR/$i" "$HOME/.$i"
done

echo "Install Vim Plugins"
vim +PluginInstall +qall
