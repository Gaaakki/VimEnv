#!/bin/sh
cd ~/VimEnv/vim

sudo yum -y install ncurses-devel lua-devel python-devel perl-devel ruby-devel perl-ExtUtils-Embed
make distclean 
./configure --enable-multibyte --with-tlib=ncurses --enable-cscope --with-features=huge --enable-luainterp --with-lua-prefix=/usr/local/ --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-perlinterp
sudo make 
sudo make install

cd ~
rm .tmux.conf
ln -s ~/VimEnv/tmux/tmux.conf .tmux.conf
rm .vimrc
ln -s ~/VimEnv/.vim/vimrc .vimrc
rm -rf .vim
ln -s ~/VimEnv/.vim .vim

# Install Vundle
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
