#!/bin/bash

set -e

url_prefix=https://raw.github.com/git/git/master/contrib/completion

curl -L $url_prefix/git-completion.bash > ~/.git-completion.bash
curl -L $url_prefix/git-prompt.sh > ~/.git-prompt.sh
