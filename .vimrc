"禁用 Vi 兼容模式
set nocompatible
"文件侦查启动,用以检测文件的后缀
filetype on
"set runtime path
set rtp+=~/.vim/bundle/vundle
"vundle magage plugins
call vundle#rc()

"vundle plugin
Bundle 'gmarik/vundle'

"##Plugins for Python IDE##
Bundle 'Lokaltog/vim-powerline'

"Bundle 'bling/vim-airline'

"Bundle 'jnurmine/Zenburn'
"Bundle 'altercation/vim-colors-solarized'

Bundle 'jaromero/vim-monokai-refined'

Bundle 'scrooloose/nerdtree'

Bundle 'majutsushi/tagbar'

Bundle 'klen/python-mode'

"Bundle 'kien/ctrlp.vim'

"启用缩进
filetype plugin indent on

"启用智能对齐方式
set smartindent

"启用折叠
set foldmethod=indent  "indent 折叠方式
"常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> 

"突出显示当前行
set cursorline

"#####################
"python ide setting
"#####################

"#####################
"setting for vim-powerline
"启用状态栏信息
set laststatus=2

"#####################
"setting for Solarized
"syntax on  
"set t_Co=256  
"set background=dark  
"colorscheme solarized
"using F5 to select 2 of color
"call togglebg#map("<F5>")

"######################
"setting for Monokai-Refined
set t_Co=256
colorscheme Monokai-Refined

"#######################
"setting for nerdtree
""将F2设置为开关NERDTree的快捷键
map <F2> :NERDTreeToggle<CR>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeWinSize=15
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=0
""显示隐藏文件
let g:NERDTreeShowHidden=1
"" 让Tree把自己给装饰得多姿多彩漂亮点
let g:NERDChristmasTree=1

""打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时自动打开NERDTree
autocmd vimenter * NERDTree
""开启NERDTree后进入vim默认光标在文件编辑区
wincmd w
autocmd VimEnter * wincmd w

"#######################
"setting for tagbar
"设置tagbar使用的ctags的插件,必须要设置对  
let g:tagbar_ctags_bin='/usr/bin/ctags'
"设置tagbar的窗口宽度  
let g:tagbar_width=20
"设置tagbar的窗口显示的位置,为right  
let g:tagbar_right=1  
"打开文件自动 打开tagbar  
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()  
"映射tagbar的快捷键  
"nmap <Leader>tb :TagbarToggle<CR>
map <F10> :TagbarToggle<CR>
"map <F8> :TagbarToggle<CR> 
" 启动 时自动focus
let g:tagbar_autofocus = 1
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
"let g:tagbar_autopreview = 1
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0

"#######################
"setting for python-mode
" Activate rope
" 快捷键：
" K             Show python docs 显示Python文档
" <Ctrl-Space>  Rope autocomplete  使用Rope进行自动补全
" <Ctrl-c>g     Rope goto definition  跳转到定义处
" <Ctrl-c>d     Rope show documentation  显示文档
" <Ctrl-c>f     Rope find occurrences  寻找该对象出现的地方
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled) 断点
"跳转到前一个/后一个类或函数
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
"跳转到前一个/后一个类或方法
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

let g:pymode_rope = 1

" Documentation 显示文档
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting 代码查错，=1为启用
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting 高亮形式
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code 禁用自动代码折叠
let g:pymode_folding = 0

"#######################
"setting for ctrlp
""let g:ctrlp_max_height=30
""set wildignore+=*.pyc
""set wildignore+=*_build/*
""set wildignore+=*/coverage/*

"########################
"another setting for python-mode
""map <Leader>g :call RopeGotoDefinition()<CR>
""let ropevim_enable_shortcuts=1
""let g:pymode_rope_goto_def_newwin="vnew"
""let g:pymode_rope_extended_complete=1
""let g:pymode_breakpoint=0
""let g:pymode_syntax=1
""let g:pymode_syntax_builtin_objs=0
""let g:pymode_syntax_builtin_funcs=0
""map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

"Better navigating through omnicomplete option list
""set completeopt=longest,menuone
""function! OmniPopup(action)
""  if pumvisible()
""	if a:action=='j'
""		return "\<C-N>"
""	elseif a:action=='k'
""		return "\<C-P>"
""	endif
""  endif
""  return a:action
""endfunction

""inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
""inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"python folding
""set nofoldenable

"##vim can use windows clipboard
set clipboard=unnamed
"##vim can show line number
set nu
"##vim gui font
set guifont=Monospace\ 15
"##vim interface size
set lines=65 columns=118
