" Author: Wang Zhen

" neobundle 设置 {{{1
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

" }}}1

" 颜色相关设置 {{{1
" ===================================
if &term =~ "xterm\\|screen"
    " 256 color
    set t_Co=256
    set t_AB=[48;5;%dm
    set t_AF=[38;5;%dm
endif
" 主题设置 {{{2
if has("gui_running")
    "set background=dark
    silent! colorscheme molokai
    set guioptions-=T
    set guifont=Droid\ Sans\ Mono\ 12
    set guifontwide=Microsoft\ Yahei\ 12,WenQuanYi\ Zen\ Hei\ 12
elseif &t_Co == 256
    set background=dark
    "let g:molokai_original = 1
    let g:rehash256=1
    silent! colorscheme molokai
end
" hi设置 {{{2
hi diffAdded ctermfg=31 guifg=#268bd2
hi diffRemoved ctermfg=161 guifg=#d30102
"hi cursorline term=standout,bold cterm=bold ctermfg=None ctermbg=23 gui=bold " 高亮光标所在行
"hi Normal ctermbg=None
hi ToDo cterm=bold ctermfg=9 ctermbg=226 gui=standout guibg=#eeee00 guifg=#ff4500

" 自动补全弹出菜单颜色设置
hi Pmenu term=standout cterm=none ctermfg=0 ctermbg=250 guifg=#000000 guibg=#bcbcbc
hi PmenuSel cterm=bold ctermfg=234 ctermbg=174 gui=bold guifg=bg guibg=#df8787
hi PMenuSbar guifg=#ededed guibg=#202020 guisp=#202020 gui=NONE ctermfg=255 ctermbg=255 cterm=NONE
hi PMenuThumb guifg=#dbdbdb guibg=#303030 guisp=#303030 gui=NONE ctermfg=253 ctermbg=35 cterm=NONE

" 高亮特殊字符
hi SpecialKey guifg=#30302b guibg=NONE guisp=#343434 gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE

"hi WildMenu term=standout cterm=standout ctermfg=95 ctermbg=230 guifg=gray guibg=gray17

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

" 高亮行尾的空格
"au BufEnter,InsertEnter,InsertLeave * 2match WhitespaceEOL /\s\+$/
"highlight WhitespaceEOL ctermbg=red guibg=red

" }}}1

" set相关 {{{1
" ===================================
" 一般设置 {{{2
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup
set noswapfile
set ruler           " show the cursor position all the time
set ttyfast         " smoother changes
set lazyredraw
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set ignorecase
set smartcase       " 当搜索字符中包含大写字母时，大小写敏感
set sw=4            " shiftwidth
"set et              " expandtab
set noexpandtab
set nu              " show line number
set wm=4            " wrapmargin
set ts=4            " tabstop
set smarttab        " smarttab
set softtabstop=4
set matchpairs+=<:> " show matching <> as well
set updatetime=1000
set hidden          " allow buffers to go into the background without needing to save
set mouse=a         " In many terminal emulators the mouse works just fine, thus enable it.
set shortmess+=I
set notimeout
set ttimeout
set ttimeoutlen=10

if exists('$TMUX')
    set ttymouse=xterm2
endif

set fileformat=unix
set fileformats=unix,dos,mac
set nopaste
set smartindent
set title " change the terminal's title
set wildmenu
set wildmode=list:longest,full
set autowrite
set hlsearch
set ai              " autoindent
set si              " smartindent
set tags=tags;/
set nowrap
set so=5            " Set 5 lines to curors - when moving vertical..
set fdm=marker
auto FileType c,cpp,python,go set fdm=syntax
auto FileType diff set fdm=diff
set foldlevelstart=999
set laststatus=2
set pastetoggle=<F3>
set report=0
set cursorline      " 高亮当前行
set wildignore+=*.o,*.obj,*.pyc,*.class
set wildignore+=*~,*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=.git,.svn,CVS,.hg
set infercase
set display=lastline " when a line is long, don't omit it in @
set autoread

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])


"When joining lines, don't insert a space between two multi-byte characters.
set formatoptions+=Blj

set history=1000

if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    set undodir=~/.vim_tmp
endif

"au BufWritePost *.go execute 'Lint' | cwindow
set completeopt=menu,menuone,longest

set list
set listchars=tab:\|.,extends:>,nbsp:.,precedes:<,trail:• "eol:¶

autocmd FileType text setlocal textwidth=78 " For all text files set 'textwidth' to 78 characters.

" 打开文件时自动跳到上次退出时光标所在位置
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"autocmd BufEnter * lcd %:p:h " 自动切换到当前文件所在目录

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Convenient command to see the difference between the current buffer and the file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis

