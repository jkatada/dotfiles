set encoding=utf-8
set fileencodings=utf-8,ms932,iso-2022-jp,euc-jp
scriptencoding utf-8

"--------------------------------------------------------------------------
" 基本設定
"
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
   set nocompatible
endif

" vim設定をgithubで管理するために、dotfiles配下を指定する。
set runtimepath+=$HOME/dotfiles/vimfiles,$HOME/dotfiles/vimfiles/after

" Beep音オフ
set belloff=all

"--------------------------------------------------------------------------
" VimProcのWindowsバイナリを自動でダウンロードする。VimProcより前に設定が必要
let g:vimproc#download_windows_dll = 1

"--------------------------------------------------------------------------
" dein.vim
"
let s:dein_dir = expand('~/dotfiles/vimfiles/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_repo_dir

" 設定開始
call dein#begin(s:dein_dir)

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
  \ 'build' : {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'linux' : 'make',
  \     'unix' : 'gmake',
  \    },
  \ })
call dein#add('Shougo/vimfiler')
call dein#add('mattn/emmet-vim')
call dein#add('tyru/open-browser.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('thinca/vim-fontzoom')
call dein#add('kannokanno/previm')
call dein#add('othree/eregex.vim')
call dein#add('altercation/vim-colors-solarized')

" 設定終了
call dein#end()

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


"--------------------------------------------------------------------------
" vimfiler
"
" netrwの代わりにVimFilerをデフォルトで起動する
let g:vimfiler_as_default_explorer = 1
" セーフモードをデフォルトでオフにする
let g:vimfiler_safe_mode_by_default = 0

"--------------------------------------------------------------------------
" open-browser
"
" gxでカーソル下のURLを開く、または単語を検索
let g:netrw_nogx = 1 " netrwのgx(ULRを開く)を無効化
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"--------------------------------------------------------------------------
" vim-quickrun
"
let g:quickrun_config = {}

"--------------------------------------------------------------------------
" emmet
"
" 生成されるHTMLのlangをjaに設定(デフォルトはen)
let g:user_emmet_settings = {
\    'variables' : {
\        'lang' : 'ja',
\    },
\}

"--------------------------------------------------------------------------
" matchit
"
" % での対応するブレースや括弧に飛ぶ機能を、HTML, XMLタグなどに対応させる
"
:source $VIMRUNTIME/macros/matchit.vim

"--------------------------------------------------------------------------
" for eregex.vim
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

"--------------------------------------------------------------------------
" Previm
"
" Windowsでrstの保存時にvimproc関連でエラーが出るためdisableにする
let g:previm_disable_vimproc = 1

"--------------------------------------------------------------------------
" 一般
"
" コマンド、検索パターンを50個まで履歴に残す
set history=50
" 起動画面を表示しない
set shortmess+=I

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
" ハイライト
if &t_Co > 2 || has("gui_running")
    " シンタックスハイライトを有効にする
    syntax on
    " 検索結果文字列のハイライトを有効にする
    set hlsearch
endif
" ステータスライン
set statusline=%F%m%r%h%w\%=\[%{(&fenc!=''?&fenc:&enc)}/%{&ff}][%Y]\[%03l,%03v][%p%%]
" ステータスラインを常に表示
set laststatus=2
" ステータスラインの色
hi StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

"--------------------------------------------------------------------------
" 編集、文書整形関連
"
" backspaceキーの挙動を設定する
" indent    : 行頭の空白の削除を許す
" eol       : 改行の削除を許す
" start     : 挿入モードの開始位置での削除を許す
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
" Tab文字を空白に置き換える
set expandtab
" オートインデントを有効にする
set cindent
" ヤンクでクリップボードにコピー
if has("mac")
    set clipboard=unnamed
elseif has("unix")
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
" 数値インクリメントを常に10進数にする。
" アルファベットのインクリメントを有効化
set nrformats=alpha

"--------------------------------------------------------------------------
" 折りたたみ関連
"
" 初期では全ての折りたたみを開く
set foldlevel=1000
" markdwonの折りたたみを有効化。
" vimデフォルトのプラグイン実行前に設定するため、ftpluginではなくここで指定
let g:markdown_folding = 1

