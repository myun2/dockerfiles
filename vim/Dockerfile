FROM myun2/alpine-base
LABEL version="8.0.1173"
RUN git clone https://github.com/vim/vim && \
  cd vim && ./configure && make install && rm -rf vim

ENTRYPOINT vim
