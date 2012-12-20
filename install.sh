#!/bin/bash

setup_vim()
{
    # vim related
    ln -svf $PWD/dotvimrc ~/.vimrc
    rm -rf ~/.vim && ln -svf $PWD/dotvim ~/.vim

    tmpdir=~/.vim_tmp
    [ ! -d $tmpdir ] && (rm -rf $tmpdir && mkdir $tmpdir)

    # vundle
    # this is the real folder, ~/.vim/bundle is a symbolic link to this
    bundle_dir=~/.vim_bundle
    rm -rf $bundle_dir && mkdir $bundle_dir
    git clone http://github.com/gmarik/vundle.git $bundle_dir/vundle
    vim +BundleInstall +qa

    pushd . > /dev/null
    # build command-t
    cd $bundle_dir/Command-T/ruby/command-t
    ruby extconf.rb
    make -j4

    # build vimproc
    cd $bundle_dir/vimproc
    make -f make_unix.mak

    popd > /dev/null
}

saved_pwd=$PWD

ln -svf $PWD/dotbashrc ~/.bashrc
ln -svf $PWD/dotbash_aliases.sh ~/.bash_aliases.sh
ln -svf $PWD/dotgitconfig ~/.gitconfig
ln -svf $PWD/dotscreenrc ~/.screenrc
ln -svf $PWD/dottoprc ~/.toprc
ln -svf $PWD/dotgdbinit ~/.gdbinit
ln -svf $PWD/git-completion.bash ~/.git-completion.bash
ln -svf $PWD/git-prompt.sh ~/.git-prompt.sh
ln -sfv $PWD/dotemacs ~/.emacs
ln -sfv $PWD/dottmux.conf ~/.tmux.conf
ln -sfv $PWD/bash_completion_tmux.sh ~/.bash_completion_tmux.sh
ln -sfv $PWD/dircolors.256dark ~/.dircolors

setup_vim
