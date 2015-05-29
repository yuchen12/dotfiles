# vim: ft=sh et

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [[ "$OSTYPE" =~ darwin* ]]; then
    # for mac brew coreutils
    COREUTILS_PREFIX=$(brew --prefix coreutils)
    PATH="$COREUTILS_PREFIX/libexec/gnubin:$PATH"
    export MANPATH="$COREUTILS_PREFIX/libexec/gnuman:$MANPATH"

    # ccache
    PATH=/usr/local/opt/ccache/libexec:$PATH
else
    LOCAL=$HOME/local

    # LD_LIBRARY_PATH is bad
    # http://xahlee.info/UnixResource_dir/_/ldpath.html
    # http://linuxmafia.com/faq/Admin/ld-lib-path.html
    # https://blogs.oracle.com/ali/entry/avoiding_ld_library_path_the
    # http://stackoverflow.com/questions/882110/gurus-say-that-ld-library-path-is-bad-whats-the-alternative
    #[ -d $LOCAL/lib ]           && export LD_LIBRARY_PATH=$LOCAL/lib:$LD_LIBRARY_PATH
    #[ -d $LOCAL/lib64 ]         && export LD_LIBRARY_PATH=$LOCAL/lib64:$LD_LIBRARY_PATH

    [ -d $LOCAL/bin ]           && export PATH=$LOCAL/bin:$PATH
    [ -d $LOCAL/lib/pkgconfig ] && export PKG_CONFIG_PATH=$LOCAL/lib/pkgconfig:$PKG_CONFIG_PATH
    [ -d $LOCAL/share/man ]     && export MANPATH=$LOCAL/share/man:$MANPATH

    for path in $LOCAL /usr/local /usr; do
        if [ -d $path/lib/ccache ]; then
            export PATH=$path/lib/ccache:$PATH
            break
        fi
    done
    unset LOCAL
fi

if [ -d $HOME/gopath ]; then
    export GOPATH=$HOME/gopath
    export PATH=$GOPATH/bin:$PATH
    export CDPATH=.:$GOPATH/src
fi

for dir in $HOME/go /usr/local/go; do
    if [ -f $dir/bin/go ]; then
        export PATH=$dir/bin:$PATH
        break
    fi
done

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi

    if [ -f "$HOME/.bashrc.local" ]; then
        . "$HOME/.bashrc.local"
    fi
fi
