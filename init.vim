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
Plug 'w0rp/ale'
"Plug 'ncm2/float-preview.nvim'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'daeyun/vim-matlab', { 'do': ':UpdateRemotePlugins' }
Plug 'lervag/vimtex'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'liuchengxu/vim-which-key'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'

Plug 'rhysd/vim-grammarous'

"" Color
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'

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

" smaller update time for git gutter and Hover of coc
set updatetime=100

"" Directories for swp files
set nobackup
set nowritebackup
set noswapfile

set fileformats=unix,dos,mac

set shell=$SHELL

set autoread

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c


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

set cmdheight=2

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" always show signcolumns
set signcolumn=yes

let no_buffers_menu=1

let g:airline_theme='base16_default'
set termguicolors     " enable true colors support
colorscheme base16-default-dark
let base16colorspace=256 " Access colors present in 256 colorspace


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
"debug coc.nvim
"let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <c-space> :call CocAction('diagnosticInfo')<CR>


" Use `[c` and `]c` to navigate diagnostics
nnoremap <silent> [c <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <leader>rn :<C-u>call CocActionAsync('rename')<CR>
nnoremap <leader>qf :<C-u>call CocActionAsync('doQuickfix')<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')


"" ALE
let g:ale_c_parse_compile_commands = 1
let g:ale_lint_on_text_changed = "normal"
let g:ale_sign_column_always = 1
let g:ale_linters = {
    \ 'cpp': ['clangtidy'],
    \ }


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
nnoremap <silent> <F4> :TagbarToggle<CR>


"" clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 3000


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


"" YAPF (autoformat python)
nnoremap <C-Y> :Yapf --style pep8<CR>

" clang format
nmap <leader>f :ClangFormat<CR>
vmap <leader>f :ClangFormat<CR>
