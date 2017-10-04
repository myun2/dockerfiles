FROM centos:6

# Update packages
RUN yum update -y && yum upgrade -y

# Install packages
RUN yum install -y gcc gcc-g++ git
RUN yum install -y wget

# Build & Install libevent
RUN wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz && \
  tar -zxvf libevent-2.1.8-stable.tar.gz && \
  cd libevent-2.1.8-stable && \
  ./configure && \
  make install

# Build & Install tmux
RUN yum install -y ncurses-devel
RUN wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6-rc3.tar.gz && \
  tar -zxvf tmux-2.6-rc3.tar.gz && \
  cd tmux-2.6-rc3 && \
  ./configure && \
  make install
RUN ln -s /usr/local/lib/libevent-2.1.so.6 /usr/lib64/libevent-2.1.so.6
RUN rm -rf libevent* tmux*

MAINTAINER myun2
ENTRYPOINT tmux
