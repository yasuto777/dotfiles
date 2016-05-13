" Yasuto's vimrc
"        _                    
" _   __(_)___ ___  __________
"| | / / / __ `__ \/ ___/ ___/
"| |/ / / / / / / / /  / /__  
"|___/_/_/ /_/ /_/_/   \___/  
"                             

" {{{ Background transparent
if !has('gui_running')
	augroup trans
		autocmd!
		autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
		autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
		autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
		autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
		autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
	augroup END
endif
" }}}

" {{{ 基本設定 

" Vim mode
set nocompatible
set notimeout
set ttimeout
set timeoutlen=100

" 文字コードをUTF-8
set encoding=utf-8

"行数表示
set number

" vimの無名レジスタとクリップボードを連携
set clipboard=unnamed

"======================="
" Fold setting
"======================="

set foldmethod=marker
"set foldtext=MyFoldText()
function MyFoldText()
	let line = getline(v:foldstart)
	let foldlinecount = v:foldend - v:foldstart
endfunction

" tab文字と行末文字の設定
set list
set listchars=eol:<,tab:>.

"ソフトタブ無効
set noexpandtab

"======================="
" Indent setting
"======================="
"インデント時にインデントする文字数
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
" C言語スタイルのインデント
set cindent

"補完
set wildmenu wildmode=list:full

set nohlsearch
set cursorline

" ファイルタイプによるスニペットを有効化
filetype on

" カーソル位置の記憶
augroup vimrcEx
	  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
		  \ exe "normal g`\"" | endif
	augroup END 

" 余裕を持ってスクロールする
set scrolloff=5

" ビープ音無効
set visualbell t_vb=
set noerrorbells

" }}}

" {{{ プラグインの設定

" quickrunの出力をスプリットで開く
let g:quickrun_config={'*': {'split': ''}}
" 縦分割時は右に,横分割時は下に新しいウィンドウを開く
set splitright
set splitbelow

" vim-splashの設定
let g:splash#path = expand("~/.dotfiles/.vim" . '/splash.txt')

"  }}}

" マッピング {{{

"ノーマルモード時にエンターキーで改行挿入
noremap <CR> o<ESC>

" ノーマルモード時にスペースキーで半角スペース挿入
"noremap <space> i<space><ESC>l

" }}}

"{{{ bundle関連
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'

"コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" 起動時にAAやらメッセージ表示
NeoBundle 'thinca/vim-splash'

" html編集
NeoBundle 'mattn/emmet-vim'

" クイックラン
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {'*': {'hook/time/enable': '1'}, }

" Golang
NeoBundle 'fatih/vim-go'

" Solarized
NeoBundle 'altercation/vim-colors-solarized'

" Nginx syntax highlight
NeoBundle 'evanmiller/nginx-vim-syntax'

call neobundle#end()

"未インストールのプラグインがある場合、インストールするか確認
NeoBundleCheck

filetype plugin indent on

syntax enable 
colorscheme solarized
set background=dark
let g:solarized_termcolors=256
" }}}

" {{{neocomplcache
let g:neocomplcache_enable_at_startup = 1
" }}}

