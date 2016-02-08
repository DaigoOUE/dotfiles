"pathogen
execute pathogen#infect()

"neobundle
if has('vim_starting')
  set nocompatible
  if !isdirectory(expand("~/dotfiles/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
let g:neobundle_default_git_protocol='https'

NeoBundle 'Shougo/unite.vim'

"LaTeX
NeoBundle 'lervag/vimtex'
NeoBundle 'thinca/vim-quickrun'

"ruby
"コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
"静的解析
NeoBundle 'scrooloose/syntastic'
"ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
"メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'
"自動で閉じる
NeoBundle 'tpope/vim-endwise'

call neobundle#end()
NeoBundleCheck

"-------------------------------
"Rsense
"-------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1
"--------------------------------
"neocomplete.vim
"--------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
 let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
"--------------------------------
"rubocop
"--------------------------------
"syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
"active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

"setting
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
set mouse=a

"display title
set title
