augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux " tmux config file
    au BufNewFile,BufRead *.stp			setf stap " SystemTap scripts

    " markdown filetype file
    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,mdwn}   setf markdown
    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setf markdown
    au BufRead,BufNewFile *.markdown setf octopress
augroup END
