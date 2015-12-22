# vim: ft=sh et

alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'
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
alias hd='hexdump -C'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1] if len(sys.argv) > 1 else raw_input());"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1] if len(sys.argv) > 1 else raw_input());"'

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

#if dir,cd into it. if file ,cd into where the file is
goto(){ [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")"; }
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g

svndiff() {
    svn diff "${@}" | view -
}

print_color_table() {
    for fgbg in 38 48 ; do #Foreground/Background
        for color in {0..256} ; do #Colors
            #Display the color
            printf "\e[0;${fgbg};5;${color}m%4d\e[0m" ${color}
            printf "\e[1;${fgbg};5;${color}m%4d\e[0m" ${color}
            #Display 10 colors per lines
            if [ $(((color + 1) % 10)) == 0 ] ; then
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

gocd() { cd `go list -f '{{.Dir}}' $1`; }

# Create a data URL from a file
dataurl() {
	local typ=$(file -b --mime-type "$1");
	if [[ $typ == text/* ]]; then
		typ="${typ};charset=utf-8";
	fi
	echo "data:${typ};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

