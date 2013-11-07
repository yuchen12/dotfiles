NeoBundle 'tpope/vim-fugitive', { 'external_commands': 'git' }
NeoBundle 'gregsexton/gitv', { 'external_commands': 'git' }
NeoBundle 'airblade/vim-gitgutter', { 'external_commands': 'git' }
NeoBundle 'kshenoy/vim-signature', { 'external_commands': 'git' }
NeoBundleLazy 'nathanaelkane/vim-indent-guides', {'autoload': {'commands': 'IndentGuidesToggle'} }

NeoBundle 'Lokaltog/vim-easymotion'

NeoBundleLazy 'majutsushi/tagbar', { 'autoload': { 'commands': 'TagbarToggle' } }
NeoBundleLazy 'sjl/gundo.vim', { 'autoload': { 'commands': 'GundoToggle' } }
NeoBundleLazy 'scrooloose/nerdtree', { 'autoload': { 'commands': 'NERDTreeToggle' } }

NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundleLazy 'Shougo/neocomplete', {'autoload': {'insert': 1}}
NeoBundleLazy 'Shougo/neosnippet', {'autoload': {'insert': 1}}

NeoBundle 'Shougo/vimproc', {
            \ 'build': {
            \   'unix': 'make -f make_unix.mak',
            \   'mac': 'make -f make_mac.mak',
            \   },
            \}

NeoBundle 'wincent/Command-T', {
            \'build': {
            \   'unix': 'bash -c "cd ruby/command-t && ruby extconf.rb && make -j4"',
            \   'mac': 'bash -c "cd ruby/command-t && ruby extconf.rb && make -j4"',
            \   },
            \}

NeoBundleLazy 'honza/vim-snippets', {'autoload': {'insert': 1}}
NeoBundle 'tpope/vim-surround'
"NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'sjbach/lusty'

NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': 'python'}}
NeoBundleLazy 'python.vim', {'autoload': {'filetypes': 'python'}}
NeoBundleLazy 'python_match.vim', {'autoload': {'filetypes': 'python'}}
NeoBundleLazy 'pythoncomplete', {'autoload': {'filetypes': 'python'}}

NeoBundle 'Lokaltog/powerline', { 'rtp': '~/.vim_bundle/powerline/powerline/bindings/vim' }

NeoBundleLazy 'mattn/emmet-vim',  {'autoload': {'filetypes': ['css', 'html']} }
NeoBundleLazy 'tangledhelix/vim-octopress', {'autoload': {'filetypes': 'markdown'} }
NeoBundleLazy "elzr/vim-json", {'autoload': {'filetypes': 'json'}}
NeoBundleLazy 'jansenm/vim-cmake', {'autoload': {'filetypes': 'cmake'}}

NeoBundleLazy 'dgryski/vim-godef', {'autoload': {'filetypes': 'go'}}

" vim-scripts repos
NeoBundleLazy 'TaskList.vim', {'autoload': {'commands': 'TaskList'}}
"NeoBundle 'winmanager'
"NeoBundle 'bufexplorer.zip'

NeoBundle 'c.vim'
NeoBundleLazy 'a.vim', {'autoload': {'filetypes': ['c', 'cpp']}}
NeoBundleLazy 'Rip-Rip/clang_complete', {'autoload': {'insert': 1, 'filetypes': ['c', 'cpp']}}

NeoBundle 'CmdlineComplete'
NeoBundle 'YankRing.vim'
NeoBundle 'Align'
NeoBundleLazy 'DrawIt', {'autoload': {'commands': 'DrawIt'}}
NeoBundle 'VisIncr'
NeoBundle 'mru.vim'
"NeoBundle 'sudo.vim'
NeoBundleLazy 'SudoEdit.vim', {'autoload': {'commands': ['SudoRead', 'SudoEdit']}}
"NeoBundle 'FuzzyFinder'

" color scheme
"NeoBundle 'desert-warm-256'
"NeoBundle 'desert256.vim'
"NeoBundle 'desertEx'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'Zenburn'
"NeoBundle 'inkpot'
"NeoBundle 'Colorzone'
"NeoBundle 'manuscript.vim'
"NeoBundle 'fisadev/fisa-vim-colorscheme'
NeoBundle 'tomasr/molokai'
"NeoBundle 'xoria256.vim'
