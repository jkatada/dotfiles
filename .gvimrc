scriptencoding utf-8
"--------------------------------------------------------------------------
" カラースキームの設定(GUI)
"
if has("mac")
  colorscheme solarized
  set background=dark
  " F5でdark, light をチェンジ
  call togglebg#map("<f5>")
elseif has("unix")
  colorscheme solarized
  set background=dark
  " F5でdark, light をチェンジ
  call togglebg#map("<f5>")
elseif has("win32")
  colorscheme solarized
  set background=dark
  " F5でdark, light をチェンジ
  call togglebg#map("<f5>")
endif

"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
  " Windows用
  set guifont=MS_Gothic:h12:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka-Mono:h14
  " 行間隔の設定
  set linespace=1
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" ウインドウの幅
set columns=100
" ウインドウの高さ
set lines=65
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=NONE guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
endif

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide

"---------------------------------------------------------------------------
" メニューに関する設定:
"
if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif

"---------------------------------------------------------------------------
" 印刷に関する設定:
"
" 印刷用フォント
if has('printer')
  if has('win32')
    set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
  if has('mac')
    set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif
