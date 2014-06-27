#!/bin/bash

set -e
set -o pipefail

bj_url="https://smarthosts.googlecode.com/svn/trunk/hosts"
us_url="https://smarthosts.googlecode.com/svn/trunk/hosts_us"
begin_marker="SmartHosts START"
end_marker="SmartHosts END"

url=$bj_url
hosts=/etc/hosts
tmp_hosts=$(mktemp)
chmod 644 $tmp_hosts
filters= # "GitHub" "Google\ Services"

sed "/$begin_marker/,/$end_marker/d" $hosts > $tmp_hosts

echo "Downloading hosts from $url"
wget --quiet $url -O - | dos2unix -q | sed -n "/$begin_marker/,/$end_marker/p" >> $tmp_hosts

for f in $filters; do
    sed -i '/'"$f"' START/,/'"$f"' END/d' $tmp_hosts
    echo "Filtered $f"
done

cp -v $hosts $hosts.bak
mv -v $tmp_hosts $hosts
