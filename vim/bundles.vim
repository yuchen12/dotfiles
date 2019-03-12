Plug 'tpope/vim-fugitive', { 'external_commands': 'git' }
Plug 'gregsexton/gitv', { 'external_commands': 'git' }
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-dispatch'

Plug 'Lokaltog/vim-easymotion'
Plug 'myusuf3/numbers.vim'

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

if has('nvim')
	Plug 'Shougo/deoplete.nvim'
	Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
else
	Plug 'Shougo/neocomplete'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'Shougo/vimproc', { 'do': 'make' }

Plug 'ctrlpvim/ctrlp.vim'

Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
"Plug 'fholgado/minibufexpl.vim'

Plug 'keith/swift.vim',  { 'for': 'swift' }

Plug 'davidhalter/jedi-vim',  {'for': 'python'}
Plug 'klen/python-mode', {'for': 'python'}
Plug 'vim-scripts/python.vim', {'for': 'python'}
Plug 'vim-scripts/python_match.vim', {'for': 'python'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mattn/emmet-vim',  {'for': ['css', 'html']}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'jansenm/vim-cmake', {'for': 'cmake'}

Plug 'fatih/vim-go', {'for': ['go', 'gohtmltmpl']}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" vim-scripts repos
Plug 'vim-scripts/TaskList.vim', {'on': 'TaskList'}
"Plug 'winmanager'
"Plug 'bufexplorer.zip'

Plug 'vim-scripts/a.vim', {'for': ['c', 'cpp']}
Plug 'Rip-Rip/clang_complete', {'for': ['c', 'cpp']}

Plug 'vim-scripts/CmdlineComplete'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/DrawIt', {'on': 'DrawIt'}
Plug 'vim-scripts/VisIncr'
"Plug 'sudo.vim'
Plug 'vim-scripts/SudoEdit.vim', {'on': ['SudoRead', 'SudoEdit']}
"Plug 'FuzzyFinder'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'

" color scheme
"Plug 'desert-warm-256'
"Plug 'desert256.vim'
"Plug 'desertEx'
"Plug 'altercation/vim-colors-solarized'
"Plug 'Zenburn'
"Plug 'inkpot'
"Plug 'Colorzone'
"Plug 'manuscript.vim'
"Plug 'fisadev/fisa-vim-colorscheme'
Plug 'tomasr/molokai'
"Plug 'xoria256.vim'
