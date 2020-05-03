"**************************************
"     common configuration            *
"**************************************

" 关闭vim 一致性原则
set nocompatible

" 设置文件编码为 utf-8
set encoding=utf-8

" 设置tab 宽度
set ts=4

" 设置tab 自动转为空格
set expandtab

" 设置自动对齐的空格数
set shiftwidth=4

" 设置退格键可以直接删除tab 的4 个空格
set smarttab
set softtabstop=4

" 显示行号
set nu

" 设置在编辑过程中右下角显示行列信息
set ruler

" 设置历史记录行数
set history=1000

" 设置状态栏显示正在输入的命令
set showcmd

" 取消备份及禁止临时文件的生成
set noswapfile
set nobackup

" 设置匹配模式
set showmatch

" 设置搜索是忽略大小写
set ignorecase

" 配置C 系列语言的对齐方式
set cindent
set autoindent

" 开启语法高亮
syntax enable
syntax on

" 指定配色方案为256
set t_Co=256

" 自动判断编码的顺序
set fileencodings=utf-8,ucs-bom,gb18030,gb2312,big5,latin1

" 检查文件类型
filetype on

" 根据不同文件类型采取不同缩进
filetype indent on

" 允许插件
filetype plugin on

" 启动智能补全
filetype plugin indent on
