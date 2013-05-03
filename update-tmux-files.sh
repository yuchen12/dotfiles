#!/bin/bash

set -e

files='bash_completion_tmux.sh dotvim/syntax/tmux.vim'
place_holder='<XXX_FILE_XXX>'
url_format="http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/examples/$place_holder?format=raw"

for file in $files; do
    name=${file##*/}
    url=`echo "$url_format" | sed "s/$place_holder/$name/"`
    wget "$url" -O "$file"
done

[ -n "`git status -s -- $files`"  ] && git commit -s -m "update tmux files: `date +%Y-%m-%d`" $files

exit 0
