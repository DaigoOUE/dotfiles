" vimにutf-8を使ってもらう
set encoding=utf-8
".vimrcのエンコーディングはutf-8だよ
scriptencoding utf-8

language C


"-------------------------------
"dein
"-------------------------------
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand("~/.cache/dein"))
  call dein#begin(expand("~/.cache/dein"))

  call dein#add(expand("~/.cache/dein"))

  "deoplete
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  "非同期実行
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  "ファイル操作
  call dein#add('Shougo/unite.vim')
  call dein#add('lambdalisue/fern.vim')
  call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
  call dein#add('lambdalisue/nerdfont.vim')
  call dein#add('csch0/vim-startify-renderer-nerdfont')


  "TeX
  call dein#add('lervag/vimtex')

  "Markdown
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')
  call dein#add('skanehira/preview-markdown.vim')

  "HTML, CSS, Java script
  call dein#add('mattn/emmet-vim')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-scripts/open-browser.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('othree/html5.vim')
  call dein#add('pangloss/vim-javascript')

  "gnuplot
  call dein#add('vim-scripts/gnuplot-syntax-highlighting')

  "Mathematica
  call dein#add('rsmenon/vim-mathematica')
  
  "colorscheme
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('KeyboardFire/hotdog.vim')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('cocopon/iceberg.vim')

  "fancy status bar
  call dein#add('itchyny/lightline.vim')
  "get the branch name on GitHub
  call dein#add('tpope/vim-fugitive')

  "Autosave
  call dein#add('907th/vim-auto-save')
  
 
  call dein#end()
  call dein#save_state()
endif

" call dein#add(...)をコメントアウトするとプラグイン削除
call map(dein#check_clean(), "delete(v:val, 'rf')")

"ファイルタイプを検出し，それに応じてplugin & indentationをonにする
filetype plugin indent on


"-------------------------------
"Neosnippet
"-------------------------------

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.


"-------------------------------
"TeX
"-------------------------------
"Preview
let g:vimtex_view_general_viewer = 'zathura'
let g:tex_conceal=''

"vimtex setting
let g:tex_flavor = 'latex'
let g:vimtex_indent_enabled = 1

"for latexmk
let g:vimtex_compiler_latexmk = {'callback': 0}
let g:vimtex_compiler_latexmk = {
\ 'background' : 0,
\ 'build_dir' : '',
\ 'callback' : 1,
\ 'continuous' : 1,
\ 'options' : [
\   '-pdfdvi',
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}


"-------------------------------
" Markdown
"-------------------------------
" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1

" preview-markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:preview_markdown_parser = 'glow'
let g:preview_markdown_vertical = 1

" previm
let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:previm_custom_css_path = '~/.cache/dein/repos/github.com/kannokanno/previm/preview/_/css/md.css'
nnoremap <silent> <C-p> :PrevimOpen<CR>


"-------------------------------
"HTML 5 tags
"-------------------------------
syn keyword htmlTagName contained article aside audio bb canvas command
syn keyword htmlTagName contained datalist details dialog embed figure
syn keyword htmlTagName contained header hgroup keygen mark meter nav output
syn keyword htmlTagName contained progress time ruby rt rp section time
syn keyword htmlTagName contained source figcaption
syn keyword htmlArg contained autofocus autocomplete placeholder min max
syn keyword htmlArg contained contenteditable contextmenu draggable hidden
syn keyword htmlArg contained itemprop list sandbox subject spellcheck
syn keyword htmlArg contained novalidate seamless pattern formtarget
syn keyword htmlArg contained formaction formenctype formmethod
syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syn keyword htmlArg contained hidden role
syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"


"-------------------------------
" emmet-vim 
"-------------------------------
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'filters' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END

"-------------------------------
" open-browser.vim 
"-------------------------------
"" open the URL under the cursor
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" google the word under the cursor
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"--------------------------------
"deoplete.vim
"--------------------------------
" Auto start deoplete package.
let g:deoplete#enable_at_startup = 1
" vimtexのオムニ補完をdeopleteから呼び出す
call deoplete#custom#var('omni', 'input_patterns', {
    \ 'tex': g:vimtex#re#deoplete
    \})

"-------------------------------
"lightline
"-------------------------------
" modeを非表示(lightlineをonにしている場合)
set noshowmode 
" set 2 to enable lightline.vim
set laststatus=2 
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \           [ 'gitbranch', 'readonly', 'filename', 'modified' ]]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }
function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


"-------------------------------
" Unite
"-------------------------------
" outline
let g:unite_split_rule = 'botright' 
noremap <Space>u :<C-u>Unite<space>-vertical<space>-winwidth=40<space>outline<CR>


"-------------------------------
" Fern
"-------------------------------
" show the file tree
nnoremap <Space>n :Fern . -reveal=% -drawer -toggle -width=40<CR>
" show hidden files
" let g:fern#default_hidden=1
let g:fern#renderer="nerdfont"


"-------------------------------
" Auto save
"-------------------------------
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode


"-------------------------------
"setting
"-------------------------------
set shell=zsh
set number
set relativenumber
set termguicolors
autocmd ColorScheme * highlight Normal cterm=NONE ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight LineNr cterm=NONE ctermbg=NONE guibg=NONE
colorscheme iceberg
set background=dark
syntax enable
set autoindent "現在の行のインデントをキープしてくれる
"set smartindent "いい感じ(C言語のことをベースにしているらしい)にインデントしてくれる
" <Tab>を押したときのインデント
set tabstop=2
" INSERTでの<CR>や
" NORMALでの>>や<<でのインデント
set shiftwidth=2
set expandtab
set nocursorline
set mouse=a
set title

" following motion can be used across two lines
set whichwrap+=h,l,<,>,[,],b,s,~
" enable backspace in the INSERT mode
set backspace=indent,eol,start
set ruler

" note that wrap option slow down your vim
set wrap
" only wrap at characters given below
set linebreak
set breakat=\ \	;:,.!?
" indent for wrapped lines
set breakindent

" keep the cursor position when use <C-f> etc.
set nostartofline

"-------------------------------
" search
"-------------------------------
" incremental search
set incsearch
" Ignore the case of normal letters.
set ignorecase
" If the search pattern contains upper case characters, override ignorecase option.
set smartcase


"-------------------------------
" key mappings
"-------------------------------
" to previous tab
nnoremap gr gT
" move a tab
nnoremap <Tab>l :+tabmove<CR>
nnoremap <Tab>h :-tabmove<CR>

" sudo忘れた時無理やり保存する
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" spell checker
set nospell
map <F5> :setlocal spell!<CR>

" esc
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
noremap <C-j> <ESC>

" indent
"nnoremap < <<
"nnoremap > >>
xnoremap < <<
xnoremap > >>

"terminal 
noremap <Space>t :term<Space>++rows=25<CR>

" quickfix (cwindow) just after vimgrep
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
