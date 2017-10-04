FROM myun2/vim-vundle-tmux
LABEL my_env:version -> 07d54f3

RUN git clone https://github.com/myun2/my_env.git
RUN cd my_env; ./install.sh -y
RUN echo alias vi=vim

#RUN cd my_env; cat aliases/_bash_profile >> ~/.bash_profile
