set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" let NeoBundle manage NeoBundle
" required! 
NeoBundle 'Shougo/neobundle.vim'
" recommended to install
NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ynkdir/vim-guess'
"
filetype plugin indent on     " required!

"---------------------------------------------------------------------------
" インデントに関する設定

" ファイル内の <Tab> が対応する空白の数
set tabstop=2

" 自動インデントの各段階に使われる空白の数
set shiftwidth=2

" タブをスペースに展開しない (expandtab:展開する)
set expandtab

" g0: C++ でアクセス修飾子の指定時はインデントしない
" l1: caseラベルそのものを基本にしてインデントする
set cinoptions=g0l1

"---------------------------------------------------------------------------
" 編集に関する設定:

" バックスペースキーの動作を決定する
set backspace=indent,eol,start

" Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch

" コマンドライン補完するときに強化されたものを使う (参照 :help wildmenu)
set wildmenu

" バックアップを取らない (backup:バックアップを取る)
set nobackup

"---------------------------------------------------------------------------
" 表示に関する設定:

" 色分け有効
syntax on

" 見やすい色を表示するようにVimに背景色を教える
set background=dark

" ウィンドウの幅を超える行の折り返さない (wrap:折り返す)
set nowrap

" ルーラー(カーソルが何行目の何列目に置かれているか)を表示する (noruler:非表示)
set ruler

" 行番号を表示 (number:表示)
set number

" タブや改行などの不可視文字を表示する (nolist:非表示)
set list

" 不可視文字の表示文字の設定
set listchars=tab:>_,extends:>,trail:_,precedes:<,eol:<

" コマンドをステータスラインに表示
set showcmd

" コマンドラインで使用するウィンドウの高さ
set cmdheight=2

" 常にステータスラインのウィンドウを表示 (詳細は:he laststatus)
set laststatus=2

" タイトルを表示
set title

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase

" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

" 検索後をハイライトする
set hlsearch

" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan

"---------------------------------------------------------------------------
" エンコーディング
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,eucjp-ms,cp932
set encoding=utf-8

"---------------------------------------------------------------------------
" キーバインド
nnoremap <space><space> :source ~/.vimrc<CR>
