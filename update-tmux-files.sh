#!/bin/bash

set -e

files='bash_completion_tmux.sh dotvim/syntax/tmux.vim'
url_prefix="http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/examples/"

echo "updating tmux files..."
curl -# -L  "$url_prefix/bash_completion_tmux.sh?format=raw" > ~/.bash_completion_tmux.sh
curl -# -L "$url_prefix/tmux.vim?format=raw" > ~/.vim/syntax/tmux.vim
