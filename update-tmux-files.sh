#!/bin/bash

set -e

files='bash_completion_tmux.sh tmux.vim'
url_prefix='https://raw.githubusercontent.com/tmux/tmux/master/examples/'

echo "updating tmux files..."
for f in $files; do
	curl -# -L  "$url_prefix/$f" > ~/".$f"
done
