#!/bin/sh
DEV_DIR_DEFAULT=~/work/dev/
DEV_DIR="${DEV_DIR:-$DEV_DIR_DEFAULT}"

cd $DEV_DIR

tmux rename-window dev
tmux split-window -v
tmux send-keys 'tig' 'C-m'
tmux select-pane -t 0

cd $DEV_DIR

tmux new-window
tmux rename-window build-typescript
tmux send-keys 'watch-ts-toposort.sh' 'C-m'
tmux select-pane -t 0

cd $DEV_DIR/packages/_web

tmux new-window
tmux rename-window web
tmux send-keys 'yarn run dev' 'C-m'
tmux split-window -v
tmux select-layout even-vertical
tmux select-pane -t 0

tmux select-window -t 0
