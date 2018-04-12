""""""""""""""""""""""""Vundle"""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Bundle 'scrooloose/nerdtree'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/winmanager'
Bundle 'ervandew/supertab'
Bundle 'rkulla/pydiction'
Bundle 'fatih/vim-go'
"Bundle 'scrooloose/syntastic'
Bundle 'w0rp/ale'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'dgryski/vim-godef'
"Bundle 'davidhalter/jedi-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/emmet-vim'
Bundle 'terryma/vim-multiple-cursors'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'Yggdroot/indentLine'
Bundle 'ternjs/tern_for_vim'
Bundle 'jelera/vim-javascript-syntax'
"Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'godlygeek/tabular.git'
Bundle 'walm/jshint.vim.git'
Bundle 'moll/vim-node.git'
"Bundle 'myhere/vim-nodejs-complete.git'
Bundle 'posva/vim-vue'
"Bundle 'shawncplus/phpcomplete.vim'
"Bundle 'python-mode/python-mode'
Bundle 'joonty/vdebug'
Bundle 'nsf/gocode', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Uncomment the next line to make Vim more Vi-compatible                                                                                                                            
"""""""""""""""""""""""End of Vundle""""""""""""""""""""

" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible
 
" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
syntax on " 语法高亮
endif
colorscheme ron
 
" detect file type
filetype on
filetype plugin on
set nocp
 
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
 
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"have Vim load indentation rules and plugins according to the detected filetype
filetype plugin indent on
endif
 
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
 
"set ignorecase " 搜索模式里忽略大小写
"set smartcase " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set autowrite " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-       O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set autoindent " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
"set smartindent " 智能对齐方式
set tabstop=4 " 设置制表符(tab键)的宽度
set softtabstop=4 " 设置软制表符的宽度
set expandtab "用space替代tab的输入
set shiftwidth=4 " (自动) 缩进使用的4个空格
set cindent " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式
set showmatch " 设置匹配模式，显示匹配的括号
set linebreak " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set hidden " Hide buffers when they are abandoned
"set mouse=a " Enable mouse usage (all modes) "使用鼠标
set number " Enable line number "显示行号
"set previewwindow " 标识预览窗口
set history=50 " set command history to 50 "历史记录50条
 
 
"--状态行设置--
set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。
 
"--命令行设置--
set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式
 
"--find setting--
set incsearch " 输入字符串就显示匹配点
set hlsearch
 
 
"------------------------------------------------------added by cooltime---------------------------------------
set nobackup
set noswapfile
 
set ignorecase "搜索时忽略大小写
"set textwidth=80
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
"set matchpairs+=<:>
"set hlsearch
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
 
filetype plugin indent on
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.json set filetype=json
 
source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
inoremap <C-O> : <A-/>
 
set tags=tags
set tags+=./tags "add current directory's generated tags file
set tags+=~/arm/linux-2.6.24.7/tags "add new tags file
 
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
 
let g:tagbar_width=35
let g:tabar_autofocus=1
nmap tt :TagbarToggle<CR>
 
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
 
"WinManager和NERDTree的配置
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree"
let g:winManagerWidth = 30
let g:NERDTreeHeight = 50
let g:AutoOpenWinManager = 1
  
function! NERDTree_Start()
    exec 'NERDTree'  
endfunction
  
function! NERDTree_IsValid()
    return 1
endfunction
"
"WindowManager快捷键
nmap wm :WMToggle<CR>
 
"横向光标对齐线设置
set cursorline
hi CursorLine term=underline
hi CursorColumn term=underline
"hi CursorColumn cterm=NONE ctermbg=lightgray ctermfg=darkred
 
""自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
 
"纵向indent对齐线的设置，暂时不启用
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=lightgreen
hi IndentGuidesEven ctermbg=darkgray
 
"折叠相关设置
set fdm=indent
set foldlevel=2
"
 
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = []
"let g:syntastic_python_checkers = ["python"]
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_php_checkers = ["php"]
"let g:syntastic_php_checkers = ["phpcs"]
let g:syntastic_go_checkers = ["golint","gofmt"]
let g:syntastic_json_checkers = ["jsonlint"]
let g:syntastic_sh_checkers = ["bashate"]
 
let g:syntastic_check_on_open=1
let g:syntastic_phpcs_conf = '--tab-width=4 --standard=CodeIgniter'  

