FROM centos:6
MAINTAINER myun2

# Update packages
RUN yum update -y && yum upgrade -y

# Install packages
RUN yum install -y gcc gcc-g++ git
RUN yum install -y ncurses-devel

LABEL version="8.0"
RUN git clone https://github.com/vim/vim
RUN cd vim && ./configure && make install

ENTRYPOINT vim
