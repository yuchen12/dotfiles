#!/bin/bash

vim_bundle_dir=~/.vim_bundle
vim_tmpdir=~/.vim_tmp

setup_vim()
{
    # vim related
    [ ! -d $vim_tmpdir ] && (rm -rf $vim_tmpdir && mkdir $vim_tmpdir)

    # vundle
    rm -rf $vim_bundle_dir && mkdir $vim_bundle_dir
    git clone http://github.com/gmarik/vundle.git $vim_bundle_dir/vundle
    vim +BundleInstall +qa
    build_vim_plugins
}

update_vim_plugins()
{
    vim +BundleUpdate +qa
    build_vim_plugins
}

build_vim_plugins()
{
    pushd . > /dev/null
    # build command-t
    cd $vim_bundle_dir/Command-T/ruby/command-t
    ruby extconf.rb
    make -j4

    # build vimproc
    cd $vim_bundle_dir/vimproc
    make -f make_unix.mak

    popd > /dev/null
}

link()
{
    from=$1
    to=$2

    rm -rfv $to && ln -sfv $from $to
}

setup_link()
{
    link $PWD/dotbashrc               ~/.bashrc
    link $PWD/dotbash_aliases.sh      ~/.bash_aliases.sh
    link $PWD/dotgitconfig            ~/.gitconfig
    link $PWD/dotscreenrc             ~/.screenrc
    link $PWD/dottoprc                ~/.toprc
    link $PWD/dotgdbinit              ~/.gdbinit
    link $PWD/git-completion.bash     ~/.git-completion.bash
    link $PWD/git-prompt.sh           ~/.git-prompt.sh
    link $PWD/dotemacs                ~/.emacs
    link $PWD/dottmux.conf            ~/.tmux.conf
    link $PWD/bash_completion_tmux.sh ~/.bash_completion_tmux.sh
    link $PWD/dircolors.256dark       ~/.dircolors
    link $PWD/dotprofile              ~/.bash_profile
    link $PWD/powerline               ~/.config/powerline
    link $PWD/dotvimrc                ~/.vimrc
    link $PWD/dotvim                  ~/.vim
}

install()
{
    setup_link
    setup_vim
}

update()
{
    setup_link
    update_vim_plugins
}

basename=`basename $0`

if [ $basename = "install.sh" ]; then
    install
elif [ $basename = "update.sh" ]; then
    update
fi
