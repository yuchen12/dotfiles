#!/bin/bash

set -e

files='dircolors.256dark'
url_prefix=https://raw.github.com/seebi/dircolors-solarized/master

for file in $files; do
    wget "$url_prefix/$file" -O "$file"
done

[ -n "`git status -s -- $files`"  ] && git commit -s -m "update dircolors.256dark: `date +%Y-%m-%d`" $files

exit 0
