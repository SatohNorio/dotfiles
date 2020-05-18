" ***** 基本設定 *****
set ruler	" ルーラー表示
set number	" 行番号表示
set title	" ファイル名表示
set smartindent	" スマートインデント
set modeline	" モードラインを有効にする
set splitright	" 分割して新しいウィンドウを右側に表示

" ***** 検索 *****
set hlsearch            " 検索マッチテキストをハイライト
nmap <silent> <Esc><Esc> :nohlsearch<CR>	" ESC を二回押すとハイライトを消す

" ***** TAB, EOL 可視化
set list
set listchars=tab:>-,extends:<,trail:-,eol:<

" ***** クリップボード *****
set clipboard+=unnamed	" GUI のクリップボードを使用する

" ***** ステータスライン *****
set showcmd		" ステータスラインにコマンドを表示
set laststatus=2	" ステータスラインを常に表示
set ttimeoutlen=50	" NORMAL モードに戻るまでの時間
set noshowmode		" モードを表示しない

" lightline を使用する場合は無効にする
"set statusline=[%n]					"ファイルナンバー表示
"set statusline+=%{matchstr(hostname(),'\\w\\+')}@	"ホスト名表示
"set statusline+=%<%F 					"ファイル名表示
"set statusline+=%m					"変更のチェック表示
"set statusline+=%r					"読み込み専用かどうか表示
"set statusline+=%h					"ヘルプページなら[HELP]と表示
"set statusline+=%w					"プレビューウインドウなら[Prevew]と表示
"set statusline+=[%{&fileformat}]			"ファイルフォーマット表示
"set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]	"文字コード表示
"set statusline+=%y					"ファイルタイプ表示

" ***** キーマップの変更 *****
nnoremap gg ggz.

" ***** 色 *****
" 行番号の色を設定
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 	" Remove this line if using the default palette.
colorscheme hybrid
set cursorline				" カーソルラインを表示
hi clear CursorLine
syntax on	" 文法毎に色分けする

" ***** QuickFix *****
" vimgrep と合わせて使う
" 詳細は QuickFix のヘルプを参照 (https://vim-jp.org/vimdoc-ja/quickfix.html)
" :cn, :cN 次のエラー、前のエラー
" :ccl QuickFix の Window を閉じる
augroup QuickFixCmd
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

