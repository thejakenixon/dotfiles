"" install plugin manager thing
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

"" enable vim-plug
call plug#begin()

" colorschemes
Plug 'sainnhe/sonokai'

" Status line
Plug 'itchyny/lightline.vim'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Easy navigation between tmux panes and vim windows
Plug 'christoomey/vim-tmux-navigator'

" Disable highlight after search
Plug 'romainl/vim-cool'

" Sticky headers
Plug 'wellle/context.vim'

" ALE linting
Plug 'dense-analysis/ale'

" Hex colors
Plug 'ap/vim-css-color'
Plug 'shmargum/vim-sass-colors'

call plug#end()

syntax on
if (has('termguicolors'))
	set termguicolors
endif

let g:sonokai_style = 'espresso'
let g:sonokay_better_performance = 1

colorscheme sonokai

"" line highlighting
set cursorline
highlight Cursorline cterm=NONE ctermfg=NONE term=underline
highlight CursorLineNr term=bold cterm=bold ctermfg=3 gui=bold

"" remove color from gutter
highlight clear SignColumn

"" line numbering
set number

"" fix backspace issue
set backspace=indent,eol,start

"" whitespace characters for :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"" ruler at the bottom right
set ruler

"" case insensitive searching
set ignorecase
set smartcase

"" scrolloff, prevent cursor from hitting the end of buffer
set scrolloff=6

"" bashlike filepath tab completion in exec mode
set wildmode=longest,list,full
set wildmenu

"" always show gutter for ale and git gutter
set signcolumn=yes

"" horizontal split always goes to the bottom
set splitbelow

"" virtical split always goes to the right
set splitright


"" Map Nerdtree to CTRL+N
map <C-n> :NERDTreeToggle<CR>
"" Hide help button in NERDTree
" let NERDTreeMinimalUI=1

"" lightline configuration
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'sonokai', }

"" vim-commentary
"" autocmd FileType python setlocal commentstring=#\ %s
"" autocmd FileType vim setlocal commentstring=\"\ %s

"" add columnwidth indicator
set colorcolumn=80

"" add word wrap at 80 columns for markdown files
autocmd FileType markdown setlocal textwidth=80
autocmd FileType markdown setlocal formatoptions+=t
autocmd FileType markdown setlocal wrap linebreak

" cursor shape
if &term =~? 'rxvt' || &term =~? 'xterm' || &term =~? 'st-'
    " 1 or 0 -> blinking block
    " 2 -> solid block
    " 3 -> blinking underscore
    " 4 -> solid underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
    " Insert Mode
    let &t_SI .= "\<Esc>[6 q"
    " Normal Mode
    let &t_EI .= "\<Esc>[2 q"
endif

" speed up insert mode exit
" set noesckeys

let g:ale_fixers = { 
    \ 'markdown': ['prettier'],
    \ 'json': ['prettier'],
    \ 'yaml': ['prettier'],
    \ 'terraform': ['terraform'],
    \ 'python': ['autopep8', 'autoimport'],
    \ 'go': ['trim_whitespace', 'gofmt', 'goimports'],
    \ 'javascript': ['prettier']
    \ }
let g:ale_javascript_prettier_options = '--prose-wrap=always'
let g:ale_fix_on_save = 1

" make tabs make more sense
set autoindent expandtab tabstop=2 shiftwidth=2
