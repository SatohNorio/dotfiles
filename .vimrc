" ***** 基本設定 *****
set ruler	" ルーラー表示
set number	" 行番号表示
set title	" ファイル名表示
" set autoindent	" 自動でインデントする
" set smartindent	" スマートインデント
" set modeline

" ***** 色 *****
" 行番号の色を設定
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid
set cursorline				" カーソルラインを表示
hi clear CursorLine
syntax on	" 文法毎に色分けする

" ***** 検索 *****
set hlsearch            " 検索マッチテキストをハイライト
nmap <silent> <Esc><Esc> :nohlsearch<CR>	" ESC を二回押すとハイライトを消す

" ***** TAB, EOL 可視化
set list
set listchars=tab:>-,extends:<,trail:-,eol:<

" ***** クリップボード *****
set clipboard+=unnamed	" GUI のクリップボードを使用する

"ステータスラインにコマンドを表示
" set showcmd
"ステータスラインを常に表示
" set laststatus=2
"ファイルナンバー表示
" set statusline=[%n]
"ホスト名表示
set statusline+=%{matchstr(hostname(),'\\w\\+')}@
"ファイル名表示
set statusline+=%<%F 
"変更のチェック表示
" set statusline+=%m
"読み込み専用かどうか表示
set statusline+=%r
"ヘルプページなら[HELP]と表示
set statusline+=%h
"プレビューウインドウなら[Prevew]と表示
set statusline+=%w
"ファイルフォーマット表示
set statusline+=[%{&fileformat}]
"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"ファイルタイプ表示
" set statusline+=%y
