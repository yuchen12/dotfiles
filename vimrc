" vim: fdm=marker foldlevel=0

" Author: Wang Zhen

" neobundle settings {{{1
" ===================================

filetype off
filetype plugin indent off

let g:neobundle#install_process_timeout = 900

set nocompatible
if has('vim_starting')
    set rtp+=~/.vim_bundle/neobundle
endif
call neobundle#begin(expand('~/.vim_bundle'))

NeoBundleFetch 'Shougo/neobundle.vim', {'name': 'neobundle'}

if filereadable(expand("~/.vim/bundles.vim"))
    source ~/.vim/bundles.vim
endif

call neobundle#end()

filetype plugin indent on
syntax enable
syntax on

NeoBundleCheck

" colors {{{1
" ===================================
if &term =~ "xterm\\|screen"
    " 256 color
    set t_Co=256
    set t_AB=[48;5;%dm
    set t_AF=[38;5;%dm
endif

if has("gui_running")
    "set background=dark
    silent! colorscheme molokai
    set guioptions-=T
elseif &t_Co == 256
    set background=dark
    "let g:molokai_original = 1
    let g:rehash256=1
    silent! colorscheme molokai
end

" hi {{{2
hi diffAdded ctermfg=31 guifg=#268bd2
hi diffRemoved ctermfg=161 guifg=#d30102
hi ToDo cterm=bold ctermfg=9 ctermbg=226 gui=standout guibg=#eeee00 guifg=#ff4500

" popup menu
hi Pmenu term=standout cterm=none ctermfg=0 ctermbg=250 guifg=#000000 guibg=#bcbcbc
hi PmenuSel cterm=bold ctermfg=234 ctermbg=174 gui=bold guifg=bg guibg=#df8787
hi PMenuSbar guifg=#ededed guibg=#202020 guisp=#202020 gui=NONE ctermfg=255 ctermbg=255 cterm=NONE
hi PMenuThumb guifg=#dbdbdb guibg=#303030 guisp=#303030 gui=NONE ctermfg=253 ctermbg=35 cterm=NONE

hi SpecialKey guifg=#30302b guibg=NONE guisp=#343434 gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE

hi cMathOperator            cterm=bold ctermfg=6 guifg=#3EFFE2
hi cPointerOperator         cterm=bold ctermfg=6 guifg=#3EFFE2
hi cLogicalOperator         cterm=bold ctermfg=6 guifg=#3EFFE2
hi cBinaryOperator          cterm=bold ctermfg=6 guifg=#3EFFE2
hi cBinaryOperatorError     cterm=bold ctermfg=6 guifg=#3EFFE2
hi cLogicalOperator         cterm=bold ctermfg=6 guifg=#3EFFE2
hi cLogicalOperatorError    cterm=bold ctermfg=6 guifg=#3EFFE2
"hi cFunction                term=underline cterm=bold ctermfg=148 guifg=skyblue
hi! link cFunction Function
hi PreCondit cterm=bold ctermfg=160

" set {{{1
" ===================================
let g:did_install_default_menus = 1 " avoid sourcing stupid menu.vim

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent smartindent
set wrapmargin=4

set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set nobackup
set noswapfile
set ruler           " show the cursor position all the time
set ttyfast         " smoother changes
set lazyredraw
set showcmd         " display incomplete commands
set incsearch hlsearch
set ignorecase smartcase

set number          " use myusuf3/numbers.vim to intelligently toggling line numbers

set matchpairs+=<:> " show matching <> as well
set updatetime=1000
set hidden          " allow buffers to go into the background without needing to save
set mouse=a         " In many terminal emulators the mouse works just fine, thus enable it.
set shortmess+=I
set notimeout
set ttimeout
set ttimeoutlen=10

set fileformat=unix
set fileformats=unix,dos,mac
set nopaste
set title           " change the terminal's title
set wildmenu
set wildignorecase
set wildmode=list:longest,full
set autowrite
set tags=tags;/
set nowrap
set scrolloff=5
set foldenable
set foldlevelstart=10
set foldnestmax=10
set fdm=syntax
set laststatus=2
set pastetoggle=<F3>
set report=0

"set cursorline
augroup CursorLineOnlyInActiveWindow
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set wildignore+=*.o,*.obj,*.pyc,*.class
set wildignore+=*~,*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=.git,.svn,CVS,.hg

set infercase
set display=lastline,uhex " when a line is long, don't omit it in @
set autoread

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

"When joining lines, don't insert a space between two multi-byte characters.
set formatoptions+=Blj

set history=1000

if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    set undodir=~/.vim_tmp
endif

set completeopt=menu,menuone,longest

set list
set listchars=tab:\|.,extends:>,nbsp:.,precedes:<,trail:• "eol:¶

au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" automatically rebalance windows on vim resize
au VimResized * :wincmd =

" Convenient command to see the difference between the current buffer and the file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis

:runtime! ftplugin/man.vim " :Man 3 printf

if exists('$TMUX')
    set ttymouse=xterm2
endif

" encoding {{{2
let &termencoding=&encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr
set encoding=utf-8
set fileencoding=utf-8
"set termencoding=utf-8

let g:C_MapLeader=','
let C_MapLeader=','
let mapleader=','
let g:mapleader=','

" map {{{1
nnoremap ; :
nnoremap <Leader>; ;
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Quick alignment of text
nnoremap <Leader>al :left<CR>
nnoremap <Leader>ar :right<CR>
nnoremap <Leader>ac :center<CR>

" Find merge conflict markers
noremap <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

nmap <silent> <leader>df :DiffOrig<cr>

nmap <silent> <esc><esc> :silent nohlsearch<CR>
nmap <silent> <leader>rr :redraw!<cr> " Fast redraw

" Easier moving in tabs and windows
" The lines conflict with the default digraph mapping of <C-K>
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Don't use Ex mode, use Q for formatting
map Q gq

nnoremap Y y$
nnoremap <space> za

" select last inserted text
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" quickfix
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

" file type {{{1
set cinoptions=:0,g0,l1,(0,w0,W4,t0,N-s

" c/c++ header include guard
function! s:insert_include_guard()
    let guard_name = substitute(toupper(expand("%:t")), "\\-\\|\\.", "_", "g") . '_' . "INCLUDED__"
    execute "normal! i#ifndef " . guard_name
    execute "normal! o#define " . guard_name
    execute "normal! o\n<+TYPE HERE+>\n"
    execute "normal! Go#endif /* " . guard_name . " */"
    normal! kk
endfunction

augroup configgroup
    au!
    au FileType text setlocal textwidth=78 " For all text files set 'textwidth' to 78 characters.

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    au FileType diff setlocal fdm=diff

    au FileType json setlocal foldmethod=syntax

    au FileType qf setlocal wrap

    au BufNewFile *.c 0r ~/.vim/templates/main.c
    au BufNewFile *.{cpp,cc} 0r ~/.vim/templates/main.cpp
    au BufNewFile *.{h,hpp} call <SID>insert_include_guard()

    au BufNewFile *.py 0r ~/.vim/templates/main.py
    au FileType python setlocal foldmethod=indent
    let python_highlight_all = 1

    au BufNewFile *.sh 0r ~/.vim/templates/main.sh

    au FileType ruby setlocal sw=2
    au BufNewFile *.rb 0r ~/.vim/templates/main.rb

    au FileType go setlocal noexpandtab
    au BufNewFile *.go 0r ~/.vim/templates/main.go
augroup END

" plugins {{{1
" ===================================
" NERDTree {{{2
"Used by winmanager
let g:NERDTree_title = "[NERDTree]"
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', 'CVS']
let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeHightCursorline=1
"let NerdTreeShowLineNumbers=1
let NERDTreeStatusline=1
let NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1
let NERDChristmasTree=1
"let NERDTreeKeepTreeInNewTab=1
"nmap <silent> <leader>ww :NERDTreeToggle <CR>
nmap <silent> <leader>ww :NERDTreeTabsToggle <CR>
nmap <leader>nt :NERDTreeFind<CR>

" NERDCommenter {{{2
let g:NERDCustomDelimiters = {
    \ 'c': { 'left': '//' },
    \ }

" Tagbar {{{2
nnoremap <silent> <leader>gg :TagbarToggle<CR>
let g:tagbar_auto_showtag=1
let g:tagbar_autofocus=1
let g:tagbar_usearrows=1
let g:tagbar_sort=0
"let g:tagbar_ctags_bin='/usr/bin/ctags'
" support gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" https://github.com/majutsushi/tagbar/wiki#rust
 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

" clang_complete {{{2
let g:clang_auto_select=0
let g:clang_complete_auto=0
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_close_preview=1
let g:clang_trailing_placeholder=0
"let g:clang_exec="clang"
let g:clang_user_options="-std=c++14"
let g:clang_complete_macros=1
let g:clang_complete_patterns=1
let g:clang_auto_user_options="path, .clang_complete, compile_commands.json"
let g:clang_use_library=1
if has('mac')
    let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
else
    for dir in ['/usr/local/lib', '/usr/lib']
        if filereadable(dir . '/libclang.so')
            let g:clang_library_path=dir
            break
        endif
    endfor
endif

if has('conceal')
    let g:clang_conceal_snippets=1
endif

" TaskList {{{2
map <leader>td :TaskList<CR>

" python-mode {{{2
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_rope_guess_project = 0
let g:pymode_rope=0
let g:pymode_doc = 0

" jedi=vim {{{2
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_definitions_command = '<leader>gd'
let g:jedi#usages_command = '<leader>gu'
let g:jedi#goto_assignments_command = '<leader>ga'
let g:jedi#rename_command = '<leader>gr'

" neocomplete {{{2
let g:neocomplete#disable_auto_complete=0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 0
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#enable_cursor_hold_i = 0
let g:neocomplete#cursor_hold_i_time = 300
let g:neocomplete#enable_insert_char_pre = 0
let g:neocomplete#enable_prefetch = 0
let g:neocomplete#skip_auto_completion_time='0.6'
let g:neocomplete#enable_auto_delimiter = 0
let g:neocomplete#data_directory = '~/.vim_tmp/.neocon'
let g:neocomplete#max_list = 100
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#diable_auto_select_buffer_name_pattern = '\[Command Line\]'

" For auto select.
let g:neocomplete#enable_complete_select = 1
try
    let completeopt_save = &completeopt
    set completeopt+=noinsert,noselect
catch
    let g:neocomplete#enable_complete_select = 0
finally
    let &completeopt = completeopt_save
endtry

let g:neocomplete#force_overwrite_completefunc = 1

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::\w*'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns._ = '[0-9a-zA-Z:#_]\+'

" Enable omni completion
au FileType python setlocal omnifunc=jedi#completions
"if has('python3')
"    au FileType python setlocal omnifunc=python3complete#Complete
"else
"    au FileType python setlocal omnifunc=pythoncomplete#Complete
"endif

au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType ruby setlocal omnifunc=rubycomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:neocomplete#sources#tags#cache_limit_size = 500000

" key maps {{{3
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" <C-f>, <C-b>: page move.
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"

" paste
inoremap <expr><C-y> pumvisible() ? neocomplete#close_popup() : "\<C-r>\""
" close popup
inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() : "\<End>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" <C-n>:
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
" <C-p>: keyword completion.
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"

"inoremap <expr>'  pumvisible() ? neocomplete#close_popup() : "'"
inoremap <expr><C-x><C-f> neocomplete#start_manual_complete('file')

" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <silent> <expr><CR> delimitMate#WithinEmptyPair() ?
            \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
            \ "\<C-r>=<SID>my_cr_function()<CR>"

inoremap <silent> <expr><BS> delimitMate#WithinEmptyPair() ?
            \ "\<C-R>=delimitMate#BS()\<CR>" :
            \ neocomplete#smart_close_popup() . '<BS>'

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><s-CR> pumvisible() ? neocomplete#close_popup() "\<CR>" : "\<CR>"

" }}}3
" neosnippet {{{2
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.vim_bundle/vim-snippets/snippets,~/.vim/snippets'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"
" For snippet_complete marker.
"if has('conceal')
"    set conceallevel=2 concealcursor=i
"endif

" syntastic {{{2
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'passive_filetypes': ['c', 'cpp', 'python', 'java'] }
let g:syntastic_cpp_compiler_options=' -std=c++11 -Wall -Wextra'
let g:syntastic_cpp_config_file = '.__config'
let g:syntastic_check_on_wq = 0

hi SyntasticErrorSign cterm=bold ctermfg=160
hi SyntasticWarningSign cterm=bold ctermfg=11

nnoremap <silent> <Leader>sk :SyntasticCheck<CR>

" ctrlp {{{2
nnoremap <silent> <Leader>ff :CtrlP<CR>
nnoremap <silent> <Leader>bb :CtrlPBuffer<CR>
nnoremap <silent> <Leader>mm :CtrlPMRUFiles<CR>
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|o|a|d|jpg|jpeg|png|bmp|gif)$',
            \ }
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" airline {{{2
let g:airline_theme='kalisi'
set noshowmode
let g:airline_inactive_collapse=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '<'
let g:airline_left_alt_sep=">"
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = 'LN'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tagbar#flags='f'
let g:airline#extensions#whitespace#trailing_format = 'trail[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mix[%s]'
let g:airline_powerline_fonts=0

if !has("gui_running")
    let g:airline_theme_patch_func = 'AirlineThemePatch'
    function! AirlineThemePatch(palette)
        if g:airline_theme == 'kalisi'
            let a:palette.normal_modified = {
                        \ 'airline_c': ['', '', 197, '', ''],
                        \}
            let a:palette.insert_modified = a:palette.normal_modified
            let a:palette.replace_modified = a:palette.normal_modified
            let a:palette.visual_modified = a:palette.normal_modified
            let a:palette.inactive_modified = a:palette.normal_modified
        endif
    endfunction
endif

" yankring {{{2
let g:yankring_history_dir='$HOME/.vim_tmp'
nnoremap <Leader>yr :YRShow<CR>

" vim-signify {{{2
let g:signify_mapping_toggle = '<leader>gt'
"let g:signify_disable_by_default = 1
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_mapping_toggle_highlight = '<leader>gh'
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_sign_overwrite = 1

" vim-go {{{2
au Filetype go nnoremap <leader>gv :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>gs :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>gd :tab split <CR>:exe "GoDef"<CR>
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_snippet_engine = 'neosnippet'
let g:go_fmt_fail_silently = 1 " use syntasitic to check errors
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"

" racer {{{2
let g:racer_cmd = expand("~/.vim_bundle/racer/target/release/racer")
let $RUST_SRC_PATH = expand("~/sources/rust/src")

" rust {{{2
let g:rust_recommanded_style = 1
let g:rust_fold = 1

" emmet-vim {{{2
let g:user_emmet_install_global=0
au FileType html,css EmmetInstall
"let g:user_emmet_expandabbr_key='<C-e>'
let g:user_emmet_settings = {
            \ 'php' : {
            \ 'extends' : 'html',
            \ 'filters' : 'c',
            \ },
            \ 'xml' : {
            \ 'extends' : 'html',
            \ },
            \ 'haml' : {
            \ 'extends' : 'html',
            \ },
            \}
" vim-markdown {{{2
let g:vim_markdown_folding_disabled=1

" delimitMate {{{2
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_matchpairs = "(:),[:],{:}"
"imap <C-f> <Plug>delimitMateS-Tab

" }}}1
