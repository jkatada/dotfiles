"--------------------------------------------------------------------------
" 基本設定
" 
" 文字コード設定
set encoding=utf-8
" viとの互換をとらない
set nocompatible
" vim設定をgithubで管理するために、dotfiles配下を指定する。
set runtimepath+=$HOME/dotfiles/vimfiles,$HOME/dotfiles/vimfiles/after
" スクリプト内のエンコーディング設定
scriptencoding utf-8

"--------------------------------------------------------------------------
" VimProcのWindowsバイナリを自動でダウンロードする。VimProcより前に設定が必要
let g:vimproc#download_windows_dll = 1

"--------------------------------------------------------------------------
" NeoBundle
"
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
   set nocompatible               " Be iMproved
endif

" プロキシ内環境を考慮してプロトコルをgit://からhttps://に変更
let g:neobundle_default_git_protocol='https'

if has('vim_starting')
    set runtimepath+=~/dotfiles/vimfiles/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/vimfiles/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/vimfiler'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'kannokanno/previm'
NeoBundle 'othree/eregex.vim'
"NeoBundle 'vim-scripts/buftabs'
" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()
  
filetype plugin indent on

NeoBundleCheck

"--------------------------------------------------------------------------
" vimfiler
"
" netrwの代わりにVimFilerをデフォルトで起動する
let g:vimfiler_as_default_explorer = 1
" セーフモードをデフォルトでオフにする
let g:vimfiler_safe_mode_by_default = 0
" :Unite bookmark を VimFilerで開く
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')

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
\   'lang' : 'ja',
\}

"--------------------------------------------------------------------------
" matchit
"
" % での対応するブレースや括弧に飛ぶ機能を、HTML, XMLタグなどに対応させる
"
:source $VIMRUNTIME/macros/matchit.vim

"--------------------------------------------------------------------------
" Fontzoom
" デフォルトのキーマップを無効化
let g:fontzoom_no_default_key_mappings = 1 
" Ctrl-↑、Ctrl-↓ で拡大縮小
nnoremap <C-Up> :Fontzoom +1<CR>
nnoremap <C-Down> :Fontzoom -1<CR>
" ホイールでの拡大縮小(Windowsでは動かない)
nnoremap <C-ScrollWheelUp> :Fontzoom +1<CR>
nnoremap <C-ScrollWheelDown> :Fontzoom -1<CR>

"--------------------------------------------------------------------------
" buftabs
"
" バッファタブにパスを省略してファイル名のみ表示する
"let g:buftabs_only_basename=1
" バッファタブをステータスライン内に表示する
"let g:buftabs_in_statusline=1
" 現在のバッファをハイライト
"let g:buftabs_active_highlight_group="Visual"
" ステータスライン
"set statusline=%=\[%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%03l,%03v]
" ステータスラインを常に表示
"set laststatus=2
" ステータスラインの色
"hi StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
" 
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
" Tab文字を空白に置き換える
set expandtab
" オートインデントを有効にする
set cindent
" ヤンクでクリップボードにコピー
set clipboard=unnamed
" 数値インクリメントを常に10進数にする。
" アルファベットのインクリメントを有効化
set nrformats=alpha
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
"  バッファの移動
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>
" markdownハイライトをオンにする
noremap <f4> :set filetype=markdown<CR>
" for exregex.vim
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

"--------------------------------------------------------------------------
" ファイル読み込み時の設定
"
" プラグイン、ファイルタイプ別インデントを有効
filetype plugin indent on
" textファイルのカラムを78に設定
autocmd FileType text setlocal textwidth=78
" カーソル位置を記憶しておく
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

augroup Markdown
    autocmd!
    " 拡張子に対するfiletype設定
    au BufNewFile,BufRead *.md set filetype=markdown
    " markdownで、アンダースコアやアスタリスクによるイタリック強調を解除
    autocmd FileType markdown hi! def link markdownItalic Normal
    " markdownで、アンダースコアに色がつかないように設定
    autocmd FileType markdown hi! def link markdownError Normal
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
" 不可視文字の強調表示設定
set lcs=eol:↲,tab:>.,extends:\
set list

" 全角スペースの強調表示設定
augroup IdegraphicSpace
    autocmd!
    " ColorSchemeを変更したときにも全角スペースを表示するようにautocmdを使う
    autocmd ColorScheme * highlight IdeographicSpace term=underline cterm=underline gui=underline ctermfg=brown guifg=brown
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

"--------------------------------------------------------------------------
" カラースキームの設定(CUI)
"
if has("mac")
    if has("gui_running")
        " MacのGUIは.gvimrcで設定するが、ここでcolorschemeを設定しないとエラーが
        " でる
        colorscheme default
    else
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
        colorscheme default
        highlight SpecialKey cterm=NONE ctermfg=LightGray
        highlight NonText cterm=NONE ctermfg=LightGray
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

" ドラッグアンドドロップでもタブで開く
" 挙動が妙になるので保留
"autocmd VimEnter * tab all
"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'

"--------------------------------------------------------------------------
"  セッション設定
"
" GUIのVIMのみセッションの読み込み・保存を行う
if has("gui_running")
    " Vim終了時に現在のセッションを保存する
    au VimLeave * mks!  ~/vimsession

    "引数なし起動の時でセッションファイルが存在する場合、前回のsessionを復元
    autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 && filereadable(expand("~/vimsession")) | source ~/vimsession | endif
    function! s:GetBufByte()
        let byte = line2byte(line('$') + 1)
        if byte == -1
            return 0
        else
            return byte - 1
        endif
    endfunction
endif
