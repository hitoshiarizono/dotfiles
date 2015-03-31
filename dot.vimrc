set nocompatible
set noswapfile
set nobackup
set number
set ruler
set expandtab
set tw=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
filetype off

set encoding=utf-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
filetype plugin indent on
NeoBundleCheck

set runtimepath+=~/.vim/
runtime! conf.d/*.vim

let fortran_free_source=1
let fortran_fold=1
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1

