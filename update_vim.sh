#!/bin/bash

# vim related
bundle_dir=~/.vim_bundle

vim +BundleInstall! +qa

# tweak for bufexplorer
sed -i 's/call s:BEError("Escaped")/"&/g' $bundle_dir/bufexplorer.zip/plugin/bufexplorer.vim

pushd .
# build command-t
cd $bundle_dir/Command-T/ruby/command-t
make clean
ruby1.8 extconf.rb
make -j4

# build vimproc
cd $bundle_dir/vimproc
make -f make_unix.mak clean
make -f make_unix.mak
popd > /dev/null
