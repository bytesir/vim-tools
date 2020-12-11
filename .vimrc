set nocompatible
set enc=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gb2312,gbk,big5,latin1

set nu!
set ruler
set nobackup
set undofile
set undodir=~/.cache/vimfiles/undodir
if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
endif 

set ts=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

set autoindent
set cindent

syntax enable
syntax on
filetype off

set t_Co=256
colorscheme molokai


" Vundle manage
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on


" cscope: F5 search C token, F6 search string, F7 search function called
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb

	if filereadable("cscope.out")
		cs add cscope.out
	endif

	set csverb
endif

nmap <silent> <F5> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F6> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F7> :cs find c <C-R>=expand("<cword>")<CR><CR>


" Tagbar: auto open tagbar
let g:tagbar_width=25
autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()


" NERDTree 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeWinSize=25
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>


" ALE
let g:ale_sign_column_always=1
let g:ale_sign_error='×'
let g:ale_sign_warning='w'
let g:ale_statusline_format=['w %d', '! %d', '√ OK']
let g:ale_echo_msg_format='[%linter%] %code: %%s'
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_c_gcc_options='-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options='-Wall -O2 -std=c++17'
let g:ale_c_cppcheck_options=''
let g:ale_cpp_cppcheck_options=''


" YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'


" vim-gutentags
let g:gutentags_project_root=['.root', '.git', '.svn', '.hg', '.project', '.idea', '.vscode']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/vimfiles/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_ctags_extra_args=['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args+=['--c++-kinds=+px']
let g:gutentags_ctags_extra_args+=['--c-kinds=+px']

