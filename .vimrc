set nocompatible	" be iMproved, required
filetype off		" required

set number

imap jj <Esc>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'

call vundle#end()	" required
filetype plugin indent on	" required

