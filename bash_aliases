alias vi=vim
alias diff='diff -u'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ..='cd ..'
alias tree='tree -N'
alias sc=screen
alias ta='tmux -2 a'
alias td='tmux -2 a -d'
alias tml='tmux ls'
alias tmux='tmux -2'
alias tmk='tmux kill-session'
alias by=byobu
alias em=emacs
alias ipy=ipython
alias less='less -R'
alias sudo='sudo ' # to pass aliases through sudo
alias g='git'
#if dir,cd into it. if file ,cd into where the file is
goto(){ [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")"; }
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g

svndiff() {
    svn diff "${@}" | view -
}

print_color_table() {
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

httpless() {
    # pip install httpie
    http --pretty=all --print=hb "$@" | less -R
}
