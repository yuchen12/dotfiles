#!/bin/bash

set -e

file=~/.dircolors
url=https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark

curl -L "$url" > $file

