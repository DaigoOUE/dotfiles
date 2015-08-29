if has('vim_starting')
  set nocompatible
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone
    git://github.com/Shougo/neobundle.vim
    ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files
file<CR>
nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer
file_mru bookmark file<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j>
unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j>
unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l>
unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l>
unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
NeoBundleCheck
call neobundle#end()
filetype plugin indent on

execute pathogen#infect()

set number
colorscheme hybrid
let g:hybrid_use_Xresources = 1 
syntax on
filetype plugin indent on
set background=dark
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
