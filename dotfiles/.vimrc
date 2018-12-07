set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'Raimondi/delimitMate'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'let-def/vimbufsync'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on


set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set magic
set ignorecase
set smartcase
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set cursorline
set cursorcolumn
set encoding=utf-8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set mouse=a
set shiftwidth=2
set tabstop=2
set so=7
set autoindent
set smartindent

syntax on

let mapleader=','
let g:mapleader=','

map <silent> <leader><cr> :noh<cr>

map <f2> :!pbcopy < %<cr>
map <f5> :!chmod +x % && ./%<cr>
map <f8> :!PATH=/usr/bin /usr/bin/lldb %<<cr>

au Filetype cpp map <f9> :!g++ -std=c++11 -o %< -g -Wall -Wextra -Wconversion -DLOCAL % && size %<<cr>


" base16-vim
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

hi Comment	cterm=italic
hi Type			cterm=italic
hi Keyword	cterm=italic

" vim-airline
let g:airline_powerline_fonts=1

" delimitMate
let delimitMate_expand_cr=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='▲'

let g:syntastic_mode_map={"mode":"active","passive_filetypes":["tex","xml"]}

let g:syntastic_cpp_compiler='/usr/bin/clang++'
let g:syntastic_cpp_compiler_options=' -std=c++11 -stdlib=libc++ -Wall -Wextra -Wconversion'

let g:syntastic_python_checkers=['python']

let g:syntastic_ocaml_checkers=['merlin']

" merlin
let g:opamshare=substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"
