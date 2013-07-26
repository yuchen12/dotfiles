#!/bin/sh

#CFLAGS='-g -O0' CPPFLAGS='-I/usr/include/python3.3m -I/usr/include/i386-linux-gnu/python3.3m' \
#CPPFLAGS='-I/usr/include/python3.3m -I/usr/include/i386-linux-gnu/python3.3m' \
./configure \
--with-features=huge \
--with-compiledby="Yuchen" \
--enable-multibyte \
--enable-rubyinterp \
--enable-perlinterp \
--enable-pythoninterp \
--enable-python3interp \
--enable-luainterp \
--with-luajit \
--enable-gpm \
--enable-cscope \
--enable-fontset \
--enable-fail-if-missing
