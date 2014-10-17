set nocompatible
set encoding=utf-8
set history=1000
set noai
set ts=2
set shiftwidth=2
set shiftround
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set scrolloff=10
set sidescrolloff=10
set expandtab
set ttyfast
set number
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}][TYPE=%Y][ASCII=\%03.3b][HEX=\%02.2B][POS=%04l,%04v][LEN=%L]
set hlsearch
set shortmess=atI
set showmatch
set vb t_vb=
set t_Co=256
set incsearch
set autoindent

set modelines=0
set showmode
set showcmd
set ignorecase
set smartcase
set textwidth=79
set autoread
set hidden
set list
set listchars=tab:>·,trail:·
set diffopt=filler,iwhite
set formatoptions=qrn1
set directory=~/.tmp
set wildmenu
set wildmode=list:longest,full

filetype off
syntax enable
execute pathogen#infect()
filetype plugin indent on
"set background=dark
let g:custom_termcolors=256
colorscheme custom
retab

" set the mapleader key
let mapleader = ";"

" oops perms
"cmap w!! <silent> w !sudo tee % > /dev/null

" NerdTree shortcut to current working dir
nnoremap <leader>nt :execute 'NERDTreeToggle ' . getcwd()<cr>
let g:NERDTreeWinSize = 21

" RuboCop shortcut
nnoremap <leader>R :RuboCop<cr>

" fix j & k movements
nnoremap j gj
nnoremap k gk

" set jjj to <esc> in insert mode
inoremap jjj <Esc>

" disable F1 help menu
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" save when losing focus
au FocusLost * :wa

" clear search buffer
nnoremap <leader><space> :noh<cr>

" tab finds matching pairs (){}[]
nnoremap <tab> %
vnoremap <tab> %

" Make the haters mad, disable the arrow keys in all modes
" Even worse, remap arrow keys to scroll through buffers while we
" are at it
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <right> <ESC>:bn<RETURN>
noremap <left> <ESC>:bp<RETURN>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <right> <ESC>:bn<RETURN>
inoremap <left> <ESC>:bp<RETURN>

vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
vnoremap <right> <ESC>:bn<RETURN>
vnoremap <left> <ESC>:bp<RETURN>

" setup vim (github) flavored markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" setup ctags & gem-ctags
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
      \ pathogen#split(&tags) +
      \ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))


" Functions!!

" Useful to mark some code lines as debug statements
function! MarkDebug()
       let cline = line(".")
       let ctext = getline(cline)
       call setline(cline, ctext . "#__DEBUG__")
endfunction

" Easily remove debug statements
function! RemoveDebug()
       %g/#__DEBUG__/d
endfunction

" randoms

" Add Debug shortcut
nnoremap <leader>ma <Esc>:call MarkDebug()<CR>
nnoremap <leader>md <Esc>:call RemoveDebug()<CR>

" Add leader cmd to run ruby code
map <leader>r :!clear;ruby %<cr>
