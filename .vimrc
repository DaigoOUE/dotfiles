set encoding=utf-8
scriptencoding utf-8

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
  let g:deoplete#enable_at_startup = 1


>>>>>>> 67c60c2455417fe0040dc537b67c0ec1b2fce997
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')

  "非同期実行
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  "ファイル操作
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler')

  "TeX
  call dein#add('lervag/vimtex')
  call dein#add('thinca/vim-quickrun')

  "Markdown
  call dein#add('plasticboy/vim-markdown')
  call dein#add('previm/previm')


  "HTML, CSS, Javascript
  call dein#add('mattn/emmet-vim')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-scripts/open-browser.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('othree/html5.vim')
  call dein#add('pangloss/vim-javascript')

  "gnuplot
  call dein#add('vim-scripts/gnuplot-syntax-highlighting')

  "mathematica
  call dein#add('rsmenon/vim-mathematica')

  "Color
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('KeyboardFire/hotdog.vim')
  call dein#add('arcticicestudio/nord-vim')

  "fancy status bar
  call dein#add('itchyny/lightline.vim')
  "get the branch name on github
  call dein#add('tpope/vim-fugitive')

  "Autosave
  call dein#add('907th/vim-auto-save')
  
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"
" deoplete
"
let g:python3_host_prog = '/usr/local/opt/python@3.9'


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
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"-------------------------------
"TeX
"-------------------------------
"Preview
let g:vimtex_view_general_viewer = 'evince'

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
"Markdown
"-------------------------------
let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:vim_markdown_math = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

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
"" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

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


"-------------------------------
"lightline
"-------------------------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'nord',
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
"Unite-outline
"-------------------------------
let g:unite_split_rule = 'botright' 
noremap <Space>u :<C-u>Unite<space>-vertical<space>-winwidth=40<space>outline<CR>

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
colorscheme nord
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

set nocompatible
set backspace=indent,eol,start
set nowrap
set ruler

"sudo忘れた時無理やり保存する
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

set noshowmode
"折り返しなし
set wrap
