alias vi=vim
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ..='cd ..'
alias tree='tree -N'
alias go='gnome-open'
alias lf='LANG=zh_CN.UTF-8 leafpad'
alias gv='gvim'
alias wine='LANG=zh_CN.utf8 wine'
alias cl='clang'
alias cl++='clang++'
alias mk='make'
alias sc=screen
alias tm=tmux
alias by=byobu
alias em=emacs
alias ipy=ipython
alias less='less -R'
alias sudo='sudo ' # to pass aliases through sudo

function svndiff()
{
    svn diff "${@}" | view -
}

function print_color_table()
{
    # This program is free software. It comes without any warranty, to
    # the extent permitted by applicable law. You can redistribute it
    # and/or modify it under the terms of the Do What The Fuck You Want
    # To Public License, Version 2, as published by Sam Hocevar. See
    # http://sam.zoy.org/wtfpl/COPYING for more details.
    for fgbg in 38 48 ; do #Foreground/Background
        for color in {0..256} ; do #Colors
            #Display the color
            printf "\e[0;${fgbg};5;${color}m%4d\e[0m" ${color}
            printf "\e[1;${fgbg};5;${color}m%4d\e[0m" ${color}
            #Display 10 colors per lines
            if [ $((($color + 1) % 10)) == 0 ] ; then
                echo #New line
            fi
        done
        echo #New line
    done
}
