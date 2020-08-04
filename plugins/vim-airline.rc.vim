set laststatus=2
" Powerline系フォントを利用する
let g:airline_powerline_fonts = 1
" theme
let g:airline_theme = 'molokai'
" タブを有効化する
let g:airline#extensions#tabline#enabled = 1
" タブに番号を表示する
let g:airline#extensions#tabline#buffer_idx_mode = 1
" タブの切替キーバインド
nmap <C-left> <Plug>AirlineSelectPrevTab
nmap <C-right> <Plug>AirlineSelectNextTab

let g:airline#extensions#whitespace#mixed_indent_algo = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" タブの区切り文字を指定する
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
" let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

