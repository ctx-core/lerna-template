#!/bin/sh
DEV_DIR_DEFAULT=~/work/dev/
DEV_DIR="${DEV_DIR:-$DEV_DIR_DEFAULT}"

cd $DEV_DIR
tmux rename-window dev
tmux split-window -v $SHELL
tmux send-keys 'tig' 'C-m'
tmux select-pane -t 0

cd $DEV_DIR
tmux new-window $SHELL
tmux rename-window build-typescript
tmux send-keys 'tsc-build.sh -w' 'C-m'
tmux select-pane -t 0

cd $DEV_DIR/packages/_web
tmux new-window $SHELL
tmux rename-window web
tmux send-keys 'yarn run dev' 'C-m'
tmux split-window -v $SHELL
tmux select-layout even-vertical
tmux select-pane -t 0

tmux select-window -t 0
