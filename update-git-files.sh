#!/bin/bash

set -e

url_prefix=https://raw.github.com/git/git/master/contrib/completion

echo "updating git files..."
curl -# -L $url_prefix/git-completion.bash -o ~/.git-completion.bash
curl -# -L $url_prefix/git-prompt.sh -o ~/.git-prompt.sh
