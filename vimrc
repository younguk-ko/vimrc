"//==================================================================
"   History 
"   2022-10-07 00:12:41 vimrc 설정 정리
"   20221012 : git repo : https://github.com/younguk-ko/vimrc.git
"//==================================================================

"//==================================================================
"  vim 설정. set , 검색 , 모양, indent
"  :set 명령어로  현재 setting을 볼수 있다.
"//==================================================================
if has("syntax") " 구문 강조 사용.
    syntax on
endif

" 파일 타입(확장자 *.py , *.txt))에 따라 다르게 indent 또는 plugin을 적용하는 옵션.
filetype plugin indent on
"au BufNewFile,BufRead *.ino,*.txt set filetype=c " ino , txt 파일도 C 파일과 같은 취급.
au BufNewFile,BufRead *.ino,*.txt set filetype=sh " ino , txt 파일도 C 파일과 같은 취급.

"   파이썬 관련 세팅 모음 시작.
"   Python 파일(*.py) 일 경우에 자동으로 expandtab 옵션이 설정됨.
"   expandtab : tab이 자동으로  space로 변경됨.
"   개인적으로 space가 아닌 tab을 사용하려면 아래와 같이 추가 해주어야 한다.
"   autocmd FileType python setlocal noexpandtab shiftwidth=4 softtabstop=4
"   python-mode plugin 사용하는 경우 위와 같이 설정하여도 다시 space로 변경됨.
"   결론 : python 의 경우 space 사용하는 것이 표준인듯.
"   짧은 명령어  au Filetype python setl et ts=4 sw=4
"   autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
"   파이썬 관련 세팅 모음 끝

"set autoindent
set smartindent " autoindent smart 하게 한다.
set expandtab " 짧게 하려면 set et
"set noexpandtab " 짧게 하려면 set noet
set tabstop=4  " 짧은 command  : set ts=4
set shiftwidth=4
set softtabstop=4
"set autoindent noexpandtab tabstop=4 shiftwidth=4 " 이렇게 한줄로도 표시 가능.
"set noet ci pi sts=0 sw=4 ts=4 " 이렇게도 가능.


set nocompatible " vi와 호환되지 않음.
"set nu  "set nonu
set mousehide    " 마우스 숨기기
set mouse=a " 마우스 스크롤 ON
set autoread
set nowrap
set backspace=indent,eol,start
set autochdir
set laststatus=1
" laststatus 화면 하단에 현재 상태 정보 보여줄 것인지 여부 설정" " 0 - never" 
 " 1 - only if there are at least two windows (화면분할)" " 2 - always"
set showmatch
set history=50      " keep 50 lines of command line history
set showcmd         " 키보드 눌러서 사용하는 명령어 우측 하단에 보여줌.
set incsearch       " do incremental searching
set isk+=-          " 2019-10-31 16:13:15  include dash"-" when search word.

" Clipboard feature settings : CTRL-C,CTRL-V . y, p
set nopaste     "   paste to upper cursor line. <S-INSERT>
set clipboard=unnamedplus " use system clipboard  
noremap y "+Y
noremap p "+gp  "   paste to upper line. "+gP ==> paste under cursor.
noremap <C-c> "+Y
noremap <C-v> "+gp
noremap <C-a> ggVG"+Y


set hlsearch " 찾았던 키워드 계속 보여줌. 반대는 noh
highlight Search guifg=black guibg=Orange


colorscheme desert

set fileencodings=utf8,euc-kr " 한글 설정.

set ch=1        " Make command line three lines high
"set ruler " Airline Plugin 사용하고 있으므로 comment out
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %p%)

" 대소문자 구분없이 검색.
set ignorecase " 반대는 noignorecase
set smartcase  " 반대는 nosmartcase " 대소문자 섞어서 검색시에는 대소문자 구분함.
"   set ignorecase smartcase  "/로 검색할 때, 대소문자 구분없이 매칭되는 것을 찾아줌"
"   smartcase는 좀더 스마트하게 검색을 해주는데 예를 들어 the, THE, The, ThE가 "
"   있을 때, /Th*로 검색하면 T와 Th만 찾아준다."
"   ignorecase만 사용하면 the, THE, The, ThE 모두 찾아준다."


