call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'Raimondi/delimitMate' " Closing brackets
" Plug 'jiangmiao/auto-pairs'
Plug 'nelstrom/vim-visual-star-search'
Plug 'majutsushi/tagbar'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'rhysd/clever-f.vim'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
" Plug 'sheerun/vim-polyglot'
" Plug 'Yggdroot/indentLine'
Plug 'xolox/vim-misc'
Plug 'mindriot101/vim-yapf'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --system-libclang --clang-completer' }
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
Plug 'lervag/vimtex'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'

Plug 'rhysd/vim-grammarous'

"" Color
Plug 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call plug#end()            " required



"""""""""""""""""""
""" Basic Setup """
"""""""""""""""""""

"" mouse
set mouse=a

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

set shell=$SHELL

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1


"""""""""""""""""""""""
""" Visual Settings """
"""""""""""""""""""""""

" set cursorline
" set cursorcolumn

"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"

syntax on
set ruler
set number relativenumber

set background=dark

"" Split below and right
set splitbelow
set splitright

set scrolloff=3

"" Status bar (display always)
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

let no_buffers_menu=1

let base16colorspace=256 " Access colors present in 256 colorspace
colorscheme base16-default-dark

let g:airline_theme='base16_default'


"""""""""""""""""""""
""" Abbreviations """
"""""""""""""""""""""

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"" Search mappings: These will make it so that going to the next one in a
"" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
"nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

"" git-gutter settings
set updatetime=100

"""""""""""""""""""""
""" Autocmd Rules """
"""""""""""""""""""""

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

autocmd FileType mail setlocal spell
autocmd FileType mail setlocal spelllang=en,de

set autoread


""""""""""""""""
""" Mappings """
""""""""""""""""

"" Navigate properly when lines are wrapped
map <silent> j gj
map <silent> k gk

"" leader save
nnoremap <leader>w :w<CR>

"" YAPF (autoformat python)
nnoremap <C-Y> :Yapf --style pep8<CR>

"" Toggle relative numbering
nnoremap <silent><F5> :set relativenumber!<CR>

"" Terminal mode escape
tnoremap <Esc> <C-\><C-n>

"" Split
noremap <Leader>sh :<C-u>split<CR>
noremap <Leader>sv :<C-u>vsplit<CR>

" toggle source header key
nmap <leader><C-I> :call ToggleSourceHeader()<CR>

" clang format
nmap <leader>r :ClangFormat<CR>
vmap <leader>r :ClangFormat<CR>

" toggle source header function
function ToggleSourceHeader()
    let extension = expand('%:e')
    if(extension == "hpp")
        let file = expand('%:r') . '.cpp'
        if filereadable(file)
            execute ":e %:r.cpp"
        endif
    elseif(extension == "h")
        let file = expand('%:r') . '.cpp'
        if filereadable(file)
            execute ":e %:r.cpp"
        endif
    elseif(extension == "cpp")
        let file = expand('%:r') . '.hpp'
        if filereadable(file)
            execute ":e %:r.hpp"
        endif
        let file = expand('%:r') . '.h'
        if filereadable(file)
            execute ":e %:r.h"
        endif
     endif
endfunc

"" Tabs
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <silent><leader>t :tabnew<CR>
nnoremap <leader>x :tabclose<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF<CR>

"" YouCompleteMe
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>

"" syntastic errors
nnoremap <leader>ne :lnext<CR>
nnoremap <leader>pe :lprevious<CR>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>

"" Buffer nav
noremap <leader>j :bp<CR>
noremap <leader>k :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

""""""""""""""""""""""
""" Custom configs """
""""""""""""""""""""""

"" c
autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 expandtab

"" html
"" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

"" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

"" python
"" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END


"""""""""""""""""""""""
""" Plugin Settings """
"""""""""""""""""""""""

let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion = 1

"" powerline python
let g:powerline_pycmd='py3'

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<CR>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
if getcwd() =~ "nao"
  call add(g:UltiSnipsSnippetDirectories,'/home/schmidma/worktree/hulks/nao/tools/IDEPlugins/NaoSnippets')
endif

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Tagbar
let g:tagbar_autofocus = 1

" clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 3000

"" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1

" vim-airline
"let g:airline_theme = 'badwolf'
"let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

