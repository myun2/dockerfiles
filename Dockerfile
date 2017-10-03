FROM centos:6

# Update packages
RUN yum update -y && yum upgrade -y

# Install packages
RUN yum install -y gcc gcc-g++ git

# Install RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash -s stable
ENV PATH $PATH:/bin:/usr/local/rvm/bin

# Install Ruby 2.4
RUN rvm install 2.4
RUN /bin/bash -l -c "rvm use default 2.4; gem install bundler"
RUN echo "2.4" > .ruby-version

RUN yum install -y wget curl

# Install Tmux
RUN wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz && \
  tar -zxvf libevent-2.1.8-stable.tar.gz && \
  cd libevent-2.1.8-stable && \
  ./configure && \
  make install

RUN wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6-rc3.tar.gz && \
  tar -zxvf tmux-2.6-rc3.tar.gz && \
  cd tmux-2.6-rc3 && \
  ./configure && \
  make install
RUN ln -s /usr/local/lib/libevent-2.1.so.6 /usr/lib64/libevent-2.1.so.6
RUN rm -rf libevent* tmux*

RUN /bin/bash -l -c "rvm use default 2.4; gem install heroku && heroku update"
RUN rvm alias create default 2.4

RUN yum install -y xz && wget https://nodejs.org/dist/v6.11.3/node-v6.11.3-linux-x64.tar.xz && \
  xz -d node-v6.11.3-linux-x64.tar.xz && \
  tar -xvf node-v6.11.3-linux-x64.tar && \
  mv node-v6.11.3-linux-x64 /opt/node/
ENV PATH $PATH:/opt/node/bin
RUN rm node-v6.11.3-linux-x64.tar
