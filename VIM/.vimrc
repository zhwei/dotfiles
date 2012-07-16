"zhwei自写版
"============
"==============================================

syntax on

"自动补齐空格
set cindent shiftwidth=4
set cinoptions+={2
filetype indent on
set autoindent shiftwidth=3
set background=dark
colorscheme desert256


"标点符号自动补全
""==============================================
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function! ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
 else
     return a:char
 endif
endfunction

"==============================================


"常见设置
"===============================================
set nu
set smarttab
set background=dark
set nocompatible
set showtabline=1
setlocal noswapfile
syntax on
set foldcolumn=2
set nobackup
set shortmess=atI
set report=0
" set noerrorbells
set showmatch
set matchtime=5
set hlsearch
set incsearch
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set scrolloff=3
" set novisualbell
set laststatus=2
" set formatoptions=tcrqn
set formatoptions+=mM
" set formatoptions+=tcroqn2mBM1
set autoindent
set smartindent
set langmenu=zh_CN.UTF-8
set helplang=cn
set cindent
set imcmdline
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set showmode
set nocp
set showcmd
set ttyfast
"set ruler
" set nowrap
set smarttab
set lbr
filetype plugin indent on
filetype off

"替代键
"===============================================
inoremap jj <ESC>

"================================================

"编码方式
"================================================
"chinese
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,chinese,latin-1
let &termencoding=&encoding
"set fileencoding=utf-8
"set termencoding=utf-8
"================================================



"插件
"================================================

set nocompatible
filetype on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 

Bundle 'gmarik/vundle'  
Bundle 'SuperTab'   
Bundle 'git://github.com/scrooloose/nerdtree.git'   
Bundle 'git://github.com/msanders/snipmate.vim.git'   
Bundle 'vimwiki'  
Bundle 'VimIM'  
Bundle 'AuthorInfo'  
Bundle 'git://github.com/scrooloose/nerdcommenter.git'  
Bundle 'git://github.com/mattn/zencoding-vim.git'  
Bundle 'git://github.com/tpope/vim-rails.git'  
Bundle 'git://github.com/kien/ctrlp.vim.git'


"================================================




"plugin setting
"================================================


"supertab

let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"==============================================
""NERDTree plugin

  let NERDTreeWinPos = "left" "where NERD tree window is placed on the screen

"let NERDTreeWinSize = 31 "size of the NERD tree
	
 nmap <F7> <ESC>:NERDTreeToggle<RETURN>" Open and close the NERD_tree.vim separately

"==============================================
