augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
    au BufNewFile,BufRead *.json setf json
    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,mdwn,markdown}   setf markdown
augroup END