"--------------------------------------------------------------------------
" ファイル関連
"
" バックアップファイルを一箇所にまとめる
set backupdir=$HOME/dotfiles/vimfiles/tmp/backup
" スワップファイルを一箇所にまとめる
set directory=$HOME/dotfiles/vimfiles/tmp/swap
" undoファイルを一箇所にまとめる
set undodir=$HOME/dotfiles/vimfiles/tmp/undodir

"--------------------------------------------------------------------------
" マップ定義
"
" バッファの移動
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>
" markdownハイライトをオンにする
noremap <f4> :set filetype=markdown<CR>
" 編集中ファイルをOSでデフォルト設定されているアプリケーションで開く
if has("mac")
  noremap <f7> :! open %<CR>
elseif has("win32")
  noremap <f7> :! start %<CR>
endif

" visualモードで連続インデントするために、インデント後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" 折りたたみのトグルをスペースに割り当て
nnoremap <Space> za

"--------------------------------------------------------------------------
" ファイル読み込み時の設定
"
" プラグイン、ファイルタイプ別インデントを有効
filetype plugin indent on
" カーソル位置を記憶しておく
augroup CursolLocation
    autocmd!
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

"--------------------------------------------------------------------------
" 日本語関連
"
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
"画面最後の行をできる限り表示する。
set display+=lastline

"--------------------------------------------------------------------------
" 文字表示関連
"
" 不可視文字の表示設定(改行は非表示、行末半角スペースを背景色違いで表示)
" 改行に←のようなマルチバイト文字は不可(MacVimでフォントがおかしくなる)
set lcs=eol:\ ,trail:\ ,tab:>.,extends:\
set list
" 　  
" 全角スペースの強調表示設定
augroup IdeographicSpace
    autocmd!
    " ColorSchemeを変更したときにも全角スペースを表示するようにautocmdを使う
    autocmd ColorScheme * highlight IdeographicSpace term=underline cterm=underline gui=underline ctermfg=brown guifg=brown
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

"--------------------------------------------------------------------------
" カラースキームの設定(CUI)
"
if has("mac")
    if !has("gui_running")
        " MacのCUI設定
        set background=dark
        colorscheme solarized
        let g:solarized_termcolors=256
        " F5でdark, light をチェンジ
        call togglebg#map("<f5>")
        "highlight SpecialKey cterm=NONE ctermfg=LightGray
        "highlight NonText cterm=NONE ctermfg=LightGray
    endif
elseif has("unix")
    if $TERM == "cygwin"
        " Cygwin
        colorscheme default
        highlight SpecialKey cterm=NONE ctermfg=Brown
        highlight NonText cterm=NONE ctermfg=Brown
    else
        " UNIXのCUI設定
        if !has("gui_running")
            set background=dark
            colorscheme solarized
            " F5でdark, light をチェンジ
            call togglebg#map("<f5>")
        endif
    endif
elseif has("win32")
elseif has("win64")
endif

"--------------------------------------------------------------------------
"  タブ設定
"
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>

"--------------------------------------------------------------------------
"  セッション設定
"
" GUIのVIMのみセッションの読み込み・保存を行う
if has("gui_running")
    augroup VimSession
        autocmd!
        " Vim終了時に現在のセッションを保存する
        autocmd VimLeave * mks!  ~/vimsession
        "引数なし起動の時でセッションファイルが存在する場合、前回のsessionを復元
        autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 && filereadable(expand("~/vimsession")) | source ~/vimsession | endif
    augroup END

    function! s:GetBufByte()
        let byte = line2byte(line('$') + 1)
        if byte == -1
            return 0
        else
            return byte - 1
        endif
    endfunction
endif

"--------------------------------------------------------------------------
"  マシンごとのローカル設定読み込み
"
if filereadable(expand($HOME.'/.localsetting/vimrc_local'))
  source $HOME/.localsetting/vimrc_local
endif
