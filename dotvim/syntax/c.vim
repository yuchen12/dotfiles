"========================================================
" Highlight All Function
"========================================================
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
"hi cFunction       cterm=bold ctermfg=33 gui=bold guifg=#0087ff
hi cFunction      term=underline cterm=bold ctermfg=38 guifg=skyblue
"hi cComment        cterm=bold ctermfg=0 gui=NONE guifg=#B5A1FF

"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
syn match       cMathOperator     display "[-+\*/%=]"
" C pointer operators
syn match       cPointerOperator  display "->\|\."
" C logical   operators - boolean results
syn match       cLogicalOperator  display "[!<>]=\="
syn match       cLogicalOperator  display "=="
" C bit operators
syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match       cBinaryOperator   display "\~"
syn match       cBinaryOperatorError display "\~="
" More C logical operators - highlight in preference to binary
syn match       cLogicalOperator  display "&&\|||"
syn match       cLogicalOperatorError display "\(&&\|||\)="

" Math Operator
hi cMathOperator            cterm=bold ctermfg=6 guifg=#3EFFE2
hi cPointerOperator         cterm=bold ctermfg=6 guifg=#3EFFE2
hi cLogicalOperator         cterm=bold ctermfg=6 guifg=#3EFFE2
hi cBinaryOperator          cterm=bold ctermfg=6 guifg=#3EFFE2
hi cBinaryOperatorError     cterm=bold ctermfg=6 guifg=#3EFFE2
hi cLogicalOperator         cterm=bold ctermfg=6 guifg=#3EFFE2
hi cLogicalOperatorError    cterm=bold ctermfg=6 guifg=#3EFFE2
