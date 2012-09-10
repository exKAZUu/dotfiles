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
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive.git'
" color schemas
NeoBundle 'tomasr/molokai'
NeoBundle 'fugalh/desert.vim'
NeoBundle 'altercation/solarized'
" NeoBundle 'ynkdir/vim-guess'
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

" カラースキーマを設定
colorscheme molokai

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
" indent-guides

let g:indent_guides_enable_on_vim_startup = 1

"---------------------------------------------------------------------------
" キーバインド
nnoremap <space><space> :source ~/.vimrc<CR>

" --------------------------------------------------
" NeoComplCache
" --------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" --------------------------------------------------
" NeoComplCache Snippets Complete
" --------------------------------------------------
" Location for snippets
let g:neocomplcache_snippets_dir='~/.vim/snippets'
 
" Keymap for snippet
imap <C-k> <plug>(neocomplcache_snippets_expand)
smap <C-k> <plug>(neocomplcache_snippets_expand)
