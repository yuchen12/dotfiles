augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux " tmux config file
    au BufNewFile,BufRead *.stp			setf stap " SystemTap scripts

    " markdown filetype file
    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,mdwn,markdown}   setf markdown
augroup END