let g:airline#extensions#tabline#enabled = 1

"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

let g:airline_theme="luna"
let g:airline_powerlint_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"nnoremap <C-N> :bn<CR>
"nnoremap <C-P> :bp<CR>
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'


autocmd! BufNewFile *.py,*.sh exec ":call SetTitle()"

func SetTitle()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/python")
        call setline(2, "\# -*- coding:utf-8 -*-")
        call setline(3, "\# Author : cooltime")
        call setline(4, "")
        call setline(5, "\# File name : ".expand("%"))
        call setline(6, "\# Description :")
        call setline(7, "")
        call setline(8, "")
        call setline(9, "from __future__ import absolute_import, unicode_literals  # NOQA")
        call setline(10, "")
        call setline(11, "")
        call setline(12, "if __name__ == '__main__':")
        call setline(13, "    pass")
    endif
endfunc

let g:vdebug_options = {"port": 9010, "timeout": 600}

""python-mode
"""开启警告
"let g:pymode_warnings = 0
""保存文件时自动删除无用空格
""let g:pymode_trim_whitespaces = 1
""let g:pymode_options = 1
"""显示允许的最大长度的列
"let g:pymode_options_colorcolumn = 1
""设置QuickFix窗口的最大，最小高度
""let g:pymode_quickfix_minheight = 3
""let g:pymode_quickfix_maxheight = 10
"""使用python3
"let g:pymode_python = 'python3'
""使用PEP8风格的缩进
""let g:pymode_indent = 1
"""取消代码折叠
"let g:pymode_folding = 0
""开启python-mode定义的移动方式
""let g:pymode_motion = 1
"""启用python-mode内置的python文档，使用K进行查找
"let g:pymode_doc = 1
"let g:pymode_doc_bind = 'K'
""自动检测并启用virtualenv
""let g:pymode_virtualenv = 1
"""不使用python-mode运行python代码
"let g:pymode_run = 0
""let g:pymode_run_bind = '<Leader>r'
"""不使用python-mode设置断点
"let g:pymode_breakpoint = 0
""let g:pymode_breakpoint_bind = '<leader>b'
"""启用python语法检查
"let g:pymode_lint = 1
""修改后保存时进行检查
""let g:pymode_lint_on_write = 0
"""编辑时进行检查
"let g:pymode_lint_on_fly = 0
"let g:pymode_lint_checkers = ['pyflakes', 'pep8']
""发现错误时不自动打开QuickFix窗口
""let g:pymode_lint_cwindow = 0
"""侧边栏不显示python-mode相关的标志
"let g:pymode_lint_signs = 0
""let g:pymode_lint_todo_symbol = 'WW'
"""let g:pymode_lint_comment_symbol = 'CC'
""let g:pymode_lint_visual_symbol = 'RR'
"""let g:pymode_lint_error_symbol = 'EE'
""let g:pymode_lint_info_symbol = 'II'
"""let g:pymode_lint_pyflakes_symbol = 'FF'
""启用重构
""let g:pymode_rope = 1
"""不在父目录下查找.ropeproject，能提升响应速度
"let g:pymode_rope_lookup_project = 0
""光标下单词查阅文档
""let g:pymode_rope_show_doc_bind = '<C-c>d'
"""项目修改后重新生成缓存
"let g:pymode_rope_regenerate_on_write = 1
""开启补全，并设置<C-Tab>为默认快捷键
""let g:pymode_rope_completion = 1
""let g:pymode_rope_complete_on_dot = 1
""let g:pymode_rope_completion_bind = '<C-Tab>'
"""<C-c>g跳转到定义处，同时新建竖直窗口打开
"let g:pymode_rope_goto_definition_bind = '<C-c>g'
"let g:pymode_rope_goto_definition_cmd = 'vnew'
""重命名光标下的函数，方法，变量及类名
""let g:pymode_rope_rename_bind = '<C-c>rr'
"""重命名光标下的模块或包
"let g:pymode_rope_rename_module_bind = '<C-c>r1r'
""开启python所有的语法高亮
""let g:pymode_syntax = 1

" For ALE
let g:ale_completion_enabled = 1


autocmd bufwritepost .vimrc source %
set pastetoggle=<F2>
set backspace=2 " 设置退格键可用
"set mouse=a
let g:pydiction_location = '/home/cooltime/.vim/bundle/pydiction/complete-dict'