set wildmenu "자동완성 기능 향상"
set wildmode=list:full "When more than one match, list all matches and complete first match."
set completeopt=menuone,preview "insert 모드에서 자동완성 추가 옵션"

"tab과 space 구분하기 용이하게 세팅" 사용법 모름....
"set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→
"

"//==================================================================
"   vim 설정 중 OS 별 구분 필요할 경우 아래 if 문 안에 추가
"   win32 : 윈도우 , gui_running : gvim,  unix : linux
"//==================================================================
if has ("win32") ""윈도우 gvim 과 위도우 CMD ( anaconda venv) 에서 vim 사용하는 경우.

    "   Open URL under cursor in webbrowser.
    if (has('win32') || has('win64'))
        nmap gx :exec "!start <cWORD>"<cr> 
    endif

    if has( "gui_running" ) "gvim에서만 적용되는 옵션모음.
    
        set gfn=D2Coding:h11 " 폰트 크기 설정
        au GUIEnter * winsize 92 55
        au GUIEnter * winpos 1260 0
        set nocursorline " 커서가 있는 라인을 하이라이트. set cursorline
        set guioptions-=m " Remove gvim menu bar 필요할 경우 +=m
        set guioptions-=T " Remove toolbar. 보이게 할 경우 +=T
        set nobackup
        "set backupdir=$HOME/vimfiles/backup
        "set directory=$HOME/vimfiles/backup

    else " Only Windows CMD prompt feature here.
    
    endif "if has("gui_running" ) " 

endif "if has("win32")

if has ("unix") "" Linux 설정.

    set nobackup
    set backupdir=$HOME/.vim/backup
    set directory=$HOME/.vim/backup
    nmap ,s :source ~/.vim/vimrc<CR>
    nmap ,v :e ~/.vim/vimrc<CR>
    nmap ,p :e ~/.vim/bashrc<CR>
    nmap ,o :!source ~/.vim/bashrc<CR>
    nmap ,cs :e ~/.vim/cscope/cscope.files<CR>
    cmap datetime <C-R>=strftime("%Y%m%d-%H%M%S")<CR>
    nmap ,ww :w $HOME/text/datetime.txt<cr> " 현재 시간의 파일명으로 자동저장
    nmap ,w :w $HOME/text/datetime_.txt<left><left><left><left>
    nmap ,t :e ~/text/<CR>
    nmap ,l :e ~/.vim/mydoc/text/1clip<CR>
    " YUKO for using taglist 061122
    filetype on 
    nnoremap <silent> <F8> :TlistToggle<CR>
    nnoremap <silent> <F7> :SrcExplToggle<CR>
    " 2018-10-02 10:19:54  coding font.
    set guifont=D2Coding\ 13
    
    "   Open URL under cursor in webbrowser for other os.
    nmap gx :exec "!open <cWORD>"<cr> 

    " vim plug 관련 start
    call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    call plug#end()
    " vim plug 관련 end

endif


"//==================================================================
"   맵. nmap, map, imap,cmap, nore(no recursive) ,... 
"//==================================================================

"   탭 추가/이동 관련 맵핑
nmap tn :tabnew<CR>
nmap td :tabclose<CR>
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>

