if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/daigooue/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/Users/daigooue/.vim/after,/Users/daigooue/.cache/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/daigooue/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/daigooue/.cache/dein'
let g:dein#_runtime_path = '/Users/daigooue/.cache/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/daigooue/.cache/dein/.cache/.vimrc'
let &runtimepath = '/Users/daigooue/.vim,/usr/share/vim/vimfiles,/Users/daigooue/.cache/dein/repos/github.com/Shougo/vimproc.vim,/Users/daigooue/.cache/dein,/Users/daigooue/.cache/dein/.cache/.vimrc/.dein,/usr/share/vim/vim80,/Users/daigooue/.cache/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/Users/daigooue/.vim/after,/Users/daigooue/.cache/dein/repos/github.com/Shougo/dein.vim'
