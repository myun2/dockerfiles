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
