#!/bin/sh

sudo pwd
tmux new-session -d 'sudo php artisan serv --host 127.0.0.1 --port 8080 -vvv'
tmux split-window -v '~/dotfiles/bin/ngrok 127.0.0.1:8080'
tmux split-window -h
tmux -2 attach-session -d
