call plug#begin('~/.local/share/nvim/plugged')

" Typescript syntax errors
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" Typescript highlighting
Plug 'HerringtonDarkholme/yats.vim'

" Autocomplete brackets, braces, and quotes
Plug 'Raimondi/delimitMate'

" Asynchronous Linting
Plug 'w0rp/ale'

" Org Mode
Plug 'jceb/vim-orgmode'

" Speeddating – required for org mode
Plug 'tpope/vim-speeddating'

" RepeatVim
Plug 'tpope/vim-repeat'

" Endwise - add 'end' in Ruby
Plug 'tpope/vim-endwise'

" Javascript syntax
Plug 'pangloss/vim-javascript'

" JSX syntax
Plug 'mxw/vim-jsx'

" Tree explorer
Plug 'scrooloose/nerdtree'

" Close Vim tags
Plug 'alvan/vim-closetag'

" Ag commands (similar to built in grep ones)
Plug 'rking/ag.vim'

" Stylus syntax highlighting
Plug 'wavded/vim-stylus'

" Show git diffs in the gutter
Plug 'airblade/vim-gitgutter'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Ctrl-P (for buffer switching)
Plug 'ctrlpvim/ctrlp.vim'

" Snippets
Plug 'SirVer/ultisnips'

" Use supertab to unify all completers under tab
Plug 'ervandew/supertab'

" Nginx syntax highlighting
Plug 'chr4/nginx.vim'

" OpenSCAD syntax highlighting
Plug 'sirtaj/vim-openscad'

" Code completion
" Run `:CocInstall coc-json coc-tsserver` to install extensions.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python indentation
Plug 'Vimjas/vim-python-pep8-indent'

" Python syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Tokyo Night theme
Plug 'folke/tokyonight.nvim'

" Treesitter!
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Status line
Plug 'hoob3rt/lualine.nvim'

call plug#end()

let g:tokyonight_style = "night"
colorscheme tokyonight

" Turn off folding by default
set nofoldenable

"Write the old file out when switching between files.
set autowrite

"Set up delimitMate configurations
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
let mapleader = ","
let maplocalleader = "\\"

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=1000

"Switch between buffers without saving
set hidden

"Turn line number ON with highlighting
set number
set cursorline

"Tab stuff
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Allow many types of line endings
set fileformats=unix,mac,dos

"Show command in bottom right portion of the screen
set showcmd

"Indent stuff
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=-2

"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1t

"No beeping
set visualbell

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"Hide mouse when typing
set mousehide

"Allow mouse use in vim
set mouse=a

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Closes a buffer in a vertical split without closing the split
nnoremap <leader>d :bp\|bd #<CR>

"Split windows below the current window.
set splitbelow

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,curdir,help

"Saves time; maps the spacebar to colon
nmap <space> :

"Copying in Vim copies to system clipboard
set clipboard=unnamed

" More useful command-line completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

"Make backspace work like most other apps
set backspace=indent,eol,start

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

":source $MYVIMRC reloads the saved .vimrc
:nmap <leader>s :source $MYVIMRC

":e $MYVIMRC opens the .vimrc for editing
:nmap <leader>e :e $MYVIMRC

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Disable Ex-mode
nnoremap Q <nop>

" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
set backup " enable backup

" Keep the cursor n lines from the edge of the buffer.
set scrolloff=10

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Sort selection when ,s is pressed in visual mode.
vmap <leader>s :sort<CR>

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign))

" show matching brackets
set showmatch

" Start NERDTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Reveal current file in NerdTree
nmap <leader>n :NERDTreeFind<CR>

" Close NERDTree upon opening a file
let NERDTreeQuitOnOpen=1

" Show dotfiles
let NERDTreeShowHidden=1

" Ignore files in NERDTree viewer
let NERDTreeIgnore = ['\.pyc$']

" Needed for closetag.vim plugin
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.jsx,*.tsx"

" Make ag.vim search from the project root instead of working dir
let g:ag_working_path_mode="r"

nnoremap <C-p> :FZF<cr>

let g:ale_linter_aliases = {
\   'typescriptreact': 'typescript',
\}

" Only use the autopep8 linter
let g:ale_linters = {
\   'python': ['autopep8'],
\   'typescript': ['tslint', 'tsserver'],
\   'typescriptreact': ['tslint', 'tsserver'],
\}

let g:ale_fixer_aliases = {
\   'typescriptreact': 'typescript',
\}

let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'ruby': ['rubocop'],
\   'python': ['black'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format']
\}


" Ale will overwrite files with changes
let g:ale_fix_on_save = 1

let g:ale_typescript_prettier_use_local_config = 1

",i shows Ale detail
:nmap <leader>i :ALEDetail<CR>

" Always use block cursor
set guicursor=

let g:javascript_plugin_jsdoc = 1

let g:ctrlp_map=''

" ,b should open Ctrl-P buffer
nmap <leader>b :CtrlPBuffer<CR>

" Use tab to autocomplete deoplete entries
let g:SuperTabDefaultCompletionType = "<c-n>"

" Ultisnip trigger configuration. Do not use <tab> or it will conflict with
" deoplete.
let g:UltiSnipsExpandTrigger="<c-j>"

" Define where UltiSnips looks for snippets
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let g:pyindent_open_paren = '&sw'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    section_separators = '',
    component_separators = ''
  },
}
EOF
