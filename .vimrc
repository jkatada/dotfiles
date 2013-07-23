"--------------------------------------------------------------------------
" 基本設定
" 
" viとの互換をとらない
set nocompatible
" vim設定をgithubで管理するために、dotfiles配下を指定する。
set runtimepath+=$HOME/dotfiles/vimfiles,$HOME/dotfiles/vimfiles/after
" スクリプト内のエンコーディング設定
scriptencoding utf-8

"--------------------------------------------------------------------------
" NeoBundle
"
" プロキシ内環境を考慮してプロトコルをgit://からhttps://に変更
let g:neobundle_default_git_protocol='https'

if has('vim_starting')
    set runtimepath+=~/dotfiles/vimfiles/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/dotfiles/vimfiles/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kannokanno/previm'

"filetype plugin indent on

NeoBundleCheck

"--------------------------------------------------------------------------
" open-browser
"
" \wでカーソル下のURLを開く
nmap <Leader>w <Plug>(openbrowser-smart-search)

"--------------------------------------------------------------------------
" vim-quickrun
"
let g:quickrun_config = {}
 
"--------------------------------------------------------------------------
" zencoding
" 
" 生成されるHTMLのlangをjaに設定(デフォルトはen)
let g:user_zen_settings = {
\   'lang' : 'ja',
\}

"--------------------------------------------------------------------------
" 一般
" 
" コマンド、検索パターンを50個まで履歴に残す
set history=50
"--------------------------------------------------------------------------
" 検索関連
" 
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻らない
set nowrapscan
" 検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch
"--------------------------------------------------------------------------
" 装飾関連
" 
"行番号を表示させる
set number
" タイトルをウインドウ枠に表示
set title
" ルーラーを表示
set ruler
" タブや改行を表示しない
set nolist
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに表示する情報の指定
set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>
" ステータスラインの色
hi StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
" ハイライト
if &t_Co > 2 || has("gui_running")
    " シンタックスハイライトを有効にする
    syntax on
    " 検索結果文字列のハイライトを有効にする
    set hlsearch
endif
"--------------------------------------------------------------------------
" 編集、文書整形関連
" 
" backspaceキーの挙動を設定する
" indent    : 行頭の空白の削除を許す
" eol        : 改行の削除を許す
" start        : 挿入モードの開始位置での削除を許す
set backspace=indent,eol,start
" 新しい行を直前の行と同じインデントにする
set autoindent
" Tab文字を画面上の見た目で何文字幅にするか設定
set tabstop=4
" cindentやautoindent時に挿入されるタブの幅
set shiftwidth=4
" Tabキー使用時にTabでは無くホワイトスペースを入れたい時に使用する
" この値が0以外の時はtabstopの設定が無効になる
set softtabstop=0
" Tab文字を空白に置き換えない
set noexpandtab
" オートインデントを有効にする
set cindent
"--------------------------------------------------------------------------
" ファイル関連
" 
" nobackup
" バックアップファイルを作成しない
set nobackup
"--------------------------------------------------------------------------
" 国際化関連
" 
" 文字コードの設定
" fencsの記述にはeuc-jp（encの値）は一番最後に記述する必要がある
" vimはファイルのオープン時にfencsの値を先頭から参照していき、fencsと値が
" 一致したエンコーディングでファイルをオープンする
" この時、一致しなくともencで指定されたエンコーディングが現れると無条件で
" そのエンコーディングでファイルを開いてしまうため
"set encoding=sjis
"set termencoding=euc-jp
"set fileencoding=euc-jp
"set fileencodings=ucs-bom,iso-2022-jp,utf-8,ucs-2le,ucs-2,cp932,euc-jp
"--------------------------------------------------------------------------
" マップ定義
" 
" 今は何もなし

"--------------------------------------------------------------------------
" オートコマンド
" 
if has("autocmd")
    " プラグイン、ファイルタイプ別インデントを有効
    filetype plugin indent on
    " textファイルのカラムを78に設定
    autocmd FileType text setlocal textwidth=78
    " カーソル位置を記憶しておく
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
	" 拡張子に対するfiletype設定
	au BufNewFile,BufRead *.md set filetype=markdown

	" 全角スペースの強調表示設定
	augroup IdegraphicSpace
		autocmd!
		autocmd ColorScheme * highlight IdeographicSpace term=underline cterm=underline gui=underline ctermfg=LightGray guifg=LightGray
		autocmd VimEnter,WinEnter * match IdeographicSpace /　/
	augroup END
	colorscheme default

endif " has("autocmd")

"--------------------------------------------------------------------------
" 不可視文字の強調表示設定
"
set lcs=eol:↲,tab:>.,extends:\
set list
highlight SpecialKey cterm=NONE ctermfg=LightGray guifg=LightGray
highlight NonText cterm=NONE ctermfg=LightGray guifg=LightGray

"--------------------------------------------------------------------------
" Function定義
" 
" GetStatusEx
" ステータス表示用function
function! GetStatusEx()
    let str = ''
    let str = str . '[' . &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
    let str = '[' . &fileencoding . ':' . str
    endif
    return str
endfunction

