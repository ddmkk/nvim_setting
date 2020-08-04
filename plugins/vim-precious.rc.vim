" カーソル移動時の自動切り替えを無効化
" このオプションは filetype ごとに設定可能
" "*" は全ての filetype に影響する
let g:precious_enable_switch_CursorMoved = {
\   "*" : 0
\}
let g:precious_enable_switch_CursorMoved_i = {
\   "*" : 0
\}

" insert に入った時にスイッチし、抜けた時に元に戻す
augroup test
  autocmd!
  autocmd InsertEnter * :PreciousSwitch
  autocmd InsertLeave * :PreciousReset
augroup END
