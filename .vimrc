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
let g:neobundle#log_filename = $HOME . "/neobundle.log"

"TeX
NeoBundle 'vim-latex/vim-latex.vim'
"vim-latex
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
""let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/pdflatex -synctex=1
"-interaction=nonstopmode -file-line-error-style $*'
""let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/lualatex -synctex=1
-interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/luajitlatex -synctex=1
"-interaction=nonstopmode -file-line-error-style $*'
""let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/xelatex -synctex=1
-interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/local/bin/ps2pdf $*.ps'
"let g:Tex_CompileRule_ps = '/Library/TeX/texbin/dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_CompileRule_dvi = '/Library/TeX/texbin/uplatex -synctex=1
"-interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_BibtexFlavor = '/Library/TeX/texbin/upbibtex'
"let g:Tex_MakeIndexFlavor = '/Library/TeX/texbin/upmendex $*.idx'
"let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_pdf = 'Skim'
""let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
""let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXShop.app'
"let g:Tex_ViewRule_pdf = '/Applications/TeXworks.app/Contents/MacOS/TeXworks'
""let g:Tex_ViewRule_pdf =
'/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Firefox.app'
""let g:Tex_ViewRule_pdf = '/usr/bin/open -a "Adobe Reader.app"'
"let g:Tex_ViewRule_pdf = '/usr/bin/open'


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
