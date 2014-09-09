#!/bin/bash

url=https://raw.githubusercontent.com/phoenixlzx/imouto.host/master/imouto.host.txt
hosts=/etc/hosts

cp $hosts $hosts.bak
sed -i '/#+BEGIN/,/#+END/d' $hosts
curl $url | sed -e '1 s/^\xef\xbb\xbf//' -e 's/\r$//g' >> $hosts
