#!/bin/bash

url=https://raw.githubusercontent.com/phoenixlzx/imouto.host/master/imouto.host.txt
hosts=/etc/hosts

echo "updating hosts files..."
sudo cp $hosts $hosts.bak
sudo sed -i '/#+BEGIN/,/#+END/d' $hosts
curl $url | sed -e '1 s/^\xef\xbb\xbf//' -e 's/\r$//g' | sudo tee -a $hosts >/dev/null
