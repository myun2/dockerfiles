FROM alpine
MAINTAINER myun2

RUN apk update
RUN apk add gcc g++ make

# Update Certificates
RUN apk add ca-certificates wget \
  && update-ca-certificates

# Build & Install libevent
RUN wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz && \
  tar -zxvf libevent-2.1.8-stable.tar.gz && \
  cd libevent-2.1.8-stable && \
  ./configure && \
  make install

# Dependent curses
RUN apk add ncurses-dev

# Build & Install tmux
RUN wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6-rc3.tar.gz && \
  tar -zxvf tmux-2.6-rc3.tar.gz && \
  cd tmux-2.6-rc3 && \
  ./configure && \
  make install
RUN rm -rf libevent* tmux*

ENTRYPOINT tmux
