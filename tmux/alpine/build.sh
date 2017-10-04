docker build . -t tmux -f Dockerfile
docker tag tmux myun2/tmux
docker tag tmux myun2/tmux:2.6-rc3-alpine
