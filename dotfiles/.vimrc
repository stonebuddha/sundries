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

Plugin 'skywind3000/asyncrun.vim'
Plugin 'w0rp/ale'

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

noremap <silent> <leader><cr> :noh<cr>

nnoremap <silent> <f2> :AsyncRun -raw pbcopy < "$(VIM_FILEPATH)"<cr>
nnoremap <silent> <f5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEPATH)"<cr>
nnoremap <f8> :!PATH=/usr/bin /usr/bin/lldb %<<cr>

au Filetype cpp nnoremap <silent> <f9> :AsyncRun g++ -std=c++11 -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" -g -Wall -Wextra -Wconversion -DLOCAL "$(VIM_FILEPATH)" && size "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>


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

" asyncrun
let g:asyncrun_open=6
nnoremap <f10> :call asyncrun#quickfix_toggle(6)<cr>

" ale
let g:ale_linters_explicit=1
let g:ale_completion_delay=500
let g:ale_echo_delay=20
let g:ale_lint_delay=500
let g:ale_echo_msg_format='[%linter%] %code: %%s'
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:airline#extensions#ale#enabled=1

let g:ale_linters = {
			\	'cpp': ['clang'],
			\	'ocaml': ['merlin'],
			\}

let g:ale_cpp_clang_options='-std=c++11 -stdlib=libc++ -Wall -Wextra -Wconversion'

let g:ale_sign_error="✘"
let g:ale_sign_warning="▲"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" merlin
let g:opamshare=substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"