" vim 설정편집적용 / 기본저장 DIR / 열기 / 저장 / 자주가는 DIR 관련 맵. 
nmap ,s :source $HOME/vimfiles/vimrc<CR>
nmap ,v :e $HOME/vimfiles/vimrc<CR>
nmap ,r :e $VIM/<CR>
nmap ,b :e $HOME/vimfiles/backup<CR>
nmap ,p :e $HOME/.bashrc<CR> " git bash 사용시 alias 사용가능.
cmap datetime <C-R>=strftime("%Y%m%d-%H%M%S")<CR>
nmap ,ww :w $HOME/Documents/text/datetime.txt<cr> " 현재 시간의 파일명으로 자동저장
nmap ,w :w $HOME/Documents/text/datetime_.txt<left><left><left><left>
nmap ,t :e $HOME/Documents/text/<CR>
nmap ,h :e $HOME/<CR>

nmap z <c-w><c-w> " 창 이동을 .으로 

" ",숫자"로 치환기능 매핑. 
nmap ,5 :%s/<project name="//g<CR>:%s/" path.*revision="/\/...@/g<CR>:%s/\"*\/>//g<CR>:%s/ //g<CR>
nmap ,6 :%s/@.......//g<CR>
nmap ,7 :%s///g<CR>
nmap ,8 :%s/vbs-...........*-0-//g<CR>
nmap ,9 :%s/:vbs-..........*\n/\r/g<CR>:%s/.......\*//g<CR>
nmap ,0 :%s/\/\/TIZEN.......*......@.......//g<CR>:%s/nothing provides //g<CR>:%s/pkgconfig(//g<CR>:%s/) //g<CR>:%s/)//g<CR>:%s/  / /g<CR>/  <CR>

" cscope 사용할때.
nmap cf :cs f f 
nmap cs :cs f s 
nmap cr :cs reset <CR><CR>
nmap ca :!cscope -Rbqk<CR><CR>:cs reset <CR><CR>
"nmap ca :!cd ~/.vim/cscope;cscope -Rbqk<CR><CR>:cs reset <CR><CR>
nmap cace :cs add ~/.vim/cscope<CR><CR>


" YUKO 080204 date " 입력 모드에서 idate 입력시 자동으로 날짜 삽입.
iab idate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR> 
iab itime <C-R>=strftime("%H:%M:%S")<CR> 
inoremap <C-G> <C-R>=strftime("%Y/%m/%d %T")<CR> " input mode에서 CTRL-g 로 날짜시간축약입력.

"   global command. 키워드 검색하여 키워드가 있는 라인을 여러가지 처리하는 명령모음.
"   Tip 항목의 vim 정규표현식 참고하여 활용가능함.
"   http://vimregex.com/  : vim 정규 표현식. search / Global command
"   2014-10-27 14:40:24  YUKO for using g(global command)
"   Delete all lines that do?not?match a pattern. The commands shown are equivalent (v?is "inverse").  ":g!/pattern/d ":v/pattern/d
"   Delete all blank lines ("^\" is start of line;?\s*?is zero or more whitespace characters;?$?is end of line) ":g/^\s*$/d
"   Double space the file (^?is start of line which matches each line).  ":g/^/pu =\"\n\"
"   " Alternative (:put inserts nothing from the blackhole register) ":g/^/pu _
"   Copy all lines matching a pattern to end of file.  ":g/pattern/t$
"   Move all lines matching a pattern to end of file.  ":g/pattern/m$
"   Copy all lines matching a pattern to register 'a'.  "qaq:g/pattern/y A

nmap ,gg :g/<C-R>=expand("<cword>")<CR>/d<CR>ggn            "   Delete all line contain under cursor string in this file
nmap ,gc qaq:g/<C-R>=expand("<cword>")<CR>/y A<CR>''n       "   Copy all line contain under cursor string in this file
nmap ,gv :v/<C-R>=expand("<cword>")<CR>/d<CR>ggn            "   Delete all line not contain under cursor string in this file
nmap ,ge :g/^\s*$/d<CR>gg                                   "   Delete all empty line in this file
nmap ,gt qaq:g/<C-R>=expand("<cword>")<CR>/y A<CR>''n :tabnew<CR>pp     "   Copy all line contain under cursor string in this file and view in new tab


nmap diff :vert diffs           " diff 는 virtial split.
nmap ,h :%!xxd                  " hexa editor 열기.

