"共通
set nocompatible
colorscheme desert
syntax on
filetype on
filetype indent on
filetype plugin on
"set t_Co=256
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,euc-jp,sjis,ucs-2,cp932,iso2022-jp
set fileformats=unix,dos,mac
set imdisable
set backspace=indent,eol,start
set formatoptions+=m
set visualbell
"コマンド補完
set wildmenu
set wildmode=list:full
"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vim/backup/
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"クリップボードをWindowsと連携
set clipboard=unnamed
"スワップファイル用のディレクトリ
set directory=$HOME/.vim/backup
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"検索文字をハイライト
set hlsearch
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
"set smarttab
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループ
set wrapscan
"入力中のコマンドをステータスに表示する
set showcmd
"ステータスラインを常に表示
set laststatus=2
"ステータスラインに文字コードと改行文字を表示する
if winwidth(0) >= 120
 set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[%F]%=%l\/%L
else
 set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[%F]%=%l\/%L
endif
"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
".rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead Rakefile  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.cc  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.h  set nowrap tabstop=2 shiftwidth=2
"全角スペースを視覚化
highlight ZenkakuSpace ctermbg=240 guibg=240
au BufNewFile,BufRead * match ZenkakuSpace /　/
"Migemo
if has('migemo')
    set migemo
    set migemodict=/opt/local/share/migemo/utf-8/migemo-dict
endif

imap <C-Space> <C-x><C-o>
nmap <Space> :bn<CR>
"miniBuf
:let g:miniBufExplMapWindowNavVim = 1
:let g:miniBufExplMapWindowNavArrows = 1
:let g:miniBufExplMapCTabSwitchBuffs = 1
