set foldmethod=indent
set noshowmode
set backspace=2
set nu
packadd termdebug
set tags=./.tags;,.tags
call plug#begin('~/.vim/plugged')
" 要安装的插件写在两个call之间
"缩进线
Plug 'Yggdroot/indentLine'
"启动
Plug 'mhinz/vim-startify'
" 符号补全
Plug 'jiangmiao/auto-pairs'
"代码补全
Plug 'Valloric/YouCompleteMe'
"自动生成tags
Plug 'ludovicchabant/vim-gutentags'
"编译运行
Plug 'skywind3000/asyncrun.vim'
"动态检查
Plug 'dense-analysis/ale'
"底栏美化
Plug 'vim-airline/vim-airline'
"语法高亮
Plug 'octol/vim-cpp-enhanced-highlight'
"函数列表
Plug 'Yggdroot/LeaderF'
"切换头文件源文件
Plug 'vim-scripts/a.vim'
"参数提示
Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup=1
"文件树
Plug 'scrooloose/nerdtree'
noremap <F1> :NERDTreeToggle<cr>
"注释
Plug 'preservim/nerdcommenter'
let g:mapleader = ","
"配色
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-janah'
call plug#end()
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
set completeopt=menu,menuone
noremap <c-z> <NOP>
let g:ycm_confirm_extra_conf = 0



let g:ycm_semantic_triggers =  {'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],'cs,lua,javascript': ['re!\w{2}']}




" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 10
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F2 打开/关闭 Quickfix 窗口
nnoremap <F2> :call asyncrun#quickfix_toggle(6)<cr>
"nnoremap <silent> <F9> :AsyncRun g++ -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
nnoremap <silent> <F3> :AsyncRun -cwd=<root> make <cr>
nnoremap <silent> <F5> :AsyncRun -cwd=<root> -raw make run <cr>
nnoremap <silent> <F4> :AsyncRun -cwd=<root> -raw make clean <cr>
nnoremap <silent> <F7> :AsyncRun -cwd=<root> -raw make debug <cr>

let g:ale_linters = {
  \   'csh': ['shell'],
  \   'zsh': ['shell'],
  \   'go': ['gofmt', 'golint'],
  \   'python': ['flake8', 'mypy', 'pylint'],
  \   'c': ['gcc', 'cppcheck'],
  \   'cpp': ['gcc', 'cppcheck'],
  \   'text': [],
  \}
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''




"高亮类，成员函数，标准库和模板
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
"文件较大时使用下面的设置高亮模板速度较快，但会有一些小错误
"let g:cpp_experimental_template_highlight = 1

"快捷键
"打开函数列表
noremap <c-f> :LeaderfFunction!<cr>
syntax enable
set background=light
colorscheme gruvbox
