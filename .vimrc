" Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" ---------------------------------------------------------------------------
""""" Syntax highlight
autocmd BufRead,BufNewFile *.mustache set filetype=html
autocmd BufRead,BufNewFile *.hbs set filetype=html

" ---------------------------------------------------------------------------
""""" Settings for taglist.vim
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
" map <F4> :TlistToggle<cr>
set autochdir
set tags=tags;
" ---------------------------------------------------------------------------
""""" Settings for jshint2.vim
let jshint2_save = 1
" ---------------------------------------------------------------------------
""""" Settings for tagbar.vim
map <F4> :TagbarToggle<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
let g:tagbar_autofocus = 1
" ---------------------------------------------------------------------------
""""" Settings for nerdtree.vim

map <C-n> :NERDTreeToggle<CR>

"CONTROL P"
" search in .git/.hg if it exists, else the current working directory.
" (default is 'ra' which also searches in parent of current file, rarely
" what you want, especially if you're editing ~/.vimrc or browsing help)
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = '\v[\/](vendor|build|rates.bookit.com|node_modules|bower_components|dist|tmp)|(\.(swp|ico|git|svn))$'

" ---------------------------------------------------------------------------
""""" Just some shortcuts
iab db! echo '<pre>';<CR>var_dump();<cr>echo '</pre>';<ESC>bbbbb
iab comm /**<CR><CR>/<Up>
iab docs /*********<CR><CR>*********/<Up>
set hlsearch
set number
set ignorecase
set cursorline

set autoindent noexpandtab tabstop=4 shiftwidth=4
"set softtabstop=4 shiftwidth=4 expandtab
