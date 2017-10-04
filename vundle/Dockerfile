FROM myun2/vim
LABEL version="vim-8.0.1173"
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
COPY vimrc root/.vimrc
RUN vim +PluginInstall +qall
ENTRYPOINT vim