"   For project.  Comment add , debug log input in C file. etc....
let PRJ_NAME="MyProject"    "   Project name
let MOD_NAME="android"      "   Module name
let DEFINE="feature"        "   Feature name

nmap \w :set paste<CR>I///******************************************************************************<CR>//* Project : <C-R>=(PRJ_NAME)<CR> //* Block / Module : <C-R>=(MOD_NAME)<CR><CR>//* Filename :<CR>//* Date : <C-R>=strftime("%Y/%m/%d")<CR><CR>//* Description : YUKO Create for <C-R>=(PRJ_NAME)<CR> <C-R>=(MOD_NAME)<CR><CR>//*******************************************************************************<CR>:set nopaste 4-0f:0A<CR>
nmap \z oBP_DEBUG(M_DMS, "[<C-R>=(PRJ_NAME)<CR>_<C-R>=(MOD_NAME)<CR>]%s:%d \n",__FUNCTION__,__LINE__);/*<C-R>=(PRJ_NAME)<CR> <C-R>=strftime("%Y%m%d.YUKO")<CR>*/:set nopaste<CR>48hi
nmap \x oprintf("[<C-R>=(PRJ_NAME)<CR> <C-R>=(MOD_NAME)<CR>]%s:%d \n",__FUNCTION__,__LINE__);/*<C-R>=strftime("%Y%m%d.YUKO")<CR>*/:set nopaste<CR>52hi
nmap \c oprintf("[<C-R>=(PRJ_NAME)<CR> <C-R>=(MOD_NAME)<CR>]%s:%s:%d \n",__FILE__,__FUNCTION__,__LINE__);/*<C-R>=strftime("%Y%m%d.YUKO")<CR>*/:set nopaste<CR>52hi
"nmap \c ofprintf(stderr,"[<C-R>=(PRJ_NAME)<CR>] \n"); /*<C-R>=(MOD_NAME)<CR> <C-R>=strftime("%Y%m%d.YUKO")<CR>*/:set nopaste<CR>31hi
nmap \1 :set paste<CR>yypkIA /* <C-R>=strftime("%Y%m%d.YUKO")<CR> for <C-R>=(PRJ_NAME)<CR> <C-R>=(MOD_NAME)<CR> */:set nopaste<CR>j
nmap \2 :set paste<CR>A /* <C-R>=strftime("%Y%m%d.YUKO")<CR> for <C-R>=(PRJ_NAME)<CR> <C-R>=(MOD_NAME)<CR> */:set nopaste<CR>j
nmap \3 :set paste<CR>O#if 0 /* <C-R>=strftime("%Y%m%d.YUKO")<CR> Start for <C-R>=(PRJ_NAME)<CR> <C-R>=(MOD_NAME)<CR> */:set nopaste<CR>j
nmap \4 :set paste<CR>O#ifdef <C-R>=(DEFINE)<CR> /* <C-R>=strftime("%Y%m%d.YUKO")<CR> Start for <C-R>=(PRJ_NAME)<CR> <C-R>=(MOD_NAME)<CR> */<CR>#else:set nopaste<CR>j
"nmap \5 :set paste<CR>o#endif /* <C-R>=strftime("%Y%m%d.YUKO")<CR> End for <C-R>=(PRJ_NAME)<CR> <C-R>=(MOD_NAME)<CR> */:set nopaste<CR>j
nmap \5 :set paste<CR>o#endif:set nopaste<CR>
nmap \6 :set paste<CR>I/*A*/ /* 1 line comment <C-R>=strftime("%Y%m%d.YUKO")<CR> for <C-R>=(PRJ_NAME)<CR> <C-R>=(MOD_NAME)<CR> */:set nopaste<CR>j
nmap -- :set paste<CR>o//===========================================================================================:set nopaste<CR>k
nmap \9 :%s/nothing provides //g<CR>:%s/pkgconfig(//g<CR>:%s/)//g<CR>:g/^    /norm dwk^yiWopJk<CR>:set nopaste<CR>

