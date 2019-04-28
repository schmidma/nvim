call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'nelstrom/vim-visual-star-search'
Plug 'majutsushi/tagbar'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'rhysd/clever-f.vim'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'mindriot101/vim-yapf'
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'daeyun/vim-matlab', { 'do': ':UpdateRemotePlugins' }
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

"" mouse all modes
set mouse=a

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

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

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

set shell=$SHELL

set autoread


"""""""""""""""""""""""
""" Visual Settings """
"""""""""""""""""""""""

" set cursorline
" set cursorcolumn

syntax on
set ruler
set number relativenumber

set background=dark

"" Split below and right
set splitbelow
set splitright

"" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

"" Status bar (display always)
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

let no_buffers_menu=1

"" Base16 color
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

"" c, cpp
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


""""""""""""""""
""" Mappings """
""""""""""""""""

"" Navigate properly when lines are wrapped
map <silent> j gj
map <silent> k gk

"" leader save
nnoremap <leader>w :w<CR>

"" Toggle relative numbering
nnoremap <silent><F5> :set relativenumber!<CR>

"" Terminal mode escape
tnoremap <Esc> <C-\><C-n>

"" Split
noremap <Leader>sh :<C-u>split<CR>
noremap <Leader>sv :<C-u>vsplit<CR>

" toggle source header key
nmap <leader><C-I> :call ToggleSourceHeader()<CR>

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


"""""""""""""""""""""""
""" Plugin Settings """
"""""""""""""""""""""""

"" coc.nvim
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
vnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  :CocCommand prettier.formatFile<CR>


"" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_refresh_always = 0

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
" Close scratchpad on insert leave
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

" deoplete tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


"" LanguageClient auto completion for cpp and python
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_serverStderr = '/tmp/LanguageClient_serverStderr.stderr'
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 1
let g:LanguageClient_useVirtualText = 0
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'python3': ['pyls'],
    \ 'cpp': ['ccls', '--log-file=/tmp/ccls.log', '-v=2'],
    \ 'c': ['ccls', '--log-file=/tmp/ccls.log', '-v=2'],
    \ }

nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

"" ALE
let g:ale_c_parse_compile_commands = 1
"let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = "normal"
let g:ale_sign_column_always = 1
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'cpp': ['clangtidy'],
    \ 'c': ['gcc'],
    \ 'fortran': ['gcc'],
    \ 'tex': ['proselint', 'write-good'],
    \ 'markdown': ['proselint', 'write-good'],
    \ }


"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>


"" powerline python
let g:powerline_pycmd='py3'


"" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<CR>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
if getcwd() =~ "nao"
  call add(g:UltiSnipsSnippetDirectories,'/home/schmidma/worktree/hulks/nao/tools/IDEPlugins/NaoSnippets')
endif


"" Tagbar
let g:tagbar_autofocus = 1


"" clever-f
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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
nnoremap <silent> <leader>e :FZF<CR>


"" nvim-gdb
let g:nvimgdb_config_override = {
  \ 'key_next': 'n',
  \ 'key_step': 's',
  \ 'key_finish': 'f',
  \ 'key_continue': 'c',
  \ 'key_until': 'u',
  \ 'key_breakpoint': 'b',
  \ 'key_eval': 'p',
  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
  \ 'split_command': 'split'
  \ }


"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>


"" git-gutter settings
set updatetime=100


"" YAPF (autoformat python)
nnoremap <C-Y> :Yapf --style pep8<CR>


" clang format
nmap <leader>r :ClangFormat<CR>
vmap <leader>r :ClangFormat<CR>
