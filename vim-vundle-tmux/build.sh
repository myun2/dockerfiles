docker build . -t vim-vundle-tmux
VIM_VERSION=8.0.1173
TMUX_VERSION=2.6rc3
BUILD=vim$VIM_VERSION-tmux$TMUX_VERSION
docker tag vim-vundle-tmux myun2/vim-vundle-tmux
docker tag vim-vundle-tmux myun2/vim-vundle-tmux:$BUILD