"   2014-02-17 Current file name mapping. 현재 파일의 정보를 디렉토리 / string으로 만들기.
"   :inoremap \fn <C-R>=expand("%:t:r")<CR>     "   when you are in insert mode.
"   :inoremap \fn <C-R>=expand("%:t")<CR>       "   To keep the extension use:
"   :inoremap \fn <C-R>=expand("%:p:h")<CR>     "   To insert the absolute path of the directory the file is in use:
"   :inoremap \fn <C-R>=expand("%:h")<CR>       "   To insert the relative path of the directory the file is in use:
"   inoremap ifilen <C-R>=expand("%:p:h")<CR>/<C-R>=expand("%:t")<CR>
"   inoremap ifilep <C-R>=expand("#:p:h")<CR>/<C-R>=expand("#:t")<CR>
map \fn o<C-R>=expand("%:p:h")<CR>/<C-R>=expand("%:t")<CR>
map \fp o<C-R>=expand("#:p:h")<CR>/<C-R>=expand("#:t")<CR>


"//==================================================================
"   개발환경 관련 설정.
"//==================================================================
"   window 10  Anaconda 에서 python compile 할때 <F5> 키로 실행.
"   For Python anaconda virtual environment compile
autocmd FileType python nmap <buffer> <F5> :!python %<CR>  " 
"   autocmd FileType python map <buffer> <F5> :w<CR> :!python %<CR>  
"   autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
"   autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
"   autocmd FileType python map <buffer> <F5> :w<CR>:!python %<CR>
"   autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:!python %<CR>
"   set PYTHONPATH=$HOME\miniconda3\envs\yuko
"   set PYTHONHOME=$HOME\miniconda3\envs\yuko
"   set pythonthreedll="$HOME\miniconda3\envs\yuko\python38.dll"

"//==================================================================
"   Plung in 관리자 : Vim-Plug 사용.
"   Plung in 사용에 필요한 set / map /  설정 / 사용법 등도 아래에 정리.
"//-------------------------------------------------------------------
"   Plugin 설정. install 명령어. :PlugIn
"   아래 편집/저장후 TODO 반드시 source $HOME/vimfiles/vimrc 실행 후 명령어 입력. XXX
"   Command    Description
"   PlugInstall [name ...] [#threads]    Install plugins
"   PlugUpdate [name ...] [#threads]    Install or update plugins
"   PlugClean[!]    Remove unlisted plugins (bang version will clean without prompt)
"   PlugUpgrade     Upgrade vim-plug itself
"   PlugStatus      Check the status of plugins
"   PlugDiff        Examine changes from the previous update and the pending changes
"   PlugSnapshot[!] [output path]    Generate script for restoring the current snapshot of the plugins
"//-------------------------------------------------------------------

call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-theme'
    Plug 'tpope/vim-fugitive' " For Git commit / push
call plug#end()

"   For NERD_tree Plungin 맵과 설정
map <c-w><c-y> :NERDTreeToggle<CR>
nmap bm :Bookmark 
nmap bmc :ClearBookmarks 
let NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

"   For Fusitive.vim : Git plugin. :      " https://github.com/tpope/vim-fugitive
"   :Git (or just :G)     " :G commit     " :G push(GPush)    " :G status     " :G diff   " :G blame
"   :G commit -m "update" " :G log
nnoremap <A-1> :G status<CR>
nnoremap <A-2> :G log<CR>
nnoremap <A-3> :G diff<CR>
nnoremap <A-4> :G commit vimrc -m "update"<left>
nnoremap <A-5> :G push<CR>
nnoremap <A-6> :G pull<CR>