:runtime! ftplugin/man.vim " :Man 3 printf
" 编码设置 {{{2
let &termencoding=&encoding
" vim解析文件时尝试的编码格式顺序列表
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr
set encoding=utf-8  " vim内部使用的字符编码格式
set fileencoding=utf-8  " vim识别出来的文件的编码格式
"set termencoding=utf-8

" map leader {{{2
let g:C_MapLeader=','
let C_MapLeader=','
let mapleader=','
let g:mapleader=','

" map {{{2
nnoremap ; :
nnoremap <Leader>; ;
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

"nnoremap j gj
"nnoremap k gk
"
" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" delete trailing whitespaces
"nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Quick alignment of text
nnoremap <Leader>al :left<CR>
nnoremap <Leader>ar :right<CR>
nnoremap <Leader>ac :center<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

nmap <silent> <leader>df :DiffOrig<cr>

" use ,n to turn off highlighting
nmap <silent> <leader>n :silent noh<CR>
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

au BufNewFile,BufRead *.json set ft=json

" C/C++ 相关设置 {{{2
set cinoptions=:0,g0,l1,(0,w0,W4,t0,N-s
autocmd BufNewFile *.c 0r ~/.vim/templates/main.c
autocmd BufNewFile *.go 0r ~/.vim/templates/main.go
autocmd BufNewFile *.{cpp,cc} 0r ~/.vim/templates/main.cpp
autocmd BufNewFile *.{h,hpp} call <SID>insert_include_guard() " C/C++ include guard

" c/c++ include guard {{{3
function! s:insert_include_guard()
    let guard_name = substitute(toupper(expand("%:t")), "\\-\\|\\.", "_", "g") . '_' . "INCLUDED__"
    execute "normal! i#ifndef " . guard_name
    execute "normal! o#define " . guard_name
    execute "normal! o\n<+TYPE HERE+>\n"
    execute "normal! Go#endif /* " . guard_name . " */"
    normal! kk
endfunction

" python 相关设置 {{{2
autocmd BufNewFile *.py 0r ~/.vim/templates/main.py
au FileType python setlocal foldmethod=indent
let python_highlight_all = 1

" shell {{{2
autocmd BufNewFile *.sh 0r ~/.vim/templates/main.sh

" ruby {{{2
au FileType ruby set sw=2
autocmd BufNewFile *.rb 0r ~/.vim/templates/main.rb

" quickfix {{{2
au QuickfixCmdPost make call QfMakeConv() " 编码转换
" 在有错误时自动打开quickfix窗口
"au QuickFixCmdPost [^l]* nested cwindow
"au QuickFixCmdPost l* nested cwindow
" QfMakeConv {{{3
function! QfMakeConv()
    let qflist = getqflist()
    for i in qflist
        let i.text = iconv(i.text, "C", "utf-8")
    endfor
    call setqflist(qflist)
endfunction
nmap <F6> :cn <cr>
nmap <F7> :cp <cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

" }}}1

" 插件设置 {{{1
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
" open Tabbar automatically on Vim startup only if opening Vim with a supported file/files
"autocmd VimEnter * nested :call tagbar#autoopen()
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
let g:clang_user_options="-std=c++11"
let g:clang_use_library=1
if has('mac')
    let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
    if isdirectory(s:clang_library_path)
        let g:clang_library_path=s:clang_library_path
    endif
else
    for dir in ['/usr/local/lib', '/usr/lib']
        if filereadable(dir . '/libclang.so')
            let g:clang_library_path=dir
            break
        endif
    endfor
endif
let g:clang_complete_macros=1
let g:clang_complete_patterns=1
let g:clang_auto_user_options="path, .clang_complete, compile_commands.json"

if has('conceal')
    let g:clang_conceal_snippets=1
endif

" TaskList {{{2
map <leader>td :TaskList<CR>

" Gundo {{{2
map <leader>gu :GundoToggle<CR>


" python-mode {{{2
let g:pymode_lint_checker = "pyflakes"
let g:pymode_rope_guess_project = 0
let g:pymode_rope=0

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
let g:neocomplete#sources#omni#input_patterns.php =
            \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

let g:neocomplete#force_omni_input_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns._ = '[0-9a-zA-Z:#_]\+'

" Enable omni completion
if has('python3')
    au FileType python setlocal omnifunc=python3complete#Complete
else
    au FileType python setlocal omnifunc=pythoncomplete#Complete
endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" <C-n>:
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
" <C-p>: keyword completion.
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"

"inoremap <expr>'  pumvisible() ? neocomplete#close_popup() : "'"
inoremap <expr><C-x><C-f> neocomplete#start_manual_complete('file')

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction "}}}

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

" vim-signify
let g:signify_mapping_toggle = '<leader>gt'
"let g:signify_disable_by_default = 1
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_mapping_toggle_highlight = '<leader>gh'
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_sign_overwrite = 1

" json {{{2
au FileType json setlocal foldmethod=syntax

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

" }}}1

" Use local vimrc if available {{{1
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }}}1
