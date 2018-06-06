call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'Raimondi/delimitMate' " Closing brackets
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
" Plug 'Yggdroot/indentLine'
Plug 'xolox/vim-misc'
Plug 'mindriot101/vim-yapf'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'

"" Color
Plug 'altercation/vim-colors-solarized'

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
let mapleader=','

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

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

syntax on
set ruler
set number relativenumber

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

set t_Co=256

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

let g:indentLine_color_term = 239
let g:indentLine_enabled = 0


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

set autoread


""""""""""""""""
""" Mappings """
""""""""""""""""

"" YAPF (autoformat python)
nnoremap <C-Y> :Yapf --style pep8<CR>

"" Toggle relative numbering
nnoremap <silent><F5> :set relativenumber!<CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" toggle source header key
nmap <C-I><C-I> :call ToggleSourceHeader()<CR>

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
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

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
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

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

" let g:matlab_auto_mappings = 0 "automatic mappings disabled

let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion = 1

"" powerline python
let g:powerline_pycmd='py3'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Tagbar
let g:tagbar_autofocus = 1

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
"let g:airline_theme = 'powerlineish'
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"wintab stuff
"let g:wintabs_use_powerline = 1
"let g:wintabs_ui_active_buffer_higroup = "WintabsActiveBuffer"
"let g:wintabs_ui_active_buffer_changed_higroup = "WintabsActiveBufferChanged"
"let g:wintabs_ui_inactive_buffer_higroup = "WintabsInactiveBuffer"
"let g:wintabs_ui_active_tab_higroup = "WintabsActiveTab"
"let g:wintabs_ui_inactive_tab_higroup = "WintabsInactiveTab"
"let g:wintabs_ui_show_vimtab_name = 2