"//==================================================================
"   참고할 사항 정리 - Tip , 특수문자 , 강좌 등등 
"//==================================================================
"   vim 정규 표현식 치환할때 참고용. :%s/old/new/g
"   http://vimregex.com/  : vim 정규 표현식. search / Global command
"   ^   행의 첫문자 ([] 안에서는 not 의 의미)   "   .      아무문자나 한문자
"   []  괄호 안의 문자 중 하나                  "   *      앞의 내용이 0번 이상 반복됨
"   \<  단어의 시작                             "   \>     단어의 끝
"   \n  새 행문자                               "   $      행의 끝
"   \|  or 의 의미                              "   \{min,max\}    min 이상 max 이하 반복됨
"   \t  탭문자
"//==================================================================
"   vim keys              "<leader> 는 기본적으로 ‘\’를 가리키게 됩니다
"   <BS>    Backspace       " <Tab>    Tab      " <CR>    Enter
"   <Enter>    Enter        " <Return> Enter    " <Esc>    Escape
"   <Space>    Space        " <Up>     Up arrow " <Down>    Down arrow
"   <Left>    Left          " <Right>  Right    "   <Insert>    Insert      
"   <Del>    Delete         " <Home>   Home
"   <End>    End            " <PageUp> Page-Up  " <PageDown>    Page-Down
"   <F1> - <F12>    Function keys 1 to 12 "   #1, #2..#9,#0    Function keys F1 to F9, F10
"//==================================================================
"   nmap    normal mode         "   imap    insert mode         " vmap    visual and select mode 
"   smap    select mode         "   xmap    visual mode
"   cmap    command-line mode   "   omap    operator pending mode 

"//==================================================================
"   쓸만한 VIM 강좌 URL 모음.           "   아래 주소 위에 커서 놓고 gx 입력하면 웹보기.
"   https://m.blog.naver.com/nfwscho/220394602746 : 밤앙개의 vim 강좌
"   http://vimregex.com/  : vim 정규 표현식. search / Global command
"   https://coldmater.tistory.com/category/vim


"//------------------------------------------------------------------
"    Vim 설치 / Plugin 설치 

"//-------------------------------------------------------------------
"   Vim-Plug 설치  
"   Homepage : https://github.com/junegunn/vim-plug 
"   Type below command on windows powershell.
"   iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force
"   Vim-Plug 사용하기 위해서는 git 설치 필요.
"   Proxy 환경 일 경우 :PlugInstall  명령시 실패 할 경우 CMD 에 아래 입력.
"   git config --global http.sslVerify false


"//-------------------------------------------------------------------
"   DOSKEY : CMD/ conda prompt 에서 alias 사용하기.
"   아래내용을 alias.cmd 로 저장. 저장위치 $HOME/vimfiles/alias.cmd 로 가정.
"   @echo off
"   doskey vi=C:\"Program Files"\Vim\vim90\gvim.exe
"   doskey ls=dir
"   doskey ll=dir /w
"
"   아나콘다 prompt 위치.
"   $HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Anaconda3 (64-bit)
"   아나콘다 prompt 의 속성 -> 대상에 아래 추가. alias.cmd 
"    "/k" $HOME\vimfiles\alias.cmd

