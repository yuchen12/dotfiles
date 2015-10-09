#!/bin/bash

set -e

url_prefix='https://raw.githubusercontent.com/tmux/tmux/master/examples/'

echo "updating tmux files..."
curl -# -L  "$url_prefix/bash_completion_tmux.sh" -o ~/.bash_completion_tmux.sh
curl -# -L  "$url_prefix/tmux.vim" -o ~/.vim/syntax/tmux.vim
