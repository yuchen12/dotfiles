#!/bin/bash

set -e

files='git-completion.bash git-prompt.sh'
url_prefix=https://raw.github.com/git/git/master/contrib/completion

for file in $files; do
    wget "$url_prefix/$file" -O "$file"
done

[ -n "`git status -s -- $files`"  ] && git commit -s -m "update git files: `date +%Y-%m-%d`" $files

exit 0