"//-------------------------------------------------------------------
"    Git 설치 및 사용법.
"   - 설치
"   https://git-scm.com/download : Git 설치 파일.
"   Proxy 환경 일 경우 :PlugInstall  명령시 실패 할 경우 CMD 에 아래 입력.
"   git config --global http.sslVerify false
"   git의 설정 파일은 $HOME/.gitconfig 임. "git config --global 명령어"를
"   입력하면 자동으로 $HOME/.gitconfig에 저장됨.
"
"   - 사용법
"   This vimrc git repository : https://github.com/younguk-ko/vimrc.git
"   상기 git repository 에서 vimrc 파일을 $HOME/vimfiles/vimrc 에 pull ( 서버에서 로컬로 가져옴)
"   하려고 하면 에러 발생. vimfiles 디렉토리가 이미 있고 다른 파일도 있어서 git clone이 실패함.
"   다른 파일이 존재하는 디렉토리에 git repo의 파일 가져오거나 
"   git repository 만 github 에서 만들어 놓고 로컬 파일을 add 할 때 아래
"   방법 사용할 수 있다.
"
"   1. 디렉토리 이동($HOME/vimfiles/)하여 git bash 실행. -> git init
"
"   2. git remote add origin https://github.com/younguk-ko/vimrc.git
"   아래와 같은 에러 발생하면 
"       fatal: detected dubious ownership in repository at 'C:/Users/yourname/vimfiles'
"       'C:/Users/yourname/vimfiles' is owned by: 'S-1-5-32-544'
"       but the current user is: 'S-1-5-21-273798964-3913833500-3570972300-1005'
"       To add an exception for this directory, call:
"
"   3. safe 디렉토리 설정을 변경.
"    git config --global --add safe.directory '*'
"
"   4. git remote add origin https://github.com/younguk-ko/vimrc.git
"
"   5. git pull origin main
"       remote: Enumerating objects: 55, done.
"       remote: Counting objects: 100% (55/55), done.
"       remote: Compressing objects: 100% (45/45), done.
"       remote: Total 55 (delta 16), reused 25 (delta 8), pack-reused 0
"       Unpacking objects: 100% (55/55), 18.13 KiB | 29.00 KiB/s, done.
"       From https://github.com/younguk-ko/vimrc
"        * branch            main       -> FETCH_HEAD
"        * [new branch]      main       -> origin/main
"   6. 해당 디렉토리에 vimrc 와 README.md 파일이 생성되어 있으면 성공.
"
"   - 로컬의 파일을 git repository에 add 할 경우
"           git add .    " 로컬폴더의 내용을 추가한다.
"           git commit -m 'first commit'    " commit 을 한다.
"           git push -u origin main      " github에 올린다.
"
"   기본 명령.
"   git 설치 후 setup.
"   git config --global user.email "younguk.ko@gmail.com"
"   git config --global user.name "your name" : PC 마다 다르게 설정하면 될듯.
"   git config --global --add safe.directory '*'  : 퍼미션 에러 날 경우.
"   git config --global http.sslVerify false : proxy 환경.
"   
"   git fetch : 소스만 가져오기
"   git pull : fetch + merge  " 서버의 최신을 가져와서 현재 소스와 머지.
"
"   git push할때 아래와 같은 에러 일 경우
"   오류의 원인은 처음 만들고 원격 저장소에 대한 기본 브랜치 설정을 안 해줬기 때문입니다. 
"   이런 오류는 처음 브랜치 설정만 해주면 간단하게 해결이 가능합니다.
"   fatal: The current branch master has no upstream branch.
"   To push the current branch and set the remote as upstream, use
"   git push --set-upstream origin master
"
"   - 브렌치 머지
"   main base 이고 master branch 에서 변경사항을 main에 병합.Merge.
"
"   git branch "  현재 선택된 브렌치 정보. *이 선택된 branch임.
"
"   $ git checkout main
"   Switched to branch 'main'
"   Your branch is up to date with 'origin/main'.
"
"   young@LAPTOP-LFCJGSGN MINGW64 ~/vimfiles (main)
"   $ git merge master
"   Updating 35753dc..0e6434d
"   Fast-forward
"    vimrc | 22 +++++++++++++++++++---
"    1 file changed, 19 insertions(+), 3 deletions(-)
"
"   $ git branch -d master      
"   Deleted branch master (was 0e6434d).
"
"//-------------------------------------------------------------------
"   Git bash 팁. git 설치시 git bash 가 같이 설치됨. linux bash 와 동일.
"   $HOME 디렉토리에 .bashrc 만들고 alias 사용가능.
"   전체 설정을 위해서는 /etc/bash.bashrc 를 변경.
"   alias vi='/c/Program\ Files/Vim/vim90/gvim.exe &'
"   
"   ln $HOME/vimfiles/bashrc $HOME/bashrc  " hard link 

