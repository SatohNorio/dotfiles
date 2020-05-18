" vim:et:sw=2:ts=2

" Plugin configuration like the code written in vimrc.
" This configuration is executed *before* a plugin is loaded.
function! s:on_load_pre()
  " ***** lightline *****
  let g:lightline = {
    	\ 'colorscheme': 'hybrid',
    	\ 'separator': { 'left': '', 'right': '' },
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
          \ },
          \ 'component_function': {
          \   'modified': 'LightlineModified',
          \   'readonly': 'LightlineReadonly',
          \   'fugitive': 'LightlineFugitive',
          \   'filename': 'LightlineFilename',
          \   'fileformat': 'LightlineFileformat',
          \   'filetype': 'LightlineFiletype',
          \   'fileencoding': 'LightlineFileencoding',
          \   'mode': 'LightlineMode'
          \ }
      \ }
  
      "\ 'mode_map': {'c': 'NORMAL'},
  "" unicode symbols
  ""let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
  ""let g:airline_symbols.linenr = '¶'		"行
  ""let g:airline_symbols.maxlinenr = '㏑'		"最大行
  "let g:airline_symbols.maxlinenr = ''		"最大行
  ""let g:airline_symbols.branch = '⎇'		"gitブランチ
  ""let g:airline_symbols.paste = 'ρ'		"ペーストモード
  ""let g:airline_symbols.spell = 'Ꞩ'		"スペルチェック
  ""let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
  ""let g:airline_symbols.whitespace = 'Ξ'		"空白の警告(余分な空白など)
  "let g:airline_symbols.whitespace = ''		"空白の警告(余分な空白など)
  "
  "" powerline symbols
  ""let g:airline_left_sep = ''			" 左セパレータ
  ""let g:airline_left_alt_sep = ''		" 左セパレータ2
  ""let g:airline_right_sep = ''			" 右セパレータ
  ""let g:airline_right_alt_sep = ''		" 右セパレータ2
  "let g:airline_symbols.branch = ''		" git ブランチ
  "let g:airline_symbols.readonly = ''		" 読み取り専用
  ""let g:airline_symbols.linenr = '☰'		" 行
  ""let g:airline_symbols.maxlinenr = ''		" 最大行
endfunction

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFugitive()
"  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
"    return fugitive#head()
"  else
"    return ''
"  endif
  return fugitive#head()
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Plugin configuration like the code written in vimrc.
" This configuration is executed *after* a plugin is loaded.
function! s:on_load_post()
endfunction

" This function determines when a plugin is loaded.
"
" Possible values are:
" * 'start' (a plugin will be loaded at VimEnter event)
" * 'filetype=<filetypes>' (a plugin will be loaded at FileType event)
" * 'excmd=<excmds>' (a plugin will be loaded at CmdUndefined event)
" <filetypes> and <excmds> can be multiple values separated by comma.
"
" This function must contain 'return "<str>"' code.
" (the argument of :return must be string literal)
function! s:loaded_on()
  return 'start'
endfunction

" Dependencies of this plugin.
" The specified dependencies are loaded after this plugin is loaded.
"
" This function must contain 'return [<repos>, ...]' code.
" (the argument of :return must be list literal, and the elements are string)
" e.g. return ['github.com/tyru/open-browser.vim']
function! s:depends()
  return []
endfunction
