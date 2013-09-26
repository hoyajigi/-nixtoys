"
"Hoyajigi Vim setting
"2009-02-09

set autoindent
set cindent
set smartindent

set textwidth=76
set wrap
set tw=0

set nowrapscan

set nobackup
set visualbell
set ruler
set showmode
set nu

set hlsearch
set ignorecase

set tabstop=4
set shiftwidth=4

set showmatch

set backspace=eol,start,indent

set history=1000

if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
    set t_Co=16
    set t_Sf=^[[3%dm
    set t_Sb=^[[4%dm
    set t_kb=^H
    fixdel
endif


if has("syntax")
    syntax on
    filetype on
endif



"if v:lang=~"utf-8$"||v:lang=~"UTF-8$"
set encoding=utf-8
set fileencoding=utf-8 ",cp949
"set fencs=utf-8,cp949
"endif
set termencoding=utf-8


com -nargs=0 TOHtml :so $VIMRUNTIME/syntax/2html.vim



"map #1 :!man
map #2 :set nonu<CR>:20vs ./<CR>
map #5 :!./%:r ^M<CR>
map #7 :w<CR>:!gcc % -o %< <CR>
"map <F12> v]} zf
"map #10 :w!<cr>
"저장
 
map <F10> :!gcc -W -Wall -O2 -g % -o %<
"map #8 :w<CR>:!g++ % -o %< <CR>
"map #5 :w<CR>:!javac % ^M<CR>
"map #6 :w<CR>:!javac %< ^M<CR>


 
map <F1> K   도움말 보기
"map <F3> ^w<CR>  탐색기 안에서 파일 열기
"map <F4> ^6   이전에 열었던 파일 열기
map <F11> v%zf   폴딩 - 함수 접기(함수의 { 위치에서 F5를 눌러야 함)
map <F12> zo    폴딩한 것 다시 풀기
"map <F7> :marks<CR>  최근에 열었던 파일 보기
"map <F8> [i   함수 프로토타입보기





set ff=unix

