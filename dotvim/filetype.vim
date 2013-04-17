augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux " tmux config file
    au BufNewFile,BufRead *.stp			set ft=stap " SystemTap scripts

    " markdown filetype file
    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} set filetype=markdown
augroup END
