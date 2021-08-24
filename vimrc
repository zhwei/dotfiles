"
"Author: zhwei
"

syntax on
filetype plugin indent on

"
"自动补齐空格
set cindent shiftwidth=4
set cinoptions+={2
set autoindent shiftwidth=3
set background=dark
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

"解决konsole 256 色显示问题
set t_Co=256
set t_ZH=[3m
let g:solarized_termcolors=256

"
"映射快捷键
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
let mapleader = ","  " 映射leader键为逗号
inoremap jj <ESC>
map ,pa :setlocal paste! <cr>
" switch between buffer or tab
nmap <TAB> :bn <cr>
nmap <S-TAB> :bp <cr>

"
"常见设置
set nu
set cul " 高亮当前行
set numberwidth=1
set background=dark
set nocompatible
set foldcolumn=2
set nobackup
set shortmess=atI
set report=0
setlocal noswapfile
set backspace=2 " make backspace work like most other apps
set nofoldenable

"
" 下面两条配置使得tab显示为 >--- ,行尾空格显示为+
set list
set listchars=trail:+,tab:>-

set autoread " 自动加载文件
set showmatch
set matchtime=5
set hlsearch
set incsearch
set scrolloff=3
set laststatus=2
set formatoptions+=mM
set autoindent
set smartindent
set langmenu=zh_CN.UTF-8
set helplang=cn
set cindent
set imcmdline

"
" tab setting
set smarttab
set tabstop=4
set shiftwidth=4
set showtabline=1
set softtabstop=4
set lbr " 不断开单词
set nocp
set showcmd
set ttyfast
set showmode

"
" tab size
autocmd FileType python,c,sql,scala,rs setlocal et sta sw=4 sts=4
autocmd FileType html,vim,tex,json setlocal et sta sw=2 sts=2
autocmd FileType html,htmldjango,css,js,coffee setlocal et sta sw=2 sts=2


"单词补全字典
set dictionary+=/usr/share/dict/words

"
"编码方式

"chinese
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,chinese,latin-1
let &termencoding=&encoding


"插件
"

set nocompatible
filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'SuperTab'
Plugin 'mattn/emmet-vim'
Plugin 'go.vim'
Plugin 'wting/rust.vim'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'suan/vim-instant-markdown'
Plugin 'derekwyatt/vim-scala'
Plugin 'sjl/gundo.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'fs111/pydoc.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tmatilai/vim-monit'
Plugin 'kien/ctrlp.vim.git'
Plugin 'Glench/Vim-Jinja2-Syntax.git'
Plugin 'scrooloose/nerdtree.git'
" Plugin 'msanders/snipmate.vim.git'
Plugin 'scrooloose/nerdcommenter.git' " 注释插件
Plugin 'davidhalter/jedi-vim'
"Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'alfredodeza/pytest.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'digitaltoad/vim-jade'
Plugin 'HerringtonDarkholme/jedi-syntax'
"Plugin 'scrooloose/syntastic'


call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""
" some function
"""""""""""""""""""""""""""

"
"new python file add encodings config
autocmd BufNewFile *.py, exec ":call SetTitle()" 
func SetTitle() 
  if &filetype == 'python'
    call setline(1,"# -*- coding: utf-8 -*-")
    call setline(2,"# Created by zhwei on ".strftime('%Y-%m-%d %H:%M:%S'))
    exec "2"
  endif
  autocmd BufNewFile * normal G
endfunc

"
" Run file
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java' 
    exec "!javac %" 
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    exec "!export PYTHONPATH=`pwd` && time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'go'
    " exec "!go build %<"
    exec "!time go run %"
  endif
endfunc



"""""""""""""""""""""""""""""
"plugin setting
"""""""""""""""""""""""""""""


""NERDTree plugin
"
nmap <F7> <ESC>:NERDTreeToggle<RETURN>" Open and close the NERD_tree.vim separately
let NERDTreeWinPos = "left" "where NERD tree window is placed on the screen
let NERDTreeIgnore=['^__pycache__$', ]

" go.vim
"
au BufRead,BufNewFile *.go set filetype=go


" vim.markdown
"
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd


"gundo 可视化 Vim 的撤销列表
"
map <leader>g :GundoToggle<CR>


"NerdCommenter
"
map <C-_> <leader>c<Space>j
"map <C-_> <leader>c<Space>j


"SuperTab
"
set ofu=syntaxcomplete#Complete
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=emmet:emmet-expand-abbr
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

let g:SuperTabDefaultCompletionType = "<c-x><c-n>"

"airline
"
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


"
" Tarbar
nmap <F8> :TagbarToggle<CR>

"neocomplete
"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.

let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
"
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"use silent mode to avoid bizzare char insertion"
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" work with jedi-vim
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif


"
"Yapf, a formatter for python
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>

"
"Flake8
"autocmd BufWritePost *.py call Flake8()

"
"PyTest
" Pytest
nmap <Leader>pf :Pytest file verbose<CR>
nmap <Leader>pc :Pytest class verbose<CR>
nmap <Leader>pm :Pytest method verbose<CR>

"
"CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/node_modules/*,*.jpg,*.png

