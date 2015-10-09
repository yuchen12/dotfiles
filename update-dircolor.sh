#!/bin/bash

set -e

file=~/.dircolors
url=https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark

echo "updating dirclors files..."
curl -# -L "$url" -o $file

